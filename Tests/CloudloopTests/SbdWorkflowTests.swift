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
        
        func testSendMessage() {
            let workflow = SbdWorkflow(token: "token", imei: "imei")
            let result = workflow.sendMessage(payload: "test")
            
            switch result {
                case .success:
                    print("newDestination test succeeded")
                case .sbdError(let sBDErrorResult):
                    print(sBDErrorResult)
                    XCTFail()
                case .failure(let reason):
                    print(reason)
                    XCTFail()
                default:
                    XCTFail()
            }
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
            let result = workflow.newDestination(nextDestination: "destination", type: "IMEI")
            
            switch result {
                case .success:
                    print("newDestination test succeeded")
                case .sbdError(let sBDErrorResult):
                    print(sBDErrorResult)
                    XCTFail()
                case .failure(let reason):
                    print(reason)
                    XCTFail()
                default:
                    XCTFail()
            }
        }
        
        func testShutdown() {
            let workflow = SbdWorkflow(token: "token", imei: "imei")
            workflow.modemShutdown(subscriberID: "subscriberID")
        }
        
    }
