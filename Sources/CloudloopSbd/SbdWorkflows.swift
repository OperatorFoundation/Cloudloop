import Foundation
import Cloudloop

class SbdWorkflow {
    
    let token: String
    let billingGroup: String
    let subscriber: String
    let hardware: String
    
    init(token: String) {
        self.token = token
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

    // TODO: subscriber name could be optional
    func modemSetup(imei: String, subscriberName: String, billingGroupID: String, hardwareType: String = "IRIDIUM_SBD") {
        // create hardware
        guard let createHardwareResult = Hardware().CreateHardware(token: token, imei: imei, type: hardwareType) else {
            print("Hardware could not be created.")
            return
        }
        
        // store hardware ID in a variable
        let hardwareID = createHardwareResult.hardware.id
        
        // create subscriber
        guard let createSubscriberResult = Sbd().CreateSubscriber(token: token, hardware: hardwareID, name: subscriberName) else {
            print("Subscriber could not be created.")
            return
        }
        
        let subscriberID = createSubscriberResult.subscriber.id
        
        // assign billingGroup
        guard Sbd().AssignBillingGroup(token: token, subscriber: subscriberID, billingGroup: billingGroupID) != nil else {
            print("Billing Group could not be assigned.")
            return
        }
        
        // get and print plans
        guard let getPlansResult = Sbd().GetPlans(token: token) else {
            print("could not get plans")
            return
        }
        
        let plans = getPlansResult.plans
        print("Here are your plan options: \n")
        for plan in plans {
            print(plan)
            print("\n")
        }
    }

    func modemShutdown() {
        Account().DeleteBillingGroup(token: token, BillingGroup: billingGroup)
        Sbd().DeactivateSubscriber(token: token, subscriber: subscriber)
    }

    func getInfo(imei: String, subscriberID: String) {
        // call all the get functions and
        // set global variables to the most accessible information
        subscriber = subscriberID
        
        
        Sbd().GetSubscriber(token: token, subscriber: subscriber, imei: imei)
    }

}
