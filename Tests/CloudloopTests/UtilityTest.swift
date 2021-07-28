    import XCTest
    @testable import Cloudloop

    final class UtilityTests: XCTestCase {
        func testGetPlansResultPrintMethod1() {
            guard let token = readFile(fileName: "token.txt") else {
                print("could not find token.txt in ~/Documents")
                XCTFail()
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
                print("""
                    feeMonthly: \(plan.feeMonthly)
                    inclusive: \(plan.inclusive)
                    suspendible: \(plan.suspendible)
                    description: \(plan.description)
                    increment: \(plan.increment)
                    commitment: \(plan.commitment)
                    transitionFees: \(plan.transitionFees)
                    pooled: \(plan.pooled)
                    activationFee: \(plan.activationFee)
                    terminationFee: \(plan.terminationFee)
                    terminable: \(plan.terminable)
                    name: \(plan.name)
                    currency: \(plan.currency)
                    id: \(plan.id)
                    minimum: \(plan.minimum)
                    
                    """)
            }
        }
        
        func testGetPlansResultPrintMethod2() {
            guard let token = readFile(fileName: "token.txt") else {
                print("could not find token.txt in ~/Documents")
                XCTFail()
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
    }

    public func readFile(fileName: String) -> String? {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

        let fileURL = dir!.appendingPathComponent(fileName)

        // reading
        guard let result = try? String(contentsOf: fileURL, encoding: .utf8) else {
            print("could not find \(fileName) in ~/Documents")
            return nil
        }
        return result
    }
    
    public func setTokenImei() -> (token: String?, imei: String?) {
        guard let token = readFile(fileName: "token.txt") else {
            print("could not find the file in ~/Documents where token was stored")
            XCTFail()
            return
        }
        guard let imei = readFile(fileName: "imei.txt") else {
            print("could not find the file in ~/Documents where imei was stored")
            XCTFail()
            return
        }
        return (token, imei)
    }

    public func setTokenSubscriber() -> (token: String?, subscriber: String?) {
        guard let token = readFile(fileName: "token.txt") else {
            print("could not find the file in ~/Docuents where token was stored")
            XCTFail()
            return
        }
        guard let imei = readFile(fileName: "subscriber.txt") else {
            print("could not find the file in ~/Documents where subscriber was stored")
            XCTFail()
            return
        }
        return (token, imei)
    }
