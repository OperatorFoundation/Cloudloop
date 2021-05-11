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
            ]),
            ResultType(name: "Usage", fields: [
                "duration": .float,
                "at": .date,
                "cost": .float,
                "fee": .string,
                "contract": .identifier
            ]),
            ResultType(name: "UsageSummary", fields: [
                "month": .float,
                "year": .float,
                "contract": .identifier,
                "id": .identifier,
                "calculatedAt": .date,
                "remaining": .float,
                "utilisation": .float,
                "allocated": .float
            ]),
            ResultType(name: "PoolSummary", fields: [
                "month": .float,
                "year": .float,
                "id": .identifier,
                "plan": .identifier,
                "calculatedAt": .date,
                "remaining": .float,
                "utilisation": .float,
                "allocated": .float
            ]),
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
            ResultType(name: "GetContract", fields: [
                "subscriber": .identifier,
                "networkStatus": .string,
                "from": .date,
                "id": .identifier,
                "state": .string,
                "to": .optional(.date),
                "commitedTo": .optional(.date),
                "imsi": .optional(.identifier),
                "msisdn": .optional(.identifier),
                "localNumberAccess": .boolean,
                //FIXME: null on both sides:
                "localNumber": .optional(.float),
                "plan": .structure("ContractPlan"),
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
            ResultType(name: "GetPlan", fields: [
                "inclusive": .float,
                "pooled": .boolean,
                "suspendible": .boolean,
                "name": .string,
                "description": .string,
                "increment": .float,
                "commitment": .float,
                "currency": .string,
                "id": .identifier,
                "minimum": .float
            ]),
            ResultType(name: "ContractPlan", fields: [
                "feeMonthly": .float,
                "inclusive": .float,
                "pooled": .boolean,
                "suspendible": .boolean,
                "name": .string,
                "description": .string,
                "increment": .float,
                "commitment": .float,
                "id": .identifier,
                "minimum": .float
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
                            //FIXME: description and id?
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
                    ),
                    Function(
                        name: "GetUsage",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#usage-1")!,
                        resultType: ResultType(name: "GetUsageResult",
                            fields: [
                                "usage": .array(.structure("Usage"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber Id",
                                type: .identifier
                            ),
                            Parameter(
                                name: "year",
                                type: .int32
                            ),
                            Parameter(
                                name: "month",
                                description: "1-12",
                                type: .int32
                            )
                        ]
                    ),
                    Function(
                        name: "GetUsageSummary",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#subscriber-summary2")!,
                        resultType: ResultType(name: "GetUsageSummaryResult",
                            fields: [
                                "summary": .array(.structure("UsageSummary"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber Id",
                                type: .identifier
                            ),
                            Parameter(
                                name: "year",
                                type: .int32
                            ),
                            Parameter(
                                name: "month",
                                description: "1-12",
                                type: .int32
                            )
                        ]
                    ),
                    Function(
                        name: "GetPoolSummary",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-pool-usage-summary2")!,
                        resultType: ResultType(name: "GetPoolSummaryResult",
                            fields: [
                                "summary": .array(.structure("PoolSummary"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "year",
                                type: .int32
                            ),
                            Parameter(
                                name: "month",
                                type: .int32
                            )
                        ]
                    ),
                    Function(
                        name: "GetPlans",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#retrieve-plans-1")!,
                        resultType: ResultType(name: "GetPlansResult",
                            fields: [
                                "plan": .array(.structure("GetPlan"))
                            ]),
                        parameters: []
                    ),
                    Function(
                        name: "GetContracts",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#retrieve-contracts")!,
                        resultType: ResultType(name: "GetContractsResult",
                            fields: [
                                "contracts": .array(.structure("GetContract"))
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
                        name: "ActivateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#activate-1")!,
                        resultType: ResultType(name: "ActivateSubscriberResult",
                            fields: [
                                "subscriber": .identifier,
                                "networkStatus": .string,
                                "from": .date,
                                "id": .identifier,
                                "state": .string,
                                "to": .optional(.date),
                                "localNumberAccess": .boolean,
                                //FIXME: null on both sides:
                                "localNumber": .optional(.float),
                                "plan": .structure("Plan"),
                                "hardware": .identifier
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber Id",
                                type: .identifier
                            ),
                            Parameter(
                                name: "hardware",
                                description: "CloudLoop Hardware ID",
                                type: .identifier
                            ),
                            Parameter(
                                name: "plan",
                                description: "CloudLoop Plan NAME",
                                type: .string
                            ),
                            Parameter(
                                name: "localNumberAccess",
                                description: "If Local Number Access should be enabled",
                                type: .boolean
                            )
                        ]
                    ),
                    Function(
                        name: "DeactivateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#deactivate-1")!,
                        resultType: ResultType(
                            name: "DeactivateSubscriberResult",
                            fields: [
                                "subscriber": .identifier,
                                "networkStatus": .string,
                                "from": .date,
                                "id": .identifier,
                                "state": .string,
                                "to": .optional(.date),
                                "plan": .structure("Plan"),
                                "hardware": .identifier
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .identifier
                            )
                        ]
                    ),
                    Function(
                        name: "ResumeSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#refresh-2")!,
                        resultType: ResultType(name: "ResumeSubscriberResult",
                            fields: [
                                "subscriber": .identifier,
                                "networkStatus": .string,
                                "from": .date,
                                "id": .identifier,
                                "state": .string,
                                "to": .optional(.date),
                                "plan": .structure("Plan"),
                                "hardware": .identifier,
                                //FIXME: the next two need looked at
                                "at": .float,
                                "error": .string
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .identifier
                            )
                        ]
                    ),
                    Function(
                        name: "SuspendSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#suspend-subscriber")!,
                        resultType: ResultType(name: "SuspendSubscriberResult",
                            fields: [
                                "subscriber": .identifier,
                                "networkStatus": .string,
                                "from": .date,
                                "id": .identifier,
                                "state": .string,
                                "to": .date,
                                "plan": .structure("Plan"),
                                "hardware": .identifier,
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .identifier
                            )
                        ]
                    ),
                    Function(
                        name: "ChangeSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#change-contract")!,
                        resultType: ResultType(name: "ChangeSubscriberResult",
                            fields: [
                                "subscriber": .identifier,
                                "networkStatus": .string,
                                "from": .date,
                                "id": .identifier,
                                "state": .string,
                                "to": .optional(.date),
                                "plan": .structure("Plan"),
                                "hardware": .identifier,
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .identifier
                            ),
                            Parameter(
                                name: "plan",
                                description: "CloudLoop Plan NAME",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "UpdateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#update-subscriber-tel")!,
                        resultType: ResultType(name: "UpdateSubscriberResult",
                            fields: [
                                "createdAt": .date,
                                "contract": .identifier,
                                "billingGroup": .identifier,
                                "name": .string,
                                "description": .string,
                                "id": .identifier,
                                "accoundt": .identifier,
                                "hardware": .identifier
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .identifier
                            ),
                            Parameter(
                                name: "name",
                                description: "new name for device",
                                type: .string
                            ),
                            Parameter(
                                name: "description",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "ReassociateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#reassociate-subscriber")!,
                        resultType: ResultType(name: "ReassociateSubscriberResult",
                            fields: [
                                "createdAt": .date,
                                "sim": .structure("Sim"),
                                "contract": .optional(.identifier),
                                "billingGroup": .identifier,
                                "name": .string,
                                "description": .string,
                                "id": .identifier,
                                "account": .identifier,
                                "hardware": .optional(.identifier)
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop subscriber ID",
                                type: .identifier
                            ),
                            Parameter(
                                name: "sim",
                                description: "CloudLoop sim ID",
                                type: .identifier
                            ),
                            Parameter(
                                name: "hardware",
                                description: "CloudLoop hardware ID",
                                type: .identifier
                            )
                        ]
                    ),
                    Function(
                        name: "AssignBillingGroup",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#assign-billing-group-1")!,
                        resultType: ResultType(name: "AssignBillingGroupResult",
                            fields: [
                                //FIXME: not too sure about this one
                                "default": .optional(.string),
                                "name": .string,
                                "id": .identifier,
                                "account": .identifier
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "Subscriber ID",
                                type: .identifier
                            ),
                            Parameter(
                                name: "billingGroup",
                                description: "Billing Group ID",
                                type: .identifier
                            )
                        ]
                    ),
                ]
            )
            
        ]
    )

    public init()
    {
    }
}
