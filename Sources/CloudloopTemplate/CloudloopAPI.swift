//
//  CloudloopAPI.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/3/21.
//

import Foundation

public struct CloudloopAPI
{
    public let api = API(
        name: "Cloudloop",
        url: "https://api.cloudloop.com",
        documentation: URL(string: "https://docs.cloudloop.com/reference")!,
        types: [
            ResultType(name: "Contract", fields: [
                "subscriber" : .identifier,
                "networkStatus": .string,
                "from": .date,
                "id": .identifier,
                "state": .string,
                "to": .optional(.identifier),
                "plan": .structure("Plan"),
                "hardware": .identifier
            ]),
            ResultType(name: "Plan", fields: [
                "inclusive" : .float,
                "pooled": .boolean,
                "suspensible": .boolean,
                "name": .string,
                "description": .string,
                "increment": .float,
                "commitment": .float,
                "id": .identifier,
                "minimum": .float
            ]),
            ResultType(name: "Sim", fields: [
                "iccid": .string,
                "id": .identifier
            ]),
            ResultType(name: "Hardware", fields: [
                "imei": .string,
                "id": .identifier,
                "type": .string
            ]),
            ResultType(name: "Subscriber", fields: [
                "createdAt": .date,
                "sim": .optional(.identifier),
                "contract": .optional(.identifier),
                "billingGroup": .identifier,
                "name": .string,
                "description": .string,
                "id": .identifier,
                "account": .identifier
                
            ])
        ],
        endpoints: [
            Endpoint(
                name: "Telephony",
                documentation: URL(string: "https://docs.cloudloop.com/reference#create")!,
                functions: [
                    Function(
                        name: "CreateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#create")!,
                        resultType: ResultType(name: "CreateSubscriberResult", fields: [
                            "createdAt": .date,
                            "sim": .identifier,
                            "contract": .optional(.identifier),
                            "billingGroup": .identifier,
                            "name": .string,
                            "description": .string,
                            "id": .identifier,
                            "account": .identifier
                        ]),
                        parameters: [
                            Parameter(
                                name: "sim",
                                description: "Cloudloop Sim Id",
                                type: .identifier
                            ),
                            Parameter(
                                name: "name",
                                type: .string,
                                optional: true
                            )
                        ]
                    ),
                    Function(
                        name: "GetSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#retrieve")!,
                        resultType: ResultType(name: "GetSubscriberResult", fields: [
                            "createdAt": .date,
                            "sim": .structure("Sim"),
                            "contract": .structure("Contract"),
                            "name": .string, "id": .identifier,
                            "account": .identifier,
                            "hardware": .structure("Hardware")
                        ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber Id",
                                type: .identifier
                            )
                        ]
                    ),
                    Function(
                        name: "SearchSubscribers",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#search")!,
                        resultType: ResultType(name: "SearchSubscribersResult", fields: [
                            "subscribers": .array(.structure("Subscriber"))
                        ]),
                        parameters: []
                    )
                ]
            )
        ]
    )

    public init()
    {
    }
}
