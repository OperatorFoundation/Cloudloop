    import XCTest
    @testable import Cloudloop

    final class HttpRequestTests: XCTestCase {
        func testSbdGetSubscriber() {
            let expectation = XCTestExpectation()
            let (maybeToken, maybeIMEI) = setTokenImei()
            guard let token = maybeToken, let imei = maybeIMEI else
            {
                XCTFail()
                return
            }
            
            guard let subscriber = readFile(fileName: "subscriber.txt") else {
                print("could not find subscriber.txt in ~/Documents")
                XCTFail()
                return
            }
            
            let session = URLSession.shared
            
            
            guard let url = URL(string: "https://api.cloudloop.com/Sbd/GetSubscriber?token=\(token)&subscriber=\(subscriber)&imei=\(imei)") else
                {
                    XCTFail()
                    return
                }
            
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
            
            let (maybeToken, maybeIMEI) = setTokenImei()
            guard let token = maybeToken, let imei = maybeIMEI else
            {
                XCTFail()
                return
            }
            
            guard let hardware = readFile(fileName: "hardware.txt") else {
                print("could not find hardware.txt in ~/Documents")
                XCTFail()
                return
            }
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/GetSubscribers?token=\(token)&query=\(imei)&status=ACTIVATED&hardware=\(hardware)")!
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
            
            let (maybeToken, maybeSubscriber) = setTokenSubscriber()
            guard let token = maybeToken, let subscriber = maybeSubscriber else
            {
                XCTFail()
                return
            }
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/GetUsage?token=\(token)&subscriber=\(subscriber)&year=2021&month=6")!
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
            
            let (maybeToken, maybeSubscriber) = setTokenSubscriber()
            guard let token = maybeToken, let subscriber = maybeSubscriber else
            {
                XCTFail()
                return
            }
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/GetUsageSummary?token=\(token)&subscriber=\(subscriber)&year=2021&month=6")!
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
            
            guard let token = readFile(fileName: "token.txt") else {
                print("could not find token.txt in ~/Documents")
                XCTFail()
                return
            }
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/GetPlans?token=\(token)")!
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
            
            let (maybeToken, maybeSubscriber) = setTokenSubscriber()
            guard let token = maybeToken, let subscriber = maybeSubscriber else
            {
                XCTFail()
                return
            }
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/GetContracts?token=\(token)&subscriber=\(subscriber)")!
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
        
        func testSBDActivateDeactivateDestination() {
            let expectation = XCTestExpectation()
            
            let (maybeToken, maybeSubscriber) = setTokenSubscriber()
            guard let token = maybeToken, let subscriber = maybeSubscriber else
            {
                XCTFail()
                return
            }
            
            let session = URLSession.shared
            let url = URL(string: "https://api.cloudloop.com/Sbd/CreateDestination?token=\(token)&subscriber=\(subscriber)&destination=google.com:1234&type=DIRECT_IP&moack=true&geodata=true")!
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                let dataString = String(decoding: data!, as: UTF8.self)
                print("\n data: \n")
                print(dataString)

                if error != nil {
                    // OH NO! An error occurred...
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
                
            })
            task.resume()
            wait(for: [expectation], timeout: 1000)
            
            let deleteExpectation = XCTestExpectation()
            
            let deleteSession = URLSession.shared
            let deleteUrl = URL(string: "https://api.cloudloop.com/Sbd/DeleteDestination?token=\(token)&destination=google.com:1234")!
            let deleteTask = deleteSession.dataTask(with: deleteUrl, completionHandler: { deleteData, response, error in
                let deleteDataString = String(decoding: deleteData!, as: UTF8.self)
                print("\n data: \n")
                print(deleteDataString)
                
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

                deleteExpectation.fulfill()
            })
            deleteTask.resume()
            wait(for: [deleteExpectation], timeout: 1000)
        }
    }
    
    //example of how to add parameters and id
    //'https://api.cloudloop.com/Sbd/GetUsage?year=2018&id=23435353513' \
