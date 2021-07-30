    import XCTest
    @testable import Cloudloop

    final class CloudloopTests: XCTestCase {
        
        func testGeneratedSbdGetSubscriber() {
            // Subscriber ID?!?!
            let (token, imei) = setTokenImei()
            guard let subscriber = readFile(fileName: "subscriber.txt") else {
                print("could not find subscriber.txt in ~/Documents")
                XCTFail()
                return
            }
            
            let sbd = Sbd().GetSubscriber(token: token!, subscriber: subscriber, imei: imei!)
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSbdSearchSubscriber() {
            let (token, imei) = setTokenImei()
            guard let hardware = readFile(fileName: "hardware.txt") else {
                print("could not find hardware.txt in ~/Documents")
                XCTFail()
                return
            }
            //FIXME: its getting a DISPATCHERMETHODUNKNOWNEXCEPTION
            let sbd = Sbd().SearchSubscribers(token: token!, query: imei!, status: "ACTIVATED", hardware: hardware)
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSbdSearchSubscriberWithNilParams() {
            let (token, imei) = setTokenImei()
            //FIXME: its getting a DISPATCHERMETHODUNKNOWNEXCEPTION
            let sbd = Sbd().SearchSubscribers(token: token!, query: imei!, status: nil, hardware: nil)
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSbdGetUsage() {
            let (token, subscriber) = setTokenSubscriber()
            // result is {"usage":[]}?????
            let sbd = Sbd().GetUsage(token: token!, subscriber: subscriber!, year: 2021, month: 6)
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSbdGetUsageSummary() {
            let (token, subscriber) = setTokenSubscriber()
            // result is {"summary":[]}?????
            let sbd = Sbd().GetUsageSummary(token: token!, subscriber: subscriber!, year: 2021, month: 6)
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSBDGetPlans() {
            guard let token = readFile(fileName: "token.txt") else {
                print("could not find token.txt in ~/Documents")
                XCTFail()
                return
            }
            // These variable are to my knowledge, accurate for our use case on my device
            let sbd = Sbd().GetPlans(token: token)
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSbdGetContracts() {
            let (token, subscriber) = setTokenSubscriber()
            
            let sbd = Sbd().GetContracts(token: token!, subscriber: subscriber!)
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSbdCreateDestroyDestination() {
            let (token, subscriber) = setTokenSubscriber()
            
            let sbdCreate = Sbd().CreateDestination(token: token!, subscriber: subscriber!, destination: "google.com:1234", type: "DIRECT_IP", moack: true, geodata: true)
            XCTAssertNotNil(sbdCreate)
            let sbdDelete = Sbd().DeleteDestination(token: token!, destination: "google.com:1234")
            XCTAssertNotNil(sbdDelete)
        }
    }
    
    //example of how to add parameters and id
    //'https://api.cloudloop.com/Sbd/GetUsage?year=2018&id=23435353513' \
