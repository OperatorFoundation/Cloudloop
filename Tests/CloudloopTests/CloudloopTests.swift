    import XCTest
    @testable import Cloudloop

    final class CloudloopTests: XCTestCase {
        
        func testGeneratedSbdGetSubscriber() {
            // Subscriber ID?!?!
            let sbd = Sbd().GetSubscriber(token: "94e69a59-3c05-4d9d-ab14-bd0c9513870d", subscriber: Identifier("QzagvADYwKoPeBQXaPElMrXJpVORdjyZ")!, imei: "300434065343580")
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSbdSearchSubscriber() {
            //FIXME: its getting a DISPATCHERMETHODUNKNOWNEXCEPTION
            let sbd = Sbd().SearchSubscribers(token: "94e69a59-3c05-4d9d-ab14-bd0c9513870d", query: "300434065343580", status: "ACTIVATED", hardware: Identifier("olNGxekOvAKmaEjQQrWRdpyLgXjMbVPZ")!)
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSbdGetUsage() {
            // result is {"usage":[]}?????
            let sbd = Sbd().GetUsage(token: "94e69a59-3c05-4d9d-ab14-bd0c9513870d", subscriber: Identifier("QzagvADYwKoPeBQXaPElMrXJpVORdjyZ")!, year: 2021, month: 6)
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSbdGetUsageSummary() {
            // result is {"summary":[]}?????
            let sbd = Sbd().GetUsageSummary(token: "94e69a59-3c05-4d9d-ab14-bd0c9513870d", subscriber: Identifier("QzagvADYwKoPeBQXaPElMrXJpVORdjyZ")!, year: 2021, month: 6)
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSBDGetPlans() {
            // These variable are to my knowledge, accurate for our use case on my device
            let sbd = Sbd().GetPlans(token: "94e69a59-3c05-4d9d-ab14-bd0c9513870d")
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSbdGetContracts() {
            let sbd = Sbd().GetContracts(token: "94e69a59-3c05-4d9d-ab14-bd0c9513870d", subscriber: Identifier("QzagvADYwKoPeBQXaPElMrXJpVORdjyZ")!)
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSbdCreateDestroyDestination() {
            let sbdCreate = Sbd().CreateDestination(token: "94e69a59-3c05-4d9d-ab14-bd0c9513870d", subscriber: Identifier("QzagvADYwKoPeBQXaPElMrXJpVORdjyZ")!, destination: "google.com:1234", type: "DIRECT_IP", moack: true, geodata: true)
            XCTAssertNotNil(sbdCreate)
            let sbdDelete = Sbd().DeleteDestination(token: "94e69a59-3c05-4d9d-ab14-bd0c9513870d", destination: "google.com:1234")
            XCTAssertNotNil(sbdDelete)
        }
    }
    
    //example of how to add parameters and id
    //'https://api.cloudloop.com/Sbd/GetUsage?year=2018&id=23435353513' \
