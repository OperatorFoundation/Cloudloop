    import XCTest
    @testable import Cloudloop
    @testable import CloudloopSbd

    final class SbdWorkflowTests: XCTestCase {
        
        
        func testModemSetup() {
            let workflow = SbdWorkflow(token: "token", imei: "imei")
            
            guard workflow.modemSetup(subscriberName: "subscriberName", billingGroupName: "billingGroupName") != nil else {
                XCTFail()
                return
            }
        }
        
        func testModemAssign() {
            let workflow = SbdWorkflow(token: "token", imei: "imei")
            
            guard workflow.modemAssign(planName: "planName") != nil else {
                XCTFail()
                return
            }
        }
        
        func testSendMessages() {
            let workflow = SbdWorkflow(token: "token", imei: "imei")
            
            guard workflow.sendMessage(recipients: ["Recipients"], message: "message") != nil else {
                XCTFail()
                return
            }
        }
        
        func testRefreshMessages() {
            let workflow = SbdWorkflow(token: "4e69a59-3c05-4d9d-ab14-bd0c9513870d", imei: "300434065343580")
            
            guard workflow.refreshMessages(messageCheckTime: 10) != nil else {
                XCTFail()
                return
            }
        }
        
        func testDestination() {
            let workflow = SbdWorkflow(token: "token", imei: "imei")
            
            guard workflow.newDestination(nextDestination: "nextDestination", type: "type") != nil else {
                XCTFail()
                return
            }
        }
        
        func testShutdown() {
            let workflow = SbdWorkflow(token: "token", imei: "imei")
            
            guard workflow.modemShutdown(subscriberID: "subscriberID") != nil else {
                XCTFail()
                return
            }
        }
        
    }
