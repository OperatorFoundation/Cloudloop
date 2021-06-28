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
            let workflow = SbdWorkflow(token: "token", imei: "imei")
            
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
