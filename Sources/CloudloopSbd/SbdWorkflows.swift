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
    public let imei: String
    public var billingGroup: String
    public var subscriber: String
    public var hardware: String
    
    public init(token: String, imei: String)
    {
        self.token = token
        self.imei = imei
        self.billingGroup = ""
        self.subscriber = ""
        self.hardware = ""
    }
    
    // TODO: subscriber name could be optional
    public func modemSetup(subscriberName: String, billingGroupName: String, hardwareType: String = "IRIDIUM_SBD") {
        // create hardware
        guard let createHardwareResult = Hardware().CreateHardware(token: token, imei: imei, type: hardwareType) else {
            print("Hardware could not be created.")
            return
        }
        
        // set the global variable for hardware ID
        hardware = createHardwareResult.hardware.id
        
        // create subscriber
        guard let createSubscriberResult = Sbd().CreateSubscriber(token: token, hardware: hardware, name: subscriberName) else {
            print("Subscriber could not be created.")
            return
        }
        
        // set the global variable for subscriber ID
        subscriber = createSubscriberResult.subscriber.id
        
        // create billingGroup
        guard let createBillingGroupResult = Account().CreateBillingGroup(token: token, name: billingGroupName) else {
            print("BillingGroup could not be created.")
            return
        }
        
        // set the global variable for billingGroup ID
        billingGroup = createBillingGroupResult.billingGroup.id
        
        // get and print plans
        guard let getPlansResult = Sbd().GetPlans(token: token) else {
            print("could not get plans")
            return
        }
        
        // give plan options so that you can call Sbd().ActivateSubscriber afterwards
        let plans = getPlansResult.plans
        print("Here are your plan options: \n")
        for plan in plans {
            print(plan)
            print("\n")
        }
    }
    
    public func modemAssign(planName: String)
    {
        // fetch the most updated information
        refreshInfo()
        
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
    
    public func modemShutdown(subscriberID: String) {
        // fetch the most updated information
        refreshInfo()
        
        do
        {
            guard let getSubscriberResult = try Sbd().GetSubscriber(token: token, imei: imei) else
            {
                print("Could not find Subscriber with provided info.")
                return
            }
            
//            let destinations = getSubscriberResult.subscriber.destinations
//
//            for destination in destinations
//            {
//                let _ = Sbd().DeleteDestination(token: token, destination: destination.destination)
//            }
            
            guard Sbd().DeactivateSubscriber(token: token, subscriber: subscriber) != nil else
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

    public func refreshInfo() {
        print("Cloudloop.refreshInfo() called")
        
        // call searchSubscriber using just the IMEI and store the most up to date variables
        guard let searchResult = Sbd().SearchSubscribers(token: token, query: imei, status: nil, hardware: nil) else
        {
            print("Could not get info with provided IMEI")
            return
        }
        
        // make sure that the IMEI has an associated subscriber

        if let subscribersResult = searchResult as? SbdSearchSubscribersResult, let subscriberResult = subscribersResult.subscribers.first
        {
            // set global variables to the most accessible information
            subscriber = subscriberResult.id
            hardware = subscriberResult.hardware
            billingGroup = subscriberResult.billingGroup
            
            print("""
                Subscriber ID set to \(subscriber)
                Your Hardware ID: \(hardware)
                Your Billing Group ID: \(billingGroup)
                """)
        }
        else if let errorResult = searchResult as? SBDErrorResult
        {
            print("Received an error result from SearchSubscribers: \(errorResult)")
        }
        else
        {
            print("Received an unexpected result from SearchSubscribers: \(searchResult)")
            return
        }
    }
    
    public func newDestination(nextDestination: String, type: String, moack: Bool = false, geodata: Bool = false) -> CloudloopResponse
    {
        refreshInfo()
        print("Cloudloop.newDestination() called.")
        
        do
        {
            guard let subscriberResult = try Sbd().GetSubscriber(token: token, imei: imei) else
            {
                let failure = "Get subscriber request failed"
                print(failure)
                return .failure(reason: failure)
            }
            
            print("Cloudloop.newDestination: Retrieved the subscriber information: \(subscriberResult.subscriber.id)")
            
            // create new destination
            guard let result = Sbd().CreateDestination(token: token, subscriber: subscriberResult.subscriber.id, destination: nextDestination, type: type, moack: moack, geodata: geodata) else
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
    
    public func setImei() {
        
    }
    
    public func sendMessage(payload: String, receiverIMEI: String, flushMT: Bool = false) -> CloudloopResponse
    {
        refreshInfo()
        
        guard let hardwareResponse = Hardware().GetHardware(token: self.token, imei: receiverIMEI) else
        {
            let failureMessage = "Failed to get a valid hardware ID response for the provided IMEI: \(imei)"
            print(failureMessage)
            return .failure(reason: failureMessage)
        }
        
        guard DataMT().SendMessage(token: self.token, hardware: hardwareResponse.hardware.id, payload: payload, flushMT: flushMT) != nil else
        {
            let failure = "Failed to send new message: "
            print(failure)
            return .failure(reason: failure)
        }
        
        return .success
    }
    
    public func retrieveMessagesPolled(lastMessageRetrieved: String? = nil) -> CloudloopResponse {
        refreshInfo()
        
        guard let result = DataMO().GetMessagesPolled(token: self.token, maxPollTime: 60, lastMessageReceived: lastMessageRetrieved) else {
            let failure = "Failed to retrieve messages: "
            print(failure)
            return .failure(reason: failure)
        }
        
        return .messagesLongPolled(result)
    }
    
    // THIS NEEDS TO BE IN UTC
    public func retrieveMessages(lastChecked: Date, senderIMEI: String) -> CloudloopResponse{
        refreshInfo()
        
        let calendar = Calendar.current
        let nowUTC = Date()
//        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
//        guard let currentLocalDate = calendar.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {
//            return .failure(reason: "Failed to fetch the local date")
//        }
        
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
            let failureMessage = "Failed to get a valid hardware ID response for the provided IMEI: \(imei)"
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

//    public func refreshMessages(messageCheckTime: Int32) {
//        // fetch the most updated information
//        refreshInfo()
//
//        let retrieveMessages = DataMO().GetMessagesPolled(token: token, maxPollTime: messageCheckTime, lastMessageReceived: "")
//        guard (retrieveMessages?.messages != nil) else {
//            print("No new messages!")
//            return
//        }
//        let messages = retrieveMessages!.messages
//        for message in messages {
//            print("""
//                New message!
//                Message ID: \(message.id)
//                Hardware ID: \(message.hardware)
//                Sent: \(message.txAt)
//                message: \(message.payload)
//
//                """)
//        }
//    }
//
//    public func sendMessage(recipients: [String], message: String) {
//
//        guard let messageResults = DataMT().SendMessage(token: token, hardware: "recipients", payload: message)?.requests else {
//            print("sendMessage failed")
//            return
//        }
//
//        for messageResult in messageResults {
//            guard messageResult.status == "QUEUED" else {
//                print("failed to send message to \(messageResult.hardware). message status: \(messageResult.status)")
//                return
//            }
//        }
// The query param for hardware might be an array itself.
//        for recipient in recipients {
//            guard DataMT().SendMessage(token: token, hardware: recipient, payload: message) != nil else {
//                print("Message failed to send.")
//                return
//            }
//        }
//    }
//
// delete after changing each function to call refreshInfo at the start
//    public func checkInfo(isSubscriber: Bool, isHardware: Bool, isBillingGroup: Bool) {
//        // Check to make sure subscriber is initialized if it is needed
//        if isSubscriber {
//            guard subscriber != "" else {
//                print("Subscriber ID not initialized.")
//                return
//            }
//        }
//
//        if isHardware {
//            guard hardware != "" else {
//                print("Hardware ID not initialized.")
//                return
//            }
//        }
//
//        if isBillingGroup {
//            guard billingGroup != "" else {
//                print("Billing Group ID not initialized.")
//                return
//            }
//        }
//    }
}
