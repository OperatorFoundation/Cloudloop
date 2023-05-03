import Foundation
import Cloudloop

public enum CloudloopResponse: Codable
{
    case success
    case sbdError(SBDErrorResult)
    case failure(reason: String)
    case messages(DataMOGetMessagesResult)
    case messagesLongPolled(DataMORetrieveMessageLongPollResult)
}

extension CloudloopResponse
{
    public var jsonData: Data?
    {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    public init(jsonData: Data) throws
    {
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(Self.self, from: jsonData)
        self = decoded
    }
}

public class SbdWorkflow
{
    public let token: String
    
    public init(token: String)
    {
        self.token = token
    }
    
    // TODO: subscriber name could be optional
    public func modemSetup(subscriberName: String, billingGroupName: String, imei: String, hardwareType: String = "IRIDIUM_SBD") -> (hardware: HardwareCreateHardwareResult, subscriber: SbdCreateSubscriberResult)?
    {
        print("Setting up \(hardwareType) modem...")
        // create hardware
        guard let createHardwareResult = Hardware().CreateHardware(token: token, imei: imei, type: hardwareType) else {
            print("Hardware could not be created.")
            return nil
        }
        
        // set the global variable for hardware ID
        let hardware = createHardwareResult.hardware.id
        
        // create subscriber
        guard let createSubscriberResult = Sbd().CreateSubscriber(token: token, hardware: hardware, name: subscriberName) else {
            print("Subscriber could not be created.")
            return nil
        }
                
        // create billingGroup
        guard let createBillingGroupResult = Account().CreateBillingGroup(token: token, name: billingGroupName) else {
            print("BillingGroup could not be created.")
            return nil
        }
        
        print("Created a billing group: \(createBillingGroupResult)")
        
        // get and print plans
        guard let getPlansResult = Sbd().GetPlans(token: token) else {
            print("could not get plans")
            return nil
        }
        
        // give plan options so that you can call Sbd().ActivateSubscriber afterwards
        let plans = getPlansResult.plans
        print("Here are your plan options: \n")
        for plan in plans {
            print(plan)
            print("\n")
        }
        
        print("Modem setup complete. \nSubscriber: \(createSubscriberResult)\nHardware: \(createHardwareResult)")
        return(createHardwareResult, createSubscriberResult)
    }
    
    public func modemAssign(planName: String, subscriber: String, billingGroup: String)
    {
        // activate subscriber with chosen plan
        guard Sbd().ActivateSubscriber(token: token, subscriber: subscriber, plan: planName) != nil else {
            print("Subscriber activation failed")
            return
        }
        
        // assign billingGroup
        guard Sbd().AssignBillingGroup(token: token, subscriber: subscriber, billingGroup: billingGroup) != nil else {
            print("Billing Group could not be assigned.")
            return
        }
    }
    
    public func modemShutdown(imei: String)
    {
        do
        {
            guard let getSubscriberResult = try Sbd().GetSubscriber(token: token, imei: imei) else
            {
                print("Could not find Subscriber with provided info.")
                return
            }
            
            guard Sbd().DeactivateSubscriber(token: token, subscriber: getSubscriberResult.subscriber.id) != nil else
            {
                print("failed to deactivate subscriber")
                return
            }
        }
        catch
        {
            print("Modem Shutdown Error: \(error)")
        }
    }

    
    /// This function requires that you provide the IMEI of the device that will be sending the messages to the new destination
    ///  This is not necessary for sending messages from internet enabled devices (iphone, etc.)
    /// destination: String - What is supplied will vary on the type requested
    /// type: String - DIRECT_IP, EMAIL, IMEI, CLOUDLOOP
    ///
    public func newDestination(deviceIMEI: String, destination: String, type: String, moack: Bool = false, geodata: Bool = false) -> CloudloopResponse
    {
        print("Cloudloop.newDestination() called.")
        
        do
        {
            // This is information about the device/modem should not be used from a device that does not have a modem
            guard let subscriberResult = try Sbd().GetSubscriber(token: token, imei: deviceIMEI) else
            {
                let failure = "Get subscriber request failed"
                print(failure)
                return .failure(reason: failure)
            }
            
            // create new destination
            guard let result = Sbd().CreateDestination(token: token, subscriber: subscriberResult.subscriber.id, destination: destination, type: type, moack: moack, geodata: geodata) else
            {
                let failure = "Failed to create a new destination for subscriber \(subscriberResult.subscriber.id): Invalid destination"
                print(failure)
                return .failure(reason: failure)
            }
            
            if let errorResult = result as? SBDErrorResult
            {
                print("Received an error while attempting to add a new destination for \(subscriberResult.subscriber.id): \(errorResult)")
                
                return .sbdError(errorResult)
            }
            else
            {
                print("New destination created for \(subscriberResult.subscriber.id)")
                return .success
            }
        }
        catch
        {
            print("newDestination error: \(error)")
            
            if let errorResult = error as? SBDErrorResult
            {
                return .sbdError(errorResult)
            }
            else
            {
                return .failure(reason: error.localizedDescription)
            }
        }
    }
    
    public func sendMessage(payload: String, receiverIMEI: String, flushMT: Bool = false) -> CloudloopResponse
    {
        guard let hardwareResponse = Hardware().GetHardware(token: self.token, imei: receiverIMEI) else
        {
            let failureMessage = "Failed to get a valid hardware ID response for the provided IMEI: \(receiverIMEI)"
            print(failureMessage)
            return .failure(reason: failureMessage)
        }
        
        guard let result = DataMT().SendMessage(token: self.token, hardware: hardwareResponse.hardware.id, payload: payload, flushMT: flushMT) else
        {
            let failure = "DataMT().SendMessage() returned nil."
            print(failure)
            return .failure(reason: failure)
        }

        print("DataMT().SendMessage response: \(result)")
        return .success
    }
    
    /// This action is designed for receiving new messages from any Hardware in your account
    /// To retrieve messages from a specific subscriber use retrieveMessages() instead
    public func retrieveMessagesPolled(lastMessageRetrieved: String? = nil) -> CloudloopResponse
    {
        guard let result = DataMO().GetMessagesPolled(token: self.token, maxPollTime: 60, lastMessageReceived: lastMessageRetrieved) else {
            let failure = "Failed to retrieve messages: "
            print(failure)
            return .failure(reason: failure)
        }
        
        return .messagesLongPolled(result)
    }
    
    /// Use this action to retrieve mobile-originated (MO) messages for the specified Hardware within the specified date period.
    public func retrieveMessages(lastChecked: Date, senderIMEI: String) -> CloudloopResponse
    {
        // this needs to be in UTC
        let calendar = Calendar.current
        let nowUTC = Date()
        let dateRangeComponents = calendar.dateComponents([.day], from: lastChecked, to: nowUTC)
        guard let daysSinceLastChecked = dateRangeComponents.day else {
            return .failure(reason: "Couldn't calculate the days passed since last checked")
        }
        
        var from = lastChecked
//        if daysSinceLastChecked >= 10 {
//            print("Messages are only stored in the Iridium network for ten days")
//            print("Messages were last checked ten or more days ago.  Checking for messages received in the last ten days")
//            guard let tenDaysAgo = calendar.date(byAdding: .day, value: -10, to: currentLocalDate) else {
//                return .failure(reason: "Couldn't calculate ten days before current date")
//            }
//
//            from = tenDaysAgo
//        }
        
        let dateFormatter = Date.ISO8601FormatStyle()
        let formattedFrom = from.formatted(dateFormatter).dropLast(1)
        let formattedTo = nowUTC.formatted(dateFormatter).dropLast(1)
        
        guard let hardwareResponse = Hardware().GetHardware(token: self.token, imei: senderIMEI) else
        {
            let failureMessage = "Failed to get a valid hardware ID response for the provided IMEI: \(senderIMEI)"
            print(failureMessage)
            return .failure(reason: failureMessage)
        }
        
        guard let result = DataMO().GetMessages(token: self.token, hardware: hardwareResponse.hardware.id, from: String(formattedFrom), to: String(formattedTo)) else
        {
            let failure = "Failed to retrieve messages: "
            print(failure)
            return .failure(reason: failure)
        }
        
        return .messages(result)
    }
}
