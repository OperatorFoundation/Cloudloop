    import XCTest
    @testable import Cloudloop
    @testable import CloudloopSbd

    final class SbdWorkflowTests: XCTestCase
{
        func testSendMessage() {
            let workflow = SbdWorkflow(token: "token")
            let result = workflow.sendMessage(payload: "Hello world!", receiverIMEI: "hardware")
            
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
            
            let receiverWorkflow = SbdWorkflow(token: "token")
            let retrieveResult = receiverWorkflow.retrieveMessages(lastChecked: tenDaysAgo, senderIMEI: "30043")
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
            let senderWorkflow = SbdWorkflow(token: "token")
            
            let sendResult = senderWorkflow.sendMessage(payload: "74657374", receiverIMEI: "hardware")

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
            
            let receiverWorkflow = SbdWorkflow(token: "token")
            let retrieveResult = receiverWorkflow.retrieveMessages(lastChecked: tenDaysAgo, senderIMEI: "3004340")
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
        
        
        func testDestination() {
            let workflow = SbdWorkflow(token: "token")
            let result = workflow.newDestination(deviceIMEI: "deviceIMEI", destination: "destination", type: "IMEI")
            
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
        
    }
