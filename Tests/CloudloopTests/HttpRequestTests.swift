    import XCTest
    @testable import Cloudloop

    final class HttpRequestTests: XCTestCase {
        func testSbdGetSubscriber() {
            let expectation = XCTestExpectation()
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/GetSubscriber?token=94e69a59-3c05-4d9d-ab14-bd0c9513870d&subscriber=QzagvADYwKoPeBQXaPElMrXJpVORdjyZ&imei=300434065343580")!
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
        
        func testSbdSearchSubscriber() {
            let expectation = XCTestExpectation()
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/GetSubscribers?token=94e69a59-3c05-4d9d-ab14-bd0c9513870d&query=300434065343580&status=ACTIVATED&hardware=olNGxekOvAKmaEjQQrWRdpyLgXjMbVPZ")!
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
        
        func testSbdGetUsage() {
            let expectation = XCTestExpectation()
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/GetUsage?token=94e69a59-3c05-4d9d-ab14-bd0c9513870d&subscriber=QzagvADYwKoPeBQXaPElMrXJpVORdjyZ&year=2021&month=6")!
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
        
        func testSbdGetUsageSummary() {
            let expectation = XCTestExpectation()
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/GetUsageSummary?token=94e69a59-3c05-4d9d-ab14-bd0c9513870d&subscriber=QzagvADYwKoPeBQXaPElMrXJpVORdjyZ&year=2021&month=6")!
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
        
        func testSBDGetPlans() {
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
        
        func testSBDGetContracts() {
            let expectation = XCTestExpectation()
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/GetContracts?token=94e69a59-3c05-4d9d-ab14-bd0c9513870d&subscriber=QzagvADYwKoPeBQXaPElMrXJpVORdjyZ")!
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
