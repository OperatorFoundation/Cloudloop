import Foundation
import Cloudloop

public enum SwitchboardResponse
{
    case success
    case sbdError(SBDErrorResult)
    case failure(reason: String)
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
        
        guard let getSubscriberResult = Sbd().GetSubscriber(token: token, subscriber: subscriberID, imei: imei) else {
            print("Could not find Subscriber with provided info.")
            return
        }
        let destinations = getSubscriberResult.subscriber.destinations
        for destination in destinations {
            let _ = Sbd().DeleteDestination(token: token, destination: destination.destination)
        }
        guard Sbd().DeactivateSubscriber(token: token, subscriber: subscriber) != nil else {
            print("failed to deactivate subscriber")
            return
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
    
    public func newDestination(nextDestination: String, type: String, moack: Bool = false, geodata: Bool = false) -> SwitchboardResponse
    {
        print("Cloudloop.newDestination() called.")
        
        guard let subscriberResult = Sbd().GetSubscriber(token: token, subscriber: subscriber, imei: imei) else
        {
            let failure = "Get subscriber request failed"
            print(failure)
            return .failure(reason: failure)
        }
        
        print("Cloudloop.newDestination: Retrieved the subscriber information: \(subscriberResult.subscriber.id)")
        
        // delete all previous destinations
        let destinations = subscriberResult.subscriber.destinations
        
        print("Cloudloop.newDestination: Subscriber has \(destinations.count) current destinations.")
        
        for destination in destinations
        {
            let destinationID = destination.id
            
            // If the current destination is already the same as the requested destination return success
            // TODO: Are we checking the right things?
            print("Current destination type \(destination.type) and ID \(destination.id)")
            print("requested destination type \(type) and id \(nextDestination)")

            if destination.type == type && destination.id == nextDestination
            {
                print("Current destination type \(destination.type) and destination ID \(destination.id) are the same as the requested type \(type) and id \(nextDestination)")
                return .success
            }
            
            print("Deleting destination: \(destination.destination)")
            
            guard Sbd().DeleteDestination(token: token, destination: destinationID) != nil else
            {
                let failure = "Delete destination request failed for destination ID \(destinationID)"
                print(failure)
                return .failure(reason: failure)
            }
        }

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
    
    public func setImei() {
        
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
