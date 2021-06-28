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
            ResultType(name: "SimResult", fields: [
                //ResultTypeMatch1
                 ("iccid", .string),
                 ("id", .string)
            ]),
            ResultType(name: "HardwareResult", fields: [
                //ResultTypeMatch2
                 ("imei", .string),
                 ("id", .string),
                 ("type", .string),
                 ("account", .string)
            ]),
            ResultType(name: "Subscriber", fields: [
                 ("createdAt", .string),
                 ("sim", .optional(.string)),
                 ("contract", .optional(.string)),
                 ("billingGroup", .string),
                 ("name", .string),
                 ("description", .string),
                 ("id", .string),
                 ("account", .string)
            ]),
            ResultType(name: "Usage", fields: [
                 ("duration", .float),
                 ("at", .string),
                 ("cost", .float),
                 ("fee", .string),
                 ("contract", .string)
            ]),
            ResultType(name: "UsageSummary", fields: [
                 ("month", .float),
                 ("year", .float),
                 ("contract", .string),
                 ("id", .string),
                 ("calculatedAt", .string),
                 ("remaining", .float),
                 ("utilisation", .float),
                 ("allocated", .float)
            ]),
            ResultType(name: "PoolSummary", fields: [
                 ("month", .float),
                 ("year", .float),
                 ("id", .string),
                 ("plan", .string),
                 ("calculatedAt", .string),
                 ("remaining", .float),
                 ("utilisation", .float),
                 ("allocated", .float)
            ]),
            ResultType(name: "Contract", fields: [
                 ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .optional(.string)),
                 ("plan", .structure("Plan")),
                 ("hardware", .string)
            ]),
            ResultType(name: "GetContract", fields: [
                 ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .optional(.string)),
                 ("commitedTo", .optional(.string)),
                 ("imsi", .optional(.string)),
                 ("msisdn", .optional(.string)),
                 ("localNumberAccess", .boolean),
                 ("localNumber", .optional(.string)),
                 ("plan", .structure("ContractPlan")),
                 ("hardware", .string)
            ]),
            ResultType(name: "Plan", fields: [
                 ("feeMonthly", .float),
                 ("inclusive", .float),
                 ("suspendible", .boolean),
                 ("description", .string),
                 ("increment", .float),
                 ("commitment", .float),
                 ("transitionFees", .boolean),
                 ("pooled", .boolean),
                 ("activationFee", .float),
                 ("terminationFee", .float),
                 ("terminable", .boolean),
                 ("name", .string),
                 ("currency", .string),
                 ("id", .string),
                 ("minimum", .float)
            ]),
            ResultType(name: "GetPlan", fields: [
                 ("inclusive", .float),
                 ("pooled", .boolean),
                 ("suspendible", .boolean),
                 ("name", .string),
                 ("description", .string),
                 ("increment", .float),
                 ("commitment", .float),
                 ("currency", .string),
                 ("id", .string),
                 ("minimum", .float)
            ]),
            ResultType(name: "ContractPlan", fields: [
                 ("feeMonthly", .float),
                 ("inclusive", .float),
                 ("pooled", .boolean),
                 ("suspendible", .boolean),
                 ("name", .string),
                 ("description", .string),
                 ("increment", .float),
                 ("commitment", .float),
                 ("id", .string),
                 ("minimum", .float)
            ]),
            ResultType(name: "SBDContract", fields: [
                 ("subscriber", .string),
                 ("networkStatus", .string),
                 ("committedTo", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .optional(.string)),
                 ("plan", .structure("SBDPlan")),
                 ("hardware", .string)
            ]),
            ResultType(name: "SBDGetContracts", fields: [
                 ("subscriber", .string),
                 ("networkStatus", .string),
                 ("committedTo", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .optional(.string)),
                 ("plan", .structure("Plan")),
                 ("hardware", .string)
            ]),
            ResultType(name: "SBDPlan", fields: [
                 ("feeMonthly", .float),
                 ("inclusive", .float),
                 ("suspendible", .boolean),
                 ("description", .string),
                 ("increment", .float),
                 ("commitment", .float),
                 ("transitionFees", .boolean),
                 ("pooled", .boolean),
                 ("activationFee", .float),
                 ("terminationFee", .float),
                 ("terminable", .boolean),
                 ("name", .string),
                 ("currency", .string),
                 ("id", .string),
                 ("minimum", .float)
            ]),
            ResultType(name: "SBDSubscriber", fields: [
                 ("createdAt", .string),
                 ("lastSeen", .optional(.string)),
                 ("contract", .optional(.string)),
                 ("billingGroup", .string),
                 ("name", .string),
                 ("description", .optional(.string)),
                 ("id", .string),
                 ("customMonitorThreshold", .optional(.string)),
                 ("account", .string),
                 ("hardware", .string)
            ]),
            ResultType(name: "SBDSearchSubscriber", fields: [
                 ("createdAt", .string),
                 ("lastSeen", .string),
                 ("contract", .string),
                 ("billingGroup", .string),
                 ("name", .string),
                 ("description", .string),
                 ("id", .string),
                 ("account", .string),
                 ("hardware", .string)
            ]),
            ResultType(name: "SBDUsage", fields: [
                 ("momsn", .float),
                 ("at", .string),
                 ("cost", .float),
                 ("size", .float),
                 ("fee", .string),
                 ("contract", .string)
            ]),
            ResultType(name: "SBDGetPlans", fields: [
                 ("feeMonthly", .float),
                 ("inclusive", .float),
                 ("suspendible", .boolean),
                 ("description", .string),
                 ("increment", .float),
                 ("commitment", .float),
                 ("transitionFees", .boolean),
                 ("pooled", .boolean),
                 ("activationFee", .float),
                 ("terminationFee", .float),
                 ("terminable", .boolean),
                 ("name", .string),
                 ("currency", .string),
                 ("id", .string),
                 ("minimum", .float)
            ]),
            ResultType(name: "Messages", fields: [
                 ("id", .string),
                 ("hardware", .string),
                 ("payload", .string),
                 ("txAt", .string),
                 ("rxAt", .string),
                 ("cdrReference", .float),
                 ("cepRadius", .float),
                 ("latitude", .float),
                 ("longitude", .float),
                 ("momsn", .float),
                 ("status", .string)
            ]),
            ResultType(name: "Requests", fields: [
                 ("requestAt", .optional(.string)),
                 ("message", .optional(.string)),
                 ("hardware", .string),
                 ("status", .string)
            ]),
            ResultType(name: "DataMTMessages", fields: [
                 ("createdAt", .string),
                 ("queueSize", .float),
                 ("size", .float),
                 ("payload", .string),
                 ("id", .string),
                 ("submittedAt", .string),
                 ("hardware", .string),
                 ("status", .string)
            ]),
            ResultType(name: "BillingGroups", fields: [
                //ResultTypeMatch3
                 ("default", .boolean),
                 ("name", .string),
                 ("id", .string),
                 ("account", .string)
            ]),
            ResultType(name: "TelephonyCreateSubscriber", fields: [
                 ("createdAt", .string),
                 ("sim", .string),
                 ("contract", .optional(.string)),
                 ("billingGroup", .string),
                 ("name", .string),
                 ("description", .string),
                 ("id", .string),
                 ("account", .string)
            ]),
            ResultType(name: "TelephonyGetSubscriber", fields: [
                 ("createdAt", .string),
                 ("sim", .structure("SimResult")),
                 ("contract", .structure("Contract")),
                 ("name", .string),
                 ("description", .string),
                 ("id", .string),
                 ("account", .string),
                 ("hardware", .structure("HardwareResult")),
                 ("billingGroup", .string)
            ]),
            ResultType(name: "TelephonyActivateSubscriber", fields: [
                 ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .optional(.string)),
                 ("localNumberAccess", .boolean),
                 ("localNumber", .optional(.string)),
                 ("plan", .structure("Plan")),
                 ("hardware", .string)
            ]),
            ResultType(name: "TelephonyDeactivateSubscriber", fields: [
                //ResultTypeMatch4
                 ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .optional(.string)),
                 ("plan", .structure("Plan")),
                 ("hardware", .string)
            ]),
            ResultType(name: "TelephonyResumeSubscriber", fields: [
                //ResultTypeMatch4
                 ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .optional(.string)),
                 ("plan", .structure("Plan")),
                 ("hardware", .string)
            ]),
            ResultType(name: "TelephonySuspendSubscriber", fields: [
                 ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .string),
                 ("plan", .structure("Plan")),
                 ("hardware", .string)
            ]),
            ResultType(name: "TelephonyChangeSubscriber", fields: [
                //ResultTypeMatch4
                 ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .optional(.string)),
                 ("plan", .structure("Plan")),
                 ("hardware", .string)
            ]),
            ResultType(name: "TelephonyUpdateSubscriber", fields: [
                 ("createdAt", .string),
                 ("contract", .string),
                 ("billingGroup", .string),
                 ("name", .string),
                 ("description", .string),
                 ("id", .string),
                 ("accoundt", .string),
                 ("hardware", .string)
            ]),
            ResultType(name: "TelephonyReassociateSubscriber", fields: [
                 ("createdAt", .string),
                 ("sim", .structure("SimResult")),
                 ("contract", .optional(.string)),
                 ("billingGroup", .string),
                 ("name", .string),
                 ("description", .string),
                 ("id", .string),
                 ("account", .string),
                 ("hardware", .optional(.string))
            ]),
            ResultType(name: "SBDCreateSubscriber", fields: [
                 ("createdAt", .string),
                 ("contract", .optional(.string)),
                 ("billingGroup", .string),
                 ("name", .string),
                 ("description", .string),
                 ("id", .string),
                 ("account", .string),
                 ("hardware", .string)
            ]),
            ResultType(name: "SBDGetSubscriber", fields: [
                 ("createdAt", .string),
                 ("lastSeen", .string),
                 ("contract", .structure("SBDContract")),
                 ("billingGroup", .string),
                 ("destinations", .array(.structure("SBDDestination"))),
                 ("name", .string),
                 ("description", .string),
                 ("id", .string),
                ("customMonitorThreshold", .optional(.float)),
                 ("account", .string),
                 ("hardware", .structure("HardwareResult"))
            ]),
            ResultType(name: "SBDActivateSubscriber", fields: [
                //ResultTypeMatch5
                ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .optional(.string)),
                 ("plan", .structure("Plan"))
            ]),
            ResultType(name: "SBDDeactivateSubscriber", fields: [
                //ResultTypeMatch5.5
                ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .string),
                 ("plan", .structure("Plan"))
            ]),
            ResultType(name: "SBDResumeSubscriber", fields: [
                //ResultTypeMatch5
                ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .optional(.string)),
                 ("plan", .structure("Plan"))
            ]),
            ResultType(name: "SBDSuspendSubscriber", fields: [
                //ResultTypeMatch5.5
                ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .string),
                 ("plan", .structure("Plan"))
            ]),
            ResultType(name: "SBDChangeSubscriber", fields: [
                //ResultTypeMatch5
                ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .optional(.string)),
                 ("plan", .structure("Plan"))
            ]),
            ResultType(name: "SBDUpdateSubscriber", fields: [
                 ("createdAt", .string),
                 ("contract", .string),
                 ("billingGroup", .string),
                 ("name", .string),
                 ("description", .string),
                 ("id", .string),
                 ("account", .string),
                 ("hardware", .string)
            ]),
            ResultType(name: "SBDCreateDestination", fields: [
                 ("route", .optional(.string)),
                 ("moack", .boolean),
                 ("destination", .string),
                 ("id", .string),
                 ("type", .string),
                 ("geodata", .boolean)
            ]),
            ResultType(name: "SBDReassociateSubscriber", fields: [
                //ResultTypeMatch5
                ("subscriber", .string),
                 ("networkStatus", .string),
                 ("from", .string),
                 ("id", .string),
                 ("state", .string),
                 ("to", .optional(.string)),
                 ("plan", .structure("Plan"))
            ]),
            ResultType(name: "DataMTGetMessage", fields: [
                 ("id", .string),
                 ("status", .string),
                 ("createdAt", .string),
                 ("payload", .string),
                 ("submittedAt", .string),
                 ("hardware", .string),
                 ("queueSize", .float)
            ]),
            ResultType(name: "HardwareCreateHardware", fields: [
                //ResultTypeMatch2
                 ("imei", .string),
                 ("id", .string),
                 ("type", .string)
            ]),
            ResultType(name: "HardwareGetHardware", fields: [
                //ResultTypeMatch2
                 ("imei", .string),
                 ("id", .string),
                 ("type", .string)
            ]),
            ResultType(name: "hardwares", fields: [
                //ResultTypeMatch2
                 ("imei", .string),
                 ("id", .string),
                 ("type", .string)
            ]),
            ResultType(name: "CreateSim", fields: [
                //ResultTypeMatch1
                 ("iccid", .string),
                 ("id", .string)
            ]),
            ResultType(name: "GetSim", fields: [
                 ("sim", .string),
                 ("id", .string)
            ]),
            ResultType(name: "SearchSims", fields: [
                //ResultTypeMatch1
                 ("iccid", .string),
                 ("id", .string)
            ]),
            ResultType(name: "CreateBillingGroup", fields: [
                //ResultTypeMatch3
                 ("default", .boolean),
                 ("name", .string),
                 ("id", .string),
                 ("account", .string)
            ]),
            ResultType(name: "SBDDestination", fields:
                [
                    ("route", .optional(.string)),
                    ("moack", .boolean),
                    ("destination", .string),
                    ("id", .string),
                    ("type", .string),
                    ("geodata", .boolean)
                    
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
                        resultType: ResultType(name: "TelephonyCreateSubscriber", fields: [
                             ("subscriber", .structure("TelephonyCreateSubscriber")),
                        ]),
                        parameters: [
                            Parameter(
                                name: "sim",
                                description: "Cloudloop Sim Id",
                                type: .string
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
                        resultType: ResultType(name: "GetSubscriber", fields: [
                             ("subscriber", .structure("TelephonyGetSubscriber"))
                        ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber Id",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "SearchSubscribers",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#search")!,
                        resultType: ResultType(name: "SearchSubscribers", fields: [
                             ("subscribers", .array(.structure("Subscriber")))
                        ]),
                        parameters: []
                    ),
                    Function(
                        name: "GetUsage",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#usage-1")!,
                        resultType: ResultType(name: "GetUsage",
                            fields: [
                                ("usage", .array(.structure("Usage")))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber Id",
                                type: .string
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
                        resultType: ResultType(name: "GetUsageSummary",
                            fields: [
                                 ("summary", .array(.structure("UsageSummary")))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber Id",
                                type: .string
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
                        resultType: ResultType(name: "GetPoolSummary",
                            fields: [
                                 ("summary", .array(.structure("PoolSummary")))
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
                        resultType: ResultType(name: "GetPlans",
                            fields: [
                                 ("plan", .array(.structure("GetPlan")))
                            ]),
                        parameters: []
                    ),
                    Function(
                        name: "GetContracts",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#retrieve-contracts")!,
                        resultType: ResultType(name: "GetContracts",
                            fields: [
                                 ("contracts", .array(.structure("GetContract")))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber Id",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "ActivateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#activate-1")!,
                        resultType: ResultType(name: "ActivateSubscriber",
                            fields: [
                                 ("contract", .structure("TelephonyActivateSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber Id",
                                type: .string
                            ),
                            Parameter(
                                name: "hardware",
                                description: "CloudLoop Hardware ID",
                                type: .string
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
                            name: "DeactivateSubscriber",
                            fields: [
                                 ("contract", .structure("TelephonyDeactivateSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "ResumeSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#refresh-2")!,
                        resultType: ResultType(name: "ResumeSubscriber",
                            fields: [
                                 ("contract", .structure("TelephonyResumeSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "SuspendSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#suspend-subscriber")!,
                        resultType: ResultType(name: "SuspendSubscriber",
                            fields: [
                                 ("contract", .structure("TelephonySuspendSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "ChangeSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#change-contract")!,
                        resultType: ResultType(name: "ChangeSubscriber",
                            fields: [
                                 ("contract", .structure("TelephonyChangeSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
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
                        resultType: ResultType(name: "UpdateSubscriber",
                            fields: [
                                 ("subscriber", .structure("TelephonyUpdateSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
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
                        resultType: ResultType(name: "ReassociateSubscriber",
                            fields: [
                                 ("subscriber", .structure("TelephonyReassociateSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop subscriber ID",
                                type: .string
                            ),
                            Parameter(
                                name: "sim",
                                description: "CloudLoop sim ID",
                                type: .string
                            ),
                            Parameter(
                                name: "hardware",
                                description: "CloudLoop hardware ID",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "AssignBillingGroup",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#assign-billing-group-1")!,
                        resultType: ResultType(name: "AssignBillingGroup",
                            fields: [
                                 ("default", .boolean),
                                 ("name", .string),
                                 ("id", .string),
                                 ("account", .string)
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "Subscriber ID",
                                type: .string
                            ),
                            Parameter(
                                name: "billingGroup",
                                description: "Billing Group ID",
                                type: .string
                            )
                        ]
                    ),
                ]
            ),
            Endpoint(
                name: "Sbd",
                documentation: URL(string: "https://docs.cloudloop.com/reference#create-subscriber")!,
                functions: [
                    Function(
                        name: "CreateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#create")!,
                        resultType: ResultType(name: "SBDCreateSubscriber", fields: [
                             ("subscriber", .structure("SBDCreateSubscriber"))
                        ]),
                        parameters: [
                            Parameter(
                                name: "hardware",
                                description: "Cloudloop Hardware Id",
                                type: .string
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
                        resultType: ResultType(name: "GetSubscriber",
                            fields: [
                                 ("subscriber", .structure("SBDGetSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
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
                        resultType: ResultType(name: "SearchSubscribers",
                            fields: [
                                 ("subscribers", .array(.structure("SBDSearchSubscriber")))
                            ]),
                        parameters: [
                            Parameter(
                                name: "query",
                                description: "name or IMEI",
                                type: .string,
                                optional: true
                            ),
                            Parameter(
                                name: "status",
                                description: "ACTIVATING / ACTIVATED / DEACTIVATING / DEACTIVATED / SUSPENDING / SUSPENDED / RESUMING / CHANGING / INVALID",
                                type: .string,
                                optional: true
                            ),
                            Parameter(
                                name: "hardware",
                                description: "Hardware ID",
                                type: .string,
                                optional: true
                            ),
                        ]
                    ),
                    Function(
                        name: "GetUsage",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-usage")!,
                        resultType: ResultType(name: "GetUsage",
                            fields: [
                                 ("usage", .structure("SBDUsage"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
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
                        resultType: ResultType(name: "GetUsageSummary",
                            fields: [
                                 ("summary", .structure("UsageSummary"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
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
                        resultType: ResultType(name: "GetPlans",
                            fields: [
                                 ("plans", .array(.structure("SBDGetPlans")))
                            ]),
                        parameters: []
                    ),
                    Function(
                        name: "GetContracts",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#get-contracts")!,
                        resultType: ResultType(name: "GetContracts",
                            fields: [
                                 ("contracts", .array(.structure("SBDGetContracts")))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "ActivateSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#activate-subscriber")!,
                        resultType: ResultType(name: "ActivateSubscriber",
                            fields: [
                                 ("contract", .structure("SBDActivateSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
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
                        resultType: ResultType(name: "DeactivateSubscriber",
                            fields: [
                                 ("contract", .structure("SBDDeactivateSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "ResumeSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#resume-subscriber")!,
                        resultType: ResultType(name: "ResumeSubscriber",
                            fields: [
                                 ("contract", .structure("SBDResumeSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "SuspendSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#suspend-subscriber-1")!,
                        resultType: ResultType(name: "SuspendSubscriber",
                            fields: [
                                 ("contract", .structure("SBDSuspendSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "ChangeSubscriber",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#change-subscriber")!,
                        resultType: ResultType(name: "ChangeSubscriber",
                            fields: [
                                 ("contract", .structure("SBDChangeSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
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
                        resultType: ResultType(name: "UpdateSubscriber",
                            fields: [
                                 ("subscriber", .structure("SBDUpdateSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
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
                        resultType: ResultType(name: "CreateDestination",
                            fields: [
                                 ("destination", .structure("SBDCreateDestination"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
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
                        resultType: ResultType(name: "DeleteDestination",
                            fields: [
                                ("at", .float),
                                ("error", .string)
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
                        resultType: ResultType(name: "ReassociateSubscriber",
                            fields: [
                                 ("contract", .structure("SBDReassociateSubscriber"))
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
                            ),
                            Parameter(
                                name: "hardware",
                                description: "Hardware ID",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "AssignBillingGroup",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#assign-billing-group")!,
                        resultType: ResultType(name: "AssignBillingGroup",
                            fields: [
                                 ("default", .boolean),
                                 ("name", .string),
                                 ("id", .string),
                                 ("account", .string)
                            ]),
                        parameters: [
                            Parameter(
                                name: "subscriber",
                                description: "CloudLoop Subscriber ID",
                                type: .string
                            ),
                            Parameter(
                                name: "billingGroup",
                                description: "Billing Group ID",
                                type: .string
                            )
                        ]
                    )
                ]
            ),
            Endpoint(
                name: "DataMO",
                documentation: URL(string: "https://docs.cloudloop.com/reference#retrieve-messages")!,
                functions: [
                    Function(
                        name: "GetMessages",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#retrieve-messages")!,
                        resultType: ResultType(name: "DataMOGetMessages",
                            fields: [
                                 ("messages", .array(.structure("Messages")))
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "hardware",
                                description: "CloudLoop Hardware ID",
                                type: .string
                            ),
                            Parameter(
                                name: "from",
                                description: "Using the ISO_LOCAL_DATE_TIME format",
                                type: .string
                            ),
                            Parameter(
                                name: "to",
                                description: "Using the ISO_LOCAL_DATE_TIME format",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "GetMessagesPolled",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#retrieve-messages-long-poll")!,
                        resultType: ResultType(name: "ReceiveMessageLongPoll",
                            fields: [
                                 ("lastMessageRetreived", .string),
                                 ("messages", .array(.structure("Messages")))
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
                name: "DataMT",
                documentation: URL(string: "https://docs.cloudloop.com/reference#send-message")!,
                functions: [
                    Function(
                        name: "SendMessage",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#send-message")!,
                        resultType: ResultType(name: "SendMessage",
                            fields: [
                                 ("requests", .array(.structure("Requests")))
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "hardware",
                                description: "csv list of cloudloop hardware id",
                                type: .string
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
                        resultType: ResultType(name: "GetMessage",
                            fields: [
                                 ("message", .structure("DataMTGetMessage"))
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
                        resultType: ResultType(name: "DataMTGetMessages",
                            fields: [
                                 ("messages", .array(.structure("DataMTMessages")))
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "hardware",
                                description: "cloudloop hardware id",
                                type: .string
                            ),
                            Parameter(
                                name: "from",
                                description: "Using the ISO_LOCAL_DATE_TIME format",
                                type: .string
                            ),
                            Parameter(
                                name: "to",
                                description: "Using the ISO_LOCAL_DATE_TIME format",
                                type: .string
                            )
                        ]
                    ),
                    Function(
                        name: "GetMessagesPolled",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#getmessagespolled")!,
                        resultType: ResultType(name: "GetMessagesPolled",
                            fields: [
                                 ("messages", .array(.structure("DataMTMessages")))
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "lastMessageRetrieved",
                                description: "ID of last message seen",
                                type: .string
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
                        resultType: ResultType(name: "CreateHardware",
                            fields: [
                                 ("hardware", .structure("HardwareCreateHardware"))
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
                        resultType: ResultType(name: "GetHardware",
                            fields: [
                                 ("hardware", .structure("HardwareGetHardware"))
                            ]
                        ),
                        parameters: [
                            Parameter(
                                name: "hardware",
                                description: "Cloudloop Hardware Id",
                                type: .string
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
                        resultType: ResultType(name: "SearchHardware",
                            fields: [
                                 ("hardwares", .array(.structure("hardwares")))
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
                        resultType: ResultType(name: "CreateSim",
                            fields: [
                                 ("sim", .structure("CreateSim"))
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
                        resultType: ResultType(name: "GetSim",
                            fields: [
                                 ("sim", .structure("GetSim"))
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
                        resultType: ResultType(name: "SearchSims",
                            fields: [
                                 ("sims", .array(.structure("SearchSims")))
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
                                 ("billingGroup", .structure("CreateBillingGroup"))
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
                        resultType: ResultType(name: "GetBillingGroups",
                            fields: [
                                 ("billingGroup", .array(.structure("BillingGroups")))
                            ]
                        ),
                        parameters: []
                    ),
                    Function(
                        name: "DeleteBillingGroup",
                        documentation: URL(string: "https://docs.cloudloop.com/reference#delete-billing-group")!,
                        resultType: ResultType(name: "DeleteBillingGroup",
                            fields: [
                                 ("result", .boolean)
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
                        resultType: ResultType(name: "GenerateToken",
                            fields: []
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
                        resultType: ResultType(name: "Ping",
                            fields: [
                                 ("ping", .string)
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
