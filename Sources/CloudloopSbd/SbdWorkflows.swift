import Foundation
import Cloudloop

class SbdWorkflow {
    
    let token: String
    var billingGroup: String
    var subscriber: String
    var hardware: String
    
    init(token: String) {
        self.token = token
        self.billingGroup = ""
        self.subscriber = ""
        self.hardware = ""
    }
    
    // TODO: subscriber name could be optional
    func modemSetup(imei: String, subscriberName: String, billingGroupName: String, hardwareType: String = "IRIDIUM_SBD") {
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
    
    func modemAssign(planName: String) {
        // check to make sure properties have been initialized
        checkInfo(isSubscriber: true, isHardware: false, isBillingGroup: true)
        
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
    
    //TODISCUSS: The workflow example for Telephony just calls deactivateSubscriber. If thats all we need to do, do we need a workflow for it?
//    func modemShutdown(imei: String, subscriberID: String) {
        // TODISCUSS: do we need to clear out all the destinations, or do they go away upon deactivation of subscriber?  Same for billing group.
//        guard let getSubscriberResult = Sbd().GetSubscriber(token: token, subscriber: subscriberID, imei: imei) else {
//            print("Could not find Subscriber with provided info.")
//            return
//        }
//        let destinations = getSubscriberResult.subscriber.destinations
//        for destination in destinations {
//            // Is it the destination name or ID that we need?@
//            let _ = Sbd().DeleteDestination(token: token, destination: destination.destination)
//        }
//        Account().DeleteBillingGroup(token: token, BillingGroup: billingGroup)
//        Sbd().DeactivateSubscriber(token: token, subscriber: subscriber)
//    }

    // TODO: One optimization that would be nice is for the setup to store the subscriber id and imei so get info doesnt need to take anything
    // TODISCUSS: Will we eventually hardcode the class properties?  If not, should I not require getInfo to be called to use other workflows? My approach ensures up to date info, but makes it reliant on getInfo()
    func getInfo(imei: String, subscriberID: String) {
        // call all the get function
        guard let getSubscriber = Sbd().GetSubscriber(token: token, subscriber: subscriber, imei: imei) else {
            print("Could not get subscriber information with the provided ID and IMEI.")
            return
        }
        
        // set global variables to the most accessible information
        subscriber = getSubscriber.subscriber.id
        hardware = getSubscriber.subscriber.hardware.id
        billingGroup = getSubscriber.subscriber.billingGroup
        
        // TODO: Since subscriber id is needed for the function, should we print it?
        // TODISCUSS: Do we want this function to also gather data about the destinations, or shall we put that in its own function?
        print("""
            Subscriber ID set to \(subscriber)
            Your Hardware ID: \(hardware)
            Your Billing Group ID: \(billingGroup)
            """)
        
    }
    
    func newDestination(previousDestination: String?, nextDestination: String, type: String, moack: Bool, geodata: Bool) -> String {
        // check for previous destination
        if previousDestination != nil {
            Sbd().DeleteDestination(token: token, destination: previousDestination!)
        }
        // create new destination
        Sbd().CreateDestination(token: token, subscriber: subscriber, destination: nextDestination, type: type, moack: moack, geodata: geodata)
        return nextDestination
    }
    
    func refreshMessages(messageCheckTime: Int32) {
        // FIXME: lastMessageReceived should be optional
        let retrieveMessages = DataMO().GetMessagesPolled(token: token, maxPollTime: messageCheckTime, lastMessageReceived: "")
        guard (retrieveMessages?.messages != nil) else {
            print("No new messages!")
            return
        }
        let messages = retrieveMessages!.messages
        for message in messages {
            print("""
                New message!
                Message ID: \(message.id)
                Hardware ID: \(message.hardware)
                Sent: \(message.txAt)
                message: \(message.payload)
                
                """)
        }
    }
    
    func sendMessage() {
        
    }
    
    func checkInfo(isSubscriber: Bool, isHardware: Bool, isBillingGroup: Bool) {
        // Check to make sure subscriber is initialized if it is needed
        if isSubscriber {
            guard subscriber != "" else {
                print("Subscriber ID not initialized.")
                return
            }
        }
        
        if isHardware {
            guard hardware != "" else {
                print("Hardware ID not initialized.")
                return
            }
        }
        
        if isBillingGroup {
            guard billingGroup != "" else {
                print("Billing Group ID not initialized.")
                return
            }
        }
    }
}
