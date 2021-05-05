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
                    )
                ]
            )
        ]
    )

    public init()
    {
    }
}
