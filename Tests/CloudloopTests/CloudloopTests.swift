    import XCTest
    @testable import Cloudloop

    final class CloudloopTests: XCTestCase {
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
        }
        
        func testGeneratedSBDCreateSubscriber() {
            // These variable are to my knowledge, accurate for our use case on my device
            let sbd = Sbd().CreateSubscriber(token: "94e69a59-3c05-4d9d-ab14-bd0c9513870d", hardware: Identifier("olNGxekOvAKmaEjQQrWRdpyLgXjMbVPZ")!, name: "Prototype Unit 2")
            XCTAssertNotNil(sbd)
        }
        
        func testGeneratedSBDGetPlans() {
            // These variable are to my knowledge, accurate for our use case on my device
            let sbd = Sbd().GetPlans(token: "94e69a59-3c05-4d9d-ab14-bd0c9513870d")
            XCTAssertNotNil(sbd)
        }
        
        func testDecoder() {
            let testString = """
                {
                  "plans": [
                    {
                      "feeMonthly": 135,
                      "inclusive": 300000,
                      "suspendible": true,
                      "description": "Cloudloop 2020 300KB pooled",
                      "increment": 1,
                      "commitment": 12,
                      "transitionFees": true,
                      "pooled": true,
                      "activationFee": 25,
                      "terminationFee": 158.5,
                      "terminable": true,
                      "name": "CLOUDLOOP_2020_SBD_300P",
                      "currency": "USD",
                      "id": "eorLzVjdQqPgkanlgRBpRyKbJZONAGYD",
                      "minimum": 10
                    },
                    {
                      "feeMonthly": 52.5,
                      "inclusive": 50000,
                      "suspendible": true,
                      "description": "Cloudloop 2020 50KB pooled",
                      "increment": 1,
                      "commitment": 12,
                      "transitionFees": true,
                      "pooled": true,
                      "activationFee": 25,
                      "terminationFee": 75,
                      "terminable": true,
                      "name": "CLOUDLOOP_2020_SBD_50P",
                      "currency": "USD",
                      "id": "rXgwyNPpDmebJLWXyeEoARqxMdZOVGva",
                      "minimum": 10
                    },
                    {
                      "feeMonthly": 133.5,
                      "inclusive": 300000,
                      "suspendible": true,
                      "description": "Cloudloop 2020 300KB non-pooled",
                      "increment": 1,
                      "commitment": 12,
                      "transitionFees": true,
                      "pooled": false,
                      "activationFee": 25,
                      "terminationFee": 158.5,
                      "terminable": true,
                      "name": "CLOUDLOOP_2020_SBD_300",
                      "currency": "USD",
                      "id": "aLyjrgkpAemZqGBRvlBRvNVKxQPXdYoO",
                      "minimum": 10
                    },
                    {
                      "feeMonthly": 50,
                      "inclusive": 50000,
                      "suspendible": true,
                      "description": "Cloudloop 2020 50KB non-pooled",
                      "increment": 1,
                      "commitment": 12,
                      "transitionFees": true,
                      "pooled": false,
                      "activationFee": 25,
                      "terminationFee": 75,
                      "terminable": true,
                      "name": "CLOUDLOOP_2020_SBD_50",
                      "currency": "USD",
                      "id": "zmRbxMoAQkLdKJWkkOWqYZpaOgjPwlyN",
                      "minimum": 10
                    }
                  ]
                }

                """
            let testData: Data! = testString.data(using: .utf8) // non-nil
            let decoder = JSONDecoder()
            guard let result = try? decoder.decode(SbdGetPlansResult.self, from: testData) else {
                XCTFail()
                return
            }
            XCTAssertNotNil(result)
        }
        
        func testDecoder2() {
            let testString = """
                    {
                      "feeMonthly": 135,
                      "inclusive": 300000,
                      "suspendible": true,
                      "description": "Cloudloop 2020 300KB pooled",
                      "increment": 1,
                      "commitment": 12,
                      "transitionFees": true,
                      "pooled": true,
                      "activationFee": 25,
                      "terminationFee": 158.5,
                      "terminable": true,
                      "name": "CLOUDLOOP_2020_SBD_300P",
                      "currency": "USD",
                      "id": "eorLzVjdQqPgkanlgRBpRyKbJZONAGYD",
                      "minimum": 10
                    }
                """
            let testData: Data! = testString.data(using: .utf8) // non-nil
            let decoder = JSONDecoder()
            guard let result = try? decoder.decode(SBDGetPlans.self, from: testData) else {
                XCTFail()
                return
            }
            XCTAssertNotNil(result)
        }
        
        func testSBDGetPlans() {
            // I'm sure there's plenty wrong with this, but it was an honest effort ;-;
            // i checked out how to make http requests in swift because thats what the code looked like it was doing, although i dont know any of the example languages
            let expectation = XCTestExpectation()
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/GetPlans?token=94e69a59-3c05-4d9d-ab14-bd0c9513870d")!
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                let dataString = String(decoding: data!, as: UTF8.self)
                print("\n data: \n")
                print(dataString)
                
                if error != nil {
                    // OH NO! An error occurred...
                    // self.handleClientError(error)
                    print("clientHandler error")
                    XCTFail()
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse,
                      // 200...299 is a sequence of OK HTTP status codes
                      (200...299).contains(httpResponse.statusCode) else {
                    // self.handleServerError(response)
                    print("response status code was an error")
                    XCTFail()
                    return
                }

                guard let mime = response?.mimeType, mime == "application/json" else {
                    print("wrong mime type")
                    XCTFail()
                    return
                }

                expectation.fulfill()
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data!, options: ["Accept"])
//                    print(json)
//                } catch {
//                    print("JSON error: \(error.localizedDescription)")
//                }
            })
            task.resume()
            wait(for: [expectation], timeout: 1000)
        }
    }

    //example of how to add parameters and id
    //'https://api.cloudloop.com/Sbd/GetUsage?year=2018&id=23435353513' \
