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
            let result = workflow.sendMessage(payload: "74657374", receiverHardwareId: "hardware")
            
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
        
        func testReceiveMessages() {
            guard let now = Calendar.current.date(byAdding: .hour, value: -5, to: Date.now) else {
                XCTFail()
                return
            }
            
            guard let tenDaysAgo = Calendar.current.date(byAdding: .day, value: -9, to: now) else {
                XCTFail()
                return
            }
            
            let receiverWorkflow = SbdWorkflow(token: "token", imei: "imei")
            let retrieveResult = receiverWorkflow.retrieveMessages(lastChecked: tenDaysAgo)
            switch retrieveResult {
                case .success:
                    print("retrieve succeeded")
                case .sbdError(let sBDErrorResult):
                    print(sBDErrorResult)
                    XCTFail()
                case .failure(let reason):
                    print(reason)
                    XCTFail()
                case .messages(let messages):
                    print("first message received: \(messages.messages[0].payload)")
                default:
                    print("retrieveMessagesResult default case reached: \(retrieveResult)")
                    XCTFail()
            }
        }
        
        func testSendAndReceiveMessages() {
            let senderWorkflow = SbdWorkflow(token: "token", imei: "imei")
            
            let sendResult = senderWorkflow.sendMessage(payload: "74657374", receiverHardwareId: "hardware")

            switch sendResult {
                case .success:
                    print("send succeeded")
                case .sbdError(let sBDErrorResult):
                    print(sBDErrorResult)
                    XCTFail()
                case .failure(let reason):
                    print(reason)
                    XCTFail()
                default:
                    XCTFail()
            }
            
            guard let now = Calendar.current.date(byAdding: .hour, value: -5, to: Date.now) else {
                XCTFail()
                return
            }
            
            guard let tenDaysAgo = Calendar.current.date(byAdding: .day, value: -9, to: now) else {
                XCTFail()
                return
            }
            
            let receiverWorkflow = SbdWorkflow(token: "token", imei: "imei")
            let retrieveResult = receiverWorkflow.retrieveMessages(lastChecked: tenDaysAgo)
            switch retrieveResult {
                case .success:
                    print("retrieve succeeded")
                case .sbdError(let sBDErrorResult):
                    print(sBDErrorResult)
                    XCTFail()
                case .failure(let reason):
                    print(reason)
                    XCTFail()
                case .messages(let messages):
                    print("first message received: \(messages.messages[0].payload)")
                default:
                    print("retrieveMessagesResult default case reached: \(retrieveResult)")
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
