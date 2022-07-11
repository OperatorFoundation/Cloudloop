    import XCTest
    @testable import Cloudloop
    @testable import CloudloopSbd

    final class SbdWorkflowTests: XCTestCase {
        
        
        func testModemSetup() {
            let workflow = SbdWorkflow(token: "token", imei: "imei")
            workflow.modemSetup(subscriberName: "subscriberName", billingGroupName: "billingGroupName")
        }
        
        func testModemAssign() {
            let workflow = SbdWorkflow(token: "token", imei: "imei")
            workflow.modemAssign(planName: "planName")
        }
        
//        func testSendMessages() {
//            let workflow = SbdWorkflow(token: "token", imei: "imei")
//            guard workflow.sendMessage(recipients: ["Recipients"], message: "message") != nil else {
//                XCTFail()
//                return
//            }
//        }
        
//        func testRefreshMessages() {
//            let (token, imei) = setTokenImei()
//            let workflow = SbdWorkflow(token: token!, imei: imei!)
//
//            guard workflow.refreshMessages(messageCheckTime: 10) != nil else {
//                XCTFail()
//                return
//            }
//        }
        
        func testDestination() {
            let workflow = SbdWorkflow(token: "token", imei: "imei")
            workflow.newDestination(nextDestination: "nextDestination", type: "type")
        }
        
        func testShutdown() {
            let workflow = SbdWorkflow(token: "token", imei: "imei")
            workflow.modemShutdown(subscriberID: "subscriberID")
        }
        
    }
