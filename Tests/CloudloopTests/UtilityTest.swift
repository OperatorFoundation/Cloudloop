    import XCTest
    @testable import Cloudloop

    final class UtilityTests: XCTestCase {
        func testGetPlansResultPrintMethod1() {
            // get and print plans
            guard let getPlansResult = Sbd().GetPlans(token: "94e69a59-3c05-4d9d-ab14-bd0c9513870d") else {
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
            // get and print plans
            guard let getPlansResult = Sbd().GetPlans(token: "94e69a59-3c05-4d9d-ab14-bd0c9513870d") else {
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
