    import XCTest
    @testable import Cloudloop

    final class JsonDecoderTests: XCTestCase {
        func testGetSubscriberDecoder() {
            let testString = """
                {
                  "subscriber": {
                    "createdAt": "2021-01-29T23:09:50",
                    "lastSeen": "2021-05-25T22:27:17",
                    "contract": {
                      "subscriber": "QzagvADYwKoPeBQXaPElMrXJpVORdjyZ",
                      "networkStatus": "ACTIVATED",
                      "committedTo": "2022-01-29T23:09:50",
                      "from": "2021-03-04T09:48:54",
                      "id": "JvLGDrkRelwaXWDdVXvWKgAoZPMQmdzb",
                      "state": "CHANGED",
                      "to": null,
                      "plan": {
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
                      "hardware": "olNGxekOvAKmaEjQQrWRdpyLgXjMbVPZ"
                    },
                    "billingGroup": "DgXeoxwVPMyrdOBJgJnGlqKRJLbajQkz",
                    "destinations": [
                      {
                        "route": null,
                        "moack": false,
                        "destination": "jeremy@operatorfoundation.org",
                        "id": "GjlwJvdrxpDoOBeYvxwBKbPLkQXeVAZg",
                        "type": "EMAIL",
                        "geodata": true
                      },
                      {
                        "route": null,
                        "moack": false,
                        "destination": "joshua@operatorfoundation.org",
                        "id": "QzagvADYwKoPeBQLpmlElMrXJpVORdjy",
                        "type": "EMAIL",
                        "geodata": true
                      },
                      {
                        "route": null,
                        "moack": true,
                        "destination": "direct-ip-backup.rock7.com:4444",
                        "id": "OVdRorbmlwqkNBpGZVMEJYPZvxaXpzjL",
                        "type": "DIRECT_IP",
                        "geodata": true
                      },
                      {
                        "route": null,
                        "moack": true,
                        "destination": "direct-ip.rock7.com:5555",
                        "id": "olNGxekOvAKmanjGjkbWRdpyLgXjMbVP",
                        "type": "DIRECT_IP",
                        "geodata": true
                      }
                    ],
                    "name": "Prototype Unit 2",
                    "description": "Josh",
                    "id": "QzagvADYwKoPeBQXaPElMrXJpVORdjyZ",
                    "customMonitorThreshold": null,
                    "account": "OJvLGDrkRelwaXBDjOWKgAoZPMQmdzbY",
                    "hardware": {
                      "imei": "300434065343580",
                      "id": "olNGxekOvAKmaEjQQrWRdpyLgXjMbVPZ",
                      "type": "IRIDIUM_SBD",
                      "account": "OJvLGDrkRelwaXBDjOWKgAoZPMQmdzbY"
                    }
                  }
                }
                """
            let testData: Data! = testString.data(using: .utf8) // non-nil
            let decoder = JSONDecoder()
            guard let result = try? decoder.decode(SbdGetSubscriberResult.self, from: testData) else {
                XCTFail()
                return
            }
            XCTAssertNotNil(result)
        }
        
        func testSearchSubscriberDecoder() {
            let testString = """
                {
                  "subscriber": {
                    "createdAt": "2021-01-29T23:09:50",
                    "lastSeen": "2021-05-25T22:27:17",
                    "contract": {
                      "subscriber": "QzagvADYwKoPeBQXaPElMrXJpVORdjyZ",
                      "networkStatus": "ACTIVATED",
                      "committedTo": "2022-01-29T23:09:50",
                      "from": "2021-03-04T09:48:54",
                      "id": "JvLGDrkRelwaXWDdVXvWKgAoZPMQmdzb",
                      "state": "CHANGED",
                      "to": null,
                      "plan": {
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
                      "hardware": "olNGxekOvAKmaEjQQrWRdpyLgXjMbVPZ"
                    },
                    "billingGroup": "DgXeoxwVPMyrdOBJgJnGlqKRJLbajQkz",
                    "destinations": [
                      {
                        "route": null,
                        "moack": false,
                        "destination": "jeremy@operatorfoundation.org",
                        "id": "GjlwJvdrxpDoOBeYvxwBKbPLkQXeVAZg",
                        "type": "EMAIL",
                        "geodata": true
                      },
                      {
                        "route": null,
                        "moack": false,
                        "destination": "joshua@operatorfoundation.org",
                        "id": "QzagvADYwKoPeBQLpmlElMrXJpVORdjy",
                        "type": "EMAIL",
                        "geodata": true
                      },
                      {
                        "route": null,
                        "moack": true,
                        "destination": "direct-ip-backup.rock7.com:4444",
                        "id": "OVdRorbmlwqkNBpGZVMEJYPZvxaXpzjL",
                        "type": "DIRECT_IP",
                        "geodata": true
                      },
                      {
                        "route": null,
                        "moack": true,
                        "destination": "direct-ip.rock7.com:5555",
                        "id": "olNGxekOvAKmanjGjkbWRdpyLgXjMbVP",
                        "type": "DIRECT_IP",
                        "geodata": true
                      }
                    ],
                    "name": "Prototype Unit 2",
                    "description": "Josh",
                    "id": "QzagvADYwKoPeBQXaPElMrXJpVORdjyZ",
                    "customMonitorThreshold": null,
                    "account": "OJvLGDrkRelwaXBDjOWKgAoZPMQmdzbY",
                    "hardware": {
                      "imei": "300434065343580",
                      "id": "olNGxekOvAKmaEjQQrWRdpyLgXjMbVPZ",
                      "type": "IRIDIUM_SBD",
                      "account": "OJvLGDrkRelwaXBDjOWKgAoZPMQmdzbY"
                    }
                  }
                }
                """
            let testData: Data! = testString.data(using: .utf8) // non-nil
            let decoder = JSONDecoder()
            guard let result = try? decoder.decode(SbdGetSubscriberResult.self, from: testData) else {
                XCTFail()
                return
            }
            XCTAssertNotNil(result)
        }
        
        func testGetPlansDecoder() {
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
        
        func testGetContractsDecoder() {
            let testString = """
                {
                  "subscriber": {
                    "createdAt": "2021-01-29T23:09:50",
                    "lastSeen": "2021-05-25T22:27:17",
                    "contract": {
                      "subscriber": "QzagvADYwKoPeBQXaPElMrXJpVORdjyZ",
                      "networkStatus": "ACTIVATED",
                      "committedTo": "2022-01-29T23:09:50",
                      "from": "2021-03-04T09:48:54",
                      "id": "JvLGDrkRelwaXWDdVXvWKgAoZPMQmdzb",
                      "state": "CHANGED",
                      "to": null,
                      "plan": {
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
                      "hardware": "olNGxekOvAKmaEjQQrWRdpyLgXjMbVPZ"
                    },
                    "billingGroup": "DgXeoxwVPMyrdOBJgJnGlqKRJLbajQkz",
                    "destinations": [
                      {
                        "route": null,
                        "moack": false,
                        "destination": "jeremy@operatorfoundation.org",
                        "id": "GjlwJvdrxpDoOBeYvxwBKbPLkQXeVAZg",
                        "type": "EMAIL",
                        "geodata": true
                      },
                      {
                        "route": null,
                        "moack": false,
                        "destination": "joshua@operatorfoundation.org",
                        "id": "QzagvADYwKoPeBQLpmlElMrXJpVORdjy",
                        "type": "EMAIL",
                        "geodata": true
                      },
                      {
                        "route": null,
                        "moack": true,
                        "destination": "direct-ip-backup.rock7.com:4444",
                        "id": "OVdRorbmlwqkNBpGZVMEJYPZvxaXpzjL",
                        "type": "DIRECT_IP",
                        "geodata": true
                      },
                      {
                        "route": null,
                        "moack": true,
                        "destination": "direct-ip.rock7.com:5555",
                        "id": "olNGxekOvAKmanjGjkbWRdpyLgXjMbVP",
                        "type": "DIRECT_IP",
                        "geodata": true
                      }
                    ],
                    "name": "Prototype Unit 2",
                    "description": "Josh",
                    "id": "QzagvADYwKoPeBQXaPElMrXJpVORdjyZ",
                    "customMonitorThreshold": null,
                    "account": "OJvLGDrkRelwaXBDjOWKgAoZPMQmdzbY",
                    "hardware": {
                      "imei": "300434065343580",
                      "id": "olNGxekOvAKmaEjQQrWRdpyLgXjMbVPZ",
                      "type": "IRIDIUM_SBD",
                      "account": "OJvLGDrkRelwaXBDjOWKgAoZPMQmdzbY"
                    }
                  }
                }
                """
            let testData: Data! = testString.data(using: .utf8) // non-nil
            let decoder = JSONDecoder()
            guard let result = try? decoder.decode(SbdGetSubscriberResult.self, from: testData) else {
                XCTFail()
                return
            }
            XCTAssertNotNil(result)
        }
    }
    
    //example of how to add parameters and id
    //'https://api.cloudloop.com/Sbd/GetUsage?year=2018&id=23435353513' \
