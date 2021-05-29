    import XCTest
    import requests
    @testable import Cloudloop

    final class CloudloopTests: XCTestCase {
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
        }
        func testSBDCreateSubscriber() {
            // I'm sure there's plenty wrong with this, but it was an honest effort ;-;
            // i checked out how to make http requests in swift because thats what the code looked like it was doing, although i dont know any of the example languages
            var data: Data
            var response: URLResponse
            var error: Error
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/CreateSubscriber")!
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                print(data)
                print(response)
                print(error)
                
                if error != nil {
                    // OH NO! An error occurred...
                    self.handleClientError(error)
                    print("clientHandler error")
                    XCTFail()
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      // 200...299 is a sequence of OK HTTP status codes
                      (200...299).contains(httpResponse.statusCode) else {
                    self.handleServerError(response)
                    print("response status code was an error")
                    XCTFail()
                    return
                }
                
                guard let mime = response?.mimeType, mime == "application/json" else {
                    print("wrong mime type")
                    XCTFail()
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: ["Accept"])
                    print(json)
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
            })
            task.resume()
        }
    }

    //example of how to add parameters and id
    //'https://api.cloudloop.com/Sbd/GetUsage?year=2018&id=23435353513' \
