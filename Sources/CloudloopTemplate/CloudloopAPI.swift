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
                "localNumber": .optional(.string),
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
            ]),
            ResultType(name: "SBDContract", fields: [
                "subscriber": .identifier,
                "networkStatus": .string,
                "committedTo": .date,
                "from": .date,
                "id": .identifier,
                "state": .string,
                "to": .date,
                "plan": .structure("SBDPlan")
            ]),
            ResultType(name: "SBDGetContract", fields: [
                "subscriber": .identifier,
                "networkStatus": .string,
                "from": .date,
                "id": .identifier,
                "state": .string,
                "to": .optional(.date),
                "committedTo": .optional(.date),
                "plan": .structure("Plan")
            ]),
            ResultType(name: "SBDPlan", fields: [
                "feeMonthly": .float,
                "inclusive:": .float,
                "suspendible": .boolean,
                "description": .string,
                "increment": .float,
                "commitment": .float,
                "pooled": .boolean,
                "terminationFee": .float,
                "terminable": .boolean,
                "name": .string,
                "id": .identifier
            ]),
            ResultType(name: "SBDSubscriber", fields: [
                "createdAt": .date,
                "lastSeen": .optional(.date),
                "contract": .optional(.identifier),
                "billingGroup": .identifier,
                "name": .string,
                "description": .optional(.string),
                "id": .identifier,
                "customMonitorThreshold": .optional(.string),
                "account": .identifier,
                "hardware": .identifier
            ]),
            ResultType(name: "SBDUsage", fields: [
                "momsn": .float,
                "at": .date,
                "cost": .float,
                "size": .float,
                "fee": .string,
                "contract": .identifier
            ]),
            ResultType(name: "SBDGetPlan", fields: [
                "feeMonthly": .float,
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
            ResultType(name: "Messages", fields: [
                "id": .identifier,
                "hardware": .identifier,
                "payload": .string,
                "txAt": .date,
                "rxAt": .date,
                "cdrReference": .float,
                "cepRadius": .float,
                "latitude": .float,
                "longitude": .float,
                "momsn": .float,
                "status": .string
            ]),
            ResultType(name: "Requests", fields: [
                "requestAt": .optional(.date),
                "message": .optional(.identifier),
                "hardware": .identifier,
                "status": .string
            ]),
            ResultType(name: "DataMTMessages", fields: [
                "createdAt": .date,
                "queueSize": .float,
                "size": .float,
                "payload": .string,
                "id": .identifier,
                "submittedAt": .date,
                "hardware": .identifier,
                "status": .string
            ]),
            ResultType(name: "BillingGroups", fields: [
                "default": .boolean,
                "name": .string,
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
                            "name": .string,
                            "description": .string,
                            "id": .identifier,
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
                                "localNumber": .optional(.string),
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
//                                "at": .float,
//                                "error": .string
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
                                "default": .boolean,
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
            ),
            Endpoint(
                name: "SBD",
                documentation: URL(string: "https://docs.cloudloop.com/reference#create-subscriber")!,
                functions: [
                    Function(
                        name: "CreateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#create")!,
                        resultType: ResultType(name: "CreateSubscriberResult", fields: [
                            "createdAt": .date,
                            "contract": .optional(.identifier),
                            "billingGroup": .identifier,
                            "name": .string,
                            "description": .string,
                            "id": .identifier,
                            "account": .identifier,
                            "hardware": .identifier
                        ]),
                        parameters: [
                            Parameter(
                                name: "hardware",
                                description: "Cloudloop Hardware Id",
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
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-subscriber")!,
                        resultType: ResultType(name: "GetSubscriberResult",
                            fields: [
                                "createdAt": .date,
                                "contract": .structure("SBDContract"),
                                "destinations": .array(.string),
                                "billingGroup": .identifier,
                                "name": .string,
                                "description": .string,
                                "id": .identifier,
                                "account": .identifier,
                                "hardware": .structure("Hardware")
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .identifier
                            ),
                            Parameter(
                                name: "imei",
                                description: "IMEI of Subscriber",
                                type: .string
                            ),
                        ]
                    ),
                    Function(
                        name: "SearchSubscribers",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#search-subscribers")!,
                        resultType: ResultType(name: "SearchSubscribersResult",
                            fields: [
                                "subscribers": .array(.structure("SBDSubscribers"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "query",
                                description: "name or IMEI",
                                type: .string
                            ),
                            Parameter(
                                name: "status",
                                description: "ACTIVATING / ACTIVATED / DEACTIVATING / DEACTIVATED / SUSPENDING / SUSPENDED / RESUMING / CHANGING / INVALID",
                                type: .string
                            ),
                            Parameter(
                                name: "hardware",
                                description: "Hardware ID",
                                type: .identifier
                            ),
                        ]
                    ),
                    Function(
                        name: "GetUsage",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-usage")!,
                        resultType: ResultType(name: "GetUsageResult",
                            fields: [
                                "usage": .structure("SBDUsage")
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
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
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-usage-summary")!,
                        resultType: ResultType(name: "GetUsageSummaryResult",
                            fields: [
                                "summary": .structure("UsageSummary")
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
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
                        name: "GetPlans",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-plans")!,
                        resultType: ResultType(name: "GetPlansResult",
                            fields: [
                                "plans": .structure("SBDGetPlans")
                            ]),
                        parameters: []
                    ),
                    Function(
                        name: "GetContracts",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-contracts")!,
                        resultType: ResultType(name: "GetContractsResult",
                            fields: [
                                "contracts": .array(.structure("SBDGetContracts"))
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
                        name: "ActivateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#activate-subscriber")!,
                        resultType: ResultType(name: "ActivateSubscriberResult",
                            fields: [
                                "subscriber" : .identifier,
                                "networkStatus": .string,
                                "from": .date,
                                "id": .identifier,
                                "state": .string,
                                "to": .optional(.date),
                                "plan": .structure("Plan")
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
                        name: "DeactivateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#deactivate-subscriber")!,
                        resultType: ResultType(name: "DeactivateSubscriberResult",
                            fields: [
                                "subscriber" : .identifier,
                                "networkStatus": .string,
                                "from": .date,
                                "id": .identifier,
                                "state": .string,
                                "to": .date,
                                "plan": .structure("Plan")
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
                        documentation: URL(string: "https://docs.cloudloop.com/reference#resume-subscriber")!,
                        resultType: ResultType(name: "ResumeSubscriberResult",
                            fields: [
                                "subscriber" : .identifier,
                                "networkStatus": .string,
                                "from": .date,
                                "id": .identifier,
                                "state": .string,
                                "to": .optional(.date),
                                "plan": .structure("Plan")
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
                        documentation: URL(string: "https://docs.cloudloop.com/reference#suspend-subscriber-1")!,
                        resultType: ResultType(name: "SuspendSubscriberResult",
                            fields: [
                                "subscriber" : .identifier,
                                "networkStatus": .string,
                                "from": .date,
                                "id": .identifier,
                                "state": .string,
                                "to": .date,
                                "plan": .structure("Plan")
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
                        documentation: URL(string: "https://docs.cloudloop.com/reference#change-subscriber")!,
                        resultType: ResultType(name: "ChangeSubscriberResult",
                            fields: [
                                "subscriber" : .identifier,
                                "networkStatus": .string,
                                "from": .date,
                                "id": .identifier,
                                "state": .string,
                                "to": .optional(.date),
                                "plan": .structure("Plan")
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .identifier
                            ),
                            Parameter(
                                name: "plan",
                                description: "CloudLoop SBD Plan NAME",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "UpdateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#update-subscriber")!,
                        resultType: ResultType(name: "UpdateSubscriberResult",
                            fields: [
                                "createdAt": .date,
                                "contract": .identifier,
                                "billingGroup": .identifier,
                                "name": .string,
                                "description": .string,
                                "id": .identifier,
                                "account": .identifier,
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
                            ),
                        ]
                    ),
                    Function(
                        name: "CreateDestination",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#create-destination")!,
                        resultType: ResultType(name: "CreateDestinationResult",
                            fields: [
                                "moack": .boolean,
                                "destination": .string,
                                "id": .identifier,
                                "type": .identifier,
                                "geodata": .boolean
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .identifier
                            ),
                            Parameter(
                                name: "destination",
                                type: .string
                            ),
                            Parameter(
                                name: "type",
                                description: "DIRECT_IP, EMAIL, IMEI",
                                type: .string
                            ),
                            Parameter(
                                name: "moack",
                                type: .boolean
                            ),
                            Parameter(
                                name: "geodata",
                                type: .boolean
                            )
                        ]
                    ),
                    Function(
                        name: "DeleteDestination",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#delete-destination")!,
                        resultType: ResultType(name: "DeleteDestinationResult",
                            fields: [
                                "result": .boolean
                            ]),
                        parameters: [
                        Parameter(
                            name: "destination",
                            type: .string)
                        ]
                    ),
                    Function(
                        name: "ReassociateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#swap-subscriber")!,
                        resultType: ResultType(name: "ReassociateSubscriberResult",
                            fields: [
                                "subscriber" : .identifier,
                                "networkStatus": .string,
                                "from": .date,
                                "id": .identifier,
                                "state": .string,
                                "to": .optional(.date),
                                "plan": .structure("Plan")
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .identifier
                            ),
                            Parameter(
                                name: "hardware",
                                description: "Hardware ID",
                                type: .identifier
                            )
                        ]
                    ),
                    Function(
                        name: "AssignBillingGroup",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#assign-billing-group")!,
                        resultType: ResultType(name: "AssignBillingGroupResult",
                            fields: [
                                "default": .boolean,
                                "name": .string,
                                "id": .identifier,
                                "account": .identifier
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .identifier
                            ),
                            Parameter(
                                name: "billingGroup",
                                description: "Billing Group ID",
                                type: .identifier
                            )
                        ]
                    )
                ]
            ),
            Endpoint(
                name: "Data (MO)",
                documentation: URL(string: "https://docs.cloudloop.com/reference#retrieve-messages")!,
                functions: [
                    Function(
                        name: "ReceiveMessage",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#retrieve-messages")!,
                        resultType: ResultType(name: "ReceiveMessageResult",
                            fields: [
                                "messages": .array(.structure("Messages"))
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "hardware",
                                description: "CloudLoop Hardware ID",
                                type: .identifier
                            ),
                            Parameter(
                                name: "from",
                                description: "Using the ISO_LOCAL_DATE_TIME format",
                                type: .date
                            ),
                            Parameter(
                                name: "hardware",
                                description: "Using the ISO_LOCAL_DATE_TIME format",
                                type: .date
                            )
                        ]
                    ),
                    Function(
                        name: "ReceiveMessage (Long Poll)",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#retrieve-messages-long-poll")!,
                        resultType: ResultType(name: "ReceiveMessageLongPollResult",
                            fields: [
                                "lastMessageRetreived": .identifier,
                                "messages": .array(.structure("Messages"))
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "maxPollTime",
                                description: "Maximum Poll Time (0 - 60 secs)",
                                type: .int32
                            ),
                            Parameter(
                                name: "lastMessageReceived",
                                description: "Last Message Id retrieved by client (omitted, if unknown)",
                                type: .string
                            )
                        ]
                    )
                ]
            ),
            Endpoint(
                name: "Data (MT)",
                documentation: URL(string: "https://docs.cloudloop.com/reference#send-message")!,
                functions: [
                    Function(
                        name: "SendMessage",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#send-message")!,
                        resultType: ResultType(name: "SendMessageResult",
                            fields: [
                                "requests": .array(.structure("Requests"))
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "hardware",
                                description: "csv list of cloudloop hardware id",
                                type: .identifier
                            ),
                            Parameter(
                                name: "payload",
                                description: "hex-encoded message payload",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "GetMessage",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-message-status")!,
                        resultType: ResultType(name: "GetMessageResult",
                            fields: [
                                "id": .identifier,
                                "status": .string,
                                "createdAt": .date,
                                "payload": .string,
                                "submittedAt": .date,
                                "hardware": .identifier,
                                "queueSize": .float
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "message",
                                description: "cloudloop mt message id",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "GetMessages",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-messages")!,
                        resultType: ResultType(name: "GetMessagesResult",
                            fields: [
                                "messages": .array(.structure("DataMTMessages"))
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "hardware",
                                description: "cloudloop hardware id",
                                type: .identifier
                            ),
                            Parameter(
                                name: "from",
                                description: "Using the ISO_LOCAL_DATE_TIME format",
                                type: .date
                            ),
                            Parameter(
                                name: "to",
                                description: "Using the ISO_LOCAL_DATE_TIME format",
                                type: .date
                            )
                        ]
                    ),
                    Function(
                        name: "GetMessagesPolled",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#getmessagespolled")!,
                        resultType: ResultType(name: "GetMessagesPolledResult",
                            fields: [
                                "messages": .array(.structure("DataMTMessages"))
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "lastMessageRetrieved",
                                description: "ID of last message seen",
                                type: .identifier
                            ),
                            Parameter(
                                name: "maxPollTime",
                                description: "Maximum Poll Time (0 - 60 secs)",
                                type: .int32
                            )
                        ]
                    ),
                ]
            ),
            Endpoint(
                name: "Hardware",
                documentation: URL(string: "https://docs.cloudloop.com/reference#create-hardware")!,
                functions: [
                    Function(
                        name: "CreateHardware",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#create-hardware")!,
                        resultType: ResultType(name: "CreateHardwareResult",
                            fields: [
                                "imei": .string,
                                "id": .identifier,
                                "type": .string
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "imei",
                                type: .string
                            ),
                            Parameter(
                                name: "type",
                                description: "Type (IRIDIUM_SBD, IRIDIUM_TELEPHONY)",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "GetHardware",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-hardware")!,
                        resultType: ResultType(name: "GetHardwareResult",
                            fields: [
                                "imei": .string,
                                "id": .identifier,
                                "type": .string
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "hardware",
                                description: "Cloudloop Hardware Id",
                                type: .identifier
                            ),
                            Parameter(
                                name: "imei",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "SearchHardware",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#search-hardware")!,
                        resultType: ResultType(name: "SearchHardwareResult",
                            fields: [
                                "imei": .string,
                                "id": .identifier,
                                "type": .string
                            ]
                        ),
                        parameters: []
                    )
                ]
            ),
            Endpoint(
                name: "Sim",
                documentation: URL(string: "https://docs.cloudloop.com/reference#create-sim")!,
                functions: [
                    Function(
                        name: "CreateSim",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#create-sim")!,
                        resultType: ResultType(name: "CreateSimResult",
                            fields: [
                                "iccid": .string,
                                "id": .identifier
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "iccid",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "GetSim",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-sim")!,
                        resultType: ResultType(name: "GetSimResult",
                            fields: [
                                "sim": .string,
                                "id": .identifier
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "sim",
                                description: "CloudLoop Sim ID",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "SearchSims",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-sims")!,
                        resultType: ResultType(name: "SearchSimsResult",
                            fields: [
                                "iccid": .string,
                                "id": .identifier
                            ]
                        ),
                        parameters: []
                    )
                ]
            ),
            Endpoint(
                name: "Account",
                documentation: URL(string: "https://docs.cloudloop.com/reference#create-billing-group")!,
                functions: [
                    Function(
                        name: "CreateBillingGroup",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#create-billing-group")!,
                        resultType: ResultType(name: "CreateBillingGroup",
                            fields: [
                                "default": .boolean,
                                "name": .string,
                                "id": .identifier,
                                "account": .identifier
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "name",
                                description: "Name of the billing group",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "GetBillingGroups",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-billing-groups")!,
                        resultType: ResultType(name: "GetBillingGroupsResult",
                            fields: [
                                "billingGroup": .array(.structure("BillingGroups"))
                            ]
                        ),
                        parameters: []
                    ),
                    Function(
                        name: "DeleteBillingGroup",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#delete-billing-group")!,
                        resultType: ResultType(name: "DeleteBillingGroupResult",
                            fields: [
                                "result": .boolean
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "BillingGroup",
                                description: "ID of the billing group(cannot be the default)",
                                type: .string
                            )
                        ]
                    )
                ]
            ),
            Endpoint(
                name: "User",
                documentation: URL(string: "https://docs.cloudloop.com/reference#generate-token")!,
                functions: [
                    Function(
                        name: "GenerateToken",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#generate-token")!,
                        resultType: ResultType(name: "GenerateTokenResult",
                            fields: [
                                "token": .identifier
                            ]
                        ),
                        parameters: []
                    )
                ]
            ),
            Endpoint(
                name: "Platform",
                documentation: URL(string: "https://docs.cloudloop.com/reference#ping")!,
                functions: [
                    Function(
                        name: "Ping",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#ping")!,
                        resultType: ResultType(name: "PingResult",
                            fields: [
                                "ping": .string
                            ]
                        ),
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
