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
        endpoints: [
            Endpoint(
                name: "Telephony",
                documentation: URL(string: "https://docs.cloudloop.com/reference#create")!,
                functions: [
                    Function(
                        name: "CreateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#create")!,
                        resultType: ResultType(fields: [
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
