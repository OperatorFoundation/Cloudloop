// Types.swift

import Foundation

public struct SimResult: Codable
{
	public let iccid: String
	public let id: String

    public init(token: String, iccid: String, id: String)
    {
		self.iccid = iccid
		self.id = id
    }
}

public struct HardwareResult: Codable
{
	public let imei: String
	public let id: String
	public let type: String
	public let account: String

    public init(token: String, imei: String, id: String, type: String, account: String)
    {
		self.imei = imei
		self.id = id
		self.type = type
		self.account = account
    }
}

public struct Subscriber: Codable
{
	public let createdAt: String
	public let sim: String?
	public let contract: String?
	public let billingGroup: String
	public let name: String
	public let description: String
	public let id: String
	public let account: String

    public init(token: String, createdAt: String, sim: String?, contract: String?, billingGroup: String, name: String, description: String, id: String, account: String)
    {
		self.createdAt = createdAt
		self.sim = sim
		self.contract = contract
		self.billingGroup = billingGroup
		self.name = name
		self.description = description
		self.id = id
		self.account = account
    }
}

public struct Usage: Codable
{
	public let duration: Float
	public let at: String
	public let cost: Float
	public let fee: String
	public let contract: String

    public init(token: String, duration: Float, at: String, cost: Float, fee: String, contract: String)
    {
		self.duration = duration
		self.at = at
		self.cost = cost
		self.fee = fee
		self.contract = contract
    }
}

public struct UsageSummary: Codable
{
	public let month: Float
	public let year: Float
	public let contract: String
	public let id: String
	public let calculatedAt: String
	public let remaining: Float
	public let utilisation: Float
	public let allocated: Float

    public init(token: String, month: Float, year: Float, contract: String, id: String, calculatedAt: String, remaining: Float, utilisation: Float, allocated: Float)
    {
		self.month = month
		self.year = year
		self.contract = contract
		self.id = id
		self.calculatedAt = calculatedAt
		self.remaining = remaining
		self.utilisation = utilisation
		self.allocated = allocated
    }
}

public struct PoolSummary: Codable
{
	public let month: Float
	public let year: Float
	public let id: String
	public let plan: String
	public let calculatedAt: String
	public let remaining: Float
	public let utilisation: Float
	public let allocated: Float

    public init(token: String, month: Float, year: Float, id: String, plan: String, calculatedAt: String, remaining: Float, utilisation: Float, allocated: Float)
    {
		self.month = month
		self.year = year
		self.id = id
		self.plan = plan
		self.calculatedAt = calculatedAt
		self.remaining = remaining
		self.utilisation = utilisation
		self.allocated = allocated
    }
}

public struct Contract: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String?
	public let plan: Plan
	public let hardware: String

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String?, plan: Plan, hardware: String)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
		self.hardware = hardware
    }
}

public struct GetContract: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String?
	public let commitedTo: String?
	public let imsi: String?
	public let msisdn: String?
	public let localNumberAccess: Bool
	public let localNumber: String?
	public let plan: ContractPlan
	public let hardware: String

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String?, commitedTo: String?, imsi: String?, msisdn: String?, localNumberAccess: Bool, localNumber: String?, plan: ContractPlan, hardware: String)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.commitedTo = commitedTo
		self.imsi = imsi
		self.msisdn = msisdn
		self.localNumberAccess = localNumberAccess
		self.localNumber = localNumber
		self.plan = plan
		self.hardware = hardware
    }
}

public struct Plan: Codable
{
	public let feeMonthly: Float
	public let inclusive: Float
	public let suspendible: Bool
	public let description: String
	public let increment: Float
	public let commitment: Float
	public let transitionFees: Bool
	public let pooled: Bool
	public let activationFee: Float
	public let terminationFee: Float
	public let terminable: Bool
	public let name: String
	public let currency: String
	public let id: String
	public let minimum: Float

    public init(token: String, feeMonthly: Float, inclusive: Float, suspendible: Bool, description: String, increment: Float, commitment: Float, transitionFees: Bool, pooled: Bool, activationFee: Float, terminationFee: Float, terminable: Bool, name: String, currency: String, id: String, minimum: Float)
    {
		self.feeMonthly = feeMonthly
		self.inclusive = inclusive
		self.suspendible = suspendible
		self.description = description
		self.increment = increment
		self.commitment = commitment
		self.transitionFees = transitionFees
		self.pooled = pooled
		self.activationFee = activationFee
		self.terminationFee = terminationFee
		self.terminable = terminable
		self.name = name
		self.currency = currency
		self.id = id
		self.minimum = minimum
    }
}

public struct GetPlan: Codable
{
	public let inclusive: Float
	public let pooled: Bool
	public let suspendible: Bool
	public let name: String
	public let description: String
	public let increment: Float
	public let commitment: Float
	public let currency: String
	public let id: String
	public let minimum: Float

    public init(token: String, inclusive: Float, pooled: Bool, suspendible: Bool, name: String, description: String, increment: Float, commitment: Float, currency: String, id: String, minimum: Float)
    {
		self.inclusive = inclusive
		self.pooled = pooled
		self.suspendible = suspendible
		self.name = name
		self.description = description
		self.increment = increment
		self.commitment = commitment
		self.currency = currency
		self.id = id
		self.minimum = minimum
    }
}

public struct ContractPlan: Codable
{
	public let feeMonthly: Float
	public let inclusive: Float
	public let pooled: Bool
	public let suspendible: Bool
	public let name: String
	public let description: String
	public let increment: Float
	public let commitment: Float
	public let id: String
	public let minimum: Float

    public init(token: String, feeMonthly: Float, inclusive: Float, pooled: Bool, suspendible: Bool, name: String, description: String, increment: Float, commitment: Float, id: String, minimum: Float)
    {
		self.feeMonthly = feeMonthly
		self.inclusive = inclusive
		self.pooled = pooled
		self.suspendible = suspendible
		self.name = name
		self.description = description
		self.increment = increment
		self.commitment = commitment
		self.id = id
		self.minimum = minimum
    }
}

public struct SBDContract: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let committedTo: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String?
	public let plan: SBDPlan
	public let hardware: String

    public init(token: String, subscriber: String, networkStatus: String, committedTo: String, from: String, id: String, state: String, to: String?, plan: SBDPlan, hardware: String)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.committedTo = committedTo
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
		self.hardware = hardware
    }
}

public struct SBDGetContracts: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let committedTo: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String?
	public let plan: Plan
	public let hardware: String

    public init(token: String, subscriber: String, networkStatus: String, committedTo: String, from: String, id: String, state: String, to: String?, plan: Plan, hardware: String)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.committedTo = committedTo
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
		self.hardware = hardware
    }
}

public struct SBDPlan: Codable
{
	public let feeMonthly: Float
	public let inclusive: Float
	public let suspendible: Bool
	public let description: String
	public let increment: Float
	public let commitment: Float
	public let transitionFees: Bool
	public let pooled: Bool
	public let feeActivation: Float
	public let feeTermination: Float
	public let terminable: Bool
	public let name: String
	public let currency: String
	public let id: String
	public let minimum: Float

    public init(token: String, feeMonthly: Float, inclusive: Float, suspendible: Bool, description: String, increment: Float, commitment: Float, transitionFees: Bool, pooled: Bool, activationFee: Float, terminationFee: Float, terminable: Bool, name: String, currency: String, id: String, minimum: Float)
    {
		self.feeMonthly = feeMonthly
		self.inclusive = inclusive
		self.suspendible = suspendible
		self.description = description
		self.increment = increment
		self.commitment = commitment
		self.transitionFees = transitionFees
		self.pooled = pooled
		self.feeActivation = activationFee
		self.feeTermination = terminationFee
		self.terminable = terminable
		self.name = name
		self.currency = currency
		self.id = id
		self.minimum = minimum
    }
}

public struct SBDSubscriber: Codable
{
	public let createdAt: String
	public let lastSeen: String?
	public let contract: String?
	public let billingGroup: String
	public let name: String
	public let description: String?
	public let id: String
	public let customMonitorThreshold: String?
	public let account: String
	public let hardware: String

    public init(token: String, createdAt: String, lastSeen: String?, contract: String?, billingGroup: String, name: String, description: String?, id: String, customMonitorThreshold: String?, account: String, hardware: String)
    {
		self.createdAt = createdAt
		self.lastSeen = lastSeen
		self.contract = contract
		self.billingGroup = billingGroup
		self.name = name
		self.description = description
		self.id = id
		self.customMonitorThreshold = customMonitorThreshold
		self.account = account
		self.hardware = hardware
    }
}

public struct SBDSearchSubscriber: Codable
{
	public let createdAt: String
	public let lastSeen: String
	public let contract: String
	public let billingGroup: String
	public let name: String
	public let description: String
	public let id: String
	public let account: String
	public let hardware: String

    public init(token: String, createdAt: String, lastSeen: String, contract: String, billingGroup: String, name: String, description: String, id: String, account: String, hardware: String)
    {
		self.createdAt = createdAt
		self.lastSeen = lastSeen
		self.contract = contract
		self.billingGroup = billingGroup
		self.name = name
		self.description = description
		self.id = id
		self.account = account
		self.hardware = hardware
    }
}

public struct SBDUsage: Codable
{
	public let momsn: Float
	public let at: String
	public let cost: Float
	public let size: Float
	public let fee: String
	public let contract: String

    public init(token: String, momsn: Float, at: String, cost: Float, size: Float, fee: String, contract: String)
    {
		self.momsn = momsn
		self.at = at
		self.cost = cost
		self.size = size
		self.fee = fee
		self.contract = contract
    }
}

public struct SBDGetPlans: Codable
{
	public let feeMonthly: Float
	public let inclusive: Float
	public let suspendible: Bool
	public let description: String
	public let increment: Float
	public let commitment: Float
	public let transitionFees: Bool
	public let pooled: Bool
	public let activationFee: Float
	public let terminationFee: Float
	public let terminable: Bool
	public let name: String
	public let currency: String
	public let id: String
	public let minimum: Float

    public init(token: String, feeMonthly: Float, inclusive: Float, suspendible: Bool, description: String, increment: Float, commitment: Float, transitionFees: Bool, pooled: Bool, activationFee: Float, terminationFee: Float, terminable: Bool, name: String, currency: String, id: String, minimum: Float)
    {
		self.feeMonthly = feeMonthly
		self.inclusive = inclusive
		self.suspendible = suspendible
		self.description = description
		self.increment = increment
		self.commitment = commitment
		self.transitionFees = transitionFees
		self.pooled = pooled
		self.activationFee = activationFee
		self.terminationFee = terminationFee
		self.terminable = terminable
		self.name = name
		self.currency = currency
		self.id = id
		self.minimum = minimum
    }
}

public struct CloudloopMessage: Codable
{
	public let id: String
	public let hardware: String
	public let payload: String
	public let txAt: String
	public let rxAt: String
	public let cdrReference: Float
	public let cepRadius: Float
	public let latitude: Float
	public let longitude: Float
	public let momsn: Float
	public let status: String

    public init(token: String, id: String, hardware: String, payload: String, txAt: String, rxAt: String, cdrReference: Float, cepRadius: Float, latitude: Float, longitude: Float, momsn: Float, status: String)
    {
		self.id = id
		self.hardware = hardware
		self.payload = payload
		self.txAt = txAt
		self.rxAt = rxAt
		self.cdrReference = cdrReference
		self.cepRadius = cepRadius
		self.latitude = latitude
		self.longitude = longitude
		self.momsn = momsn
		self.status = status
    }
}

public struct Requests: Codable
{
	public let requestAt: String?
	public let message: String?
	public let hardware: String
	public let status: String

    public init(token: String, requestAt: String?, message: String?, hardware: String, status: String)
    {
		self.requestAt = requestAt
		self.message = message
		self.hardware = hardware
		self.status = status
    }
}

public struct DataMTMessages: Codable
{
	public let createdAt: String
	public let queueSize: Float
	public let size: Float
	public let payload: String
	public let id: String
	public let submittedAt: String
	public let hardware: String
	public let status: String

    public init(token: String, createdAt: String, queueSize: Float, size: Float, payload: String, id: String, submittedAt: String, hardware: String, status: String)
    {
		self.createdAt = createdAt
		self.queueSize = queueSize
		self.size = size
		self.payload = payload
		self.id = id
		self.submittedAt = submittedAt
		self.hardware = hardware
		self.status = status
    }
}

public struct BillingGroups: Codable
{
	public let `default`: Bool
	public let name: String
	public let id: String
	public let account: String

    public init(token: String, default: Bool, name: String, id: String, account: String)
    {
		self.`default` = `default`
		self.name = name
		self.id = id
		self.account = account
    }
}

public struct TelephonyCreateSubscriber: Codable
{
	public let createdAt: String
	public let sim: String
	public let contract: String?
	public let billingGroup: String
	public let name: String
	public let description: String
	public let id: String
	public let account: String

    public init(token: String, createdAt: String, sim: String, contract: String?, billingGroup: String, name: String, description: String, id: String, account: String)
    {
		self.createdAt = createdAt
		self.sim = sim
		self.contract = contract
		self.billingGroup = billingGroup
		self.name = name
		self.description = description
		self.id = id
		self.account = account
    }
}

public struct TelephonyGetSubscriber: Codable
{
	public let createdAt: String
	public let sim: SimResult
	public let contract: Contract
	public let name: String
	public let description: String
	public let id: String
	public let account: String
	public let hardware: HardwareResult
	public let billingGroup: String

    public init(token: String, createdAt: String, sim: SimResult, contract: Contract, name: String, description: String, id: String, account: String, hardware: HardwareResult, billingGroup: String)
    {
		self.createdAt = createdAt
		self.sim = sim
		self.contract = contract
		self.name = name
		self.description = description
		self.id = id
		self.account = account
		self.hardware = hardware
		self.billingGroup = billingGroup
    }
}

public struct TelephonyActivateSubscriber: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String?
	public let localNumberAccess: Bool
	public let localNumber: String?
	public let plan: Plan
	public let hardware: String

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String?, localNumberAccess: Bool, localNumber: String?, plan: Plan, hardware: String)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.localNumberAccess = localNumberAccess
		self.localNumber = localNumber
		self.plan = plan
		self.hardware = hardware
    }
}

public struct TelephonyDeactivateSubscriber: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String?
	public let plan: Plan
	public let hardware: String

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String?, plan: Plan, hardware: String)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
		self.hardware = hardware
    }
}

public struct TelephonyResumeSubscriber: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String?
	public let plan: Plan
	public let hardware: String

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String?, plan: Plan, hardware: String)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
		self.hardware = hardware
    }
}

public struct TelephonySuspendSubscriber: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String
	public let plan: Plan
	public let hardware: String

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String, plan: Plan, hardware: String)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
		self.hardware = hardware
    }
}

public struct TelephonyChangeSubscriber: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String?
	public let plan: Plan
	public let hardware: String

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String?, plan: Plan, hardware: String)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
		self.hardware = hardware
    }
}

public struct TelephonyUpdateSubscriber: Codable
{
	public let createdAt: String
	public let contract: String
	public let billingGroup: String
	public let name: String
	public let description: String
	public let id: String
	public let accoundt: String
	public let hardware: String

    public init(token: String, createdAt: String, contract: String, billingGroup: String, name: String, description: String, id: String, accoundt: String, hardware: String)
    {
		self.createdAt = createdAt
		self.contract = contract
		self.billingGroup = billingGroup
		self.name = name
		self.description = description
		self.id = id
		self.accoundt = accoundt
		self.hardware = hardware
    }
}

public struct TelephonyReassociateSubscriber: Codable
{
	public let createdAt: String
	public let sim: SimResult
	public let contract: String?
	public let billingGroup: String
	public let name: String
	public let description: String
	public let id: String
	public let account: String
	public let hardware: String?

    public init(token: String, createdAt: String, sim: SimResult, contract: String?, billingGroup: String, name: String, description: String, id: String, account: String, hardware: String?)
    {
		self.createdAt = createdAt
		self.sim = sim
		self.contract = contract
		self.billingGroup = billingGroup
		self.name = name
		self.description = description
		self.id = id
		self.account = account
		self.hardware = hardware
    }
}

public struct SBDCreateSubscriber: Codable
{
	public let createdAt: String
	public let contract: String?
	public let billingGroup: String
	public let name: String
	public let description: String
	public let id: String
	public let account: String
	public let hardware: String

    public init(token: String, createdAt: String, contract: String?, billingGroup: String, name: String, description: String, id: String, account: String, hardware: String)
    {
		self.createdAt = createdAt
		self.contract = contract
		self.billingGroup = billingGroup
		self.name = name
		self.description = description
		self.id = id
		self.account = account
		self.hardware = hardware
    }
}

public struct SBDGetSubscriber: Codable
{
	public let createdAt: String
	public let lastSeen: String
	public let contract: SBDContract
	public let billingGroup: String
//	public let destinations: [SBDDestination]
	public let name: String
	public let description: String?
	public let id: String
	public let customMonitorThreshold: Float?
	public let account: String
	public let hardware: HardwareResult

    public init(token: String, createdAt: String, lastSeen: String, contract: SBDContract, billingGroup: String, name: String, description: String, id: String, customMonitorThreshold: Float?, account: String, hardware: HardwareResult)
    {
		self.createdAt = createdAt
		self.lastSeen = lastSeen
		self.contract = contract
		self.billingGroup = billingGroup
		// self.destinations = destinations
		self.name = name
		self.description = description
		self.id = id
		self.customMonitorThreshold = customMonitorThreshold
		self.account = account
		self.hardware = hardware
    }
}

public struct SBDActivateSubscriber: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String?
	public let plan: Plan

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String?, plan: Plan)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
    }
}

public struct SBDDeactivateSubscriber: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String
	public let plan: Plan

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String, plan: Plan)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
    }
}

public struct SBDResumeSubscriber: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String?
	public let plan: Plan

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String?, plan: Plan)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
    }
}

public struct SBDSuspendSubscriber: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String
	public let plan: Plan

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String, plan: Plan)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
    }
}

public struct SBDChangeSubscriber: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String?
	public let plan: Plan

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String?, plan: Plan)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
    }
}

public struct SBDUpdateSubscriber: Codable
{
	public let createdAt: String
	public let contract: String
	public let billingGroup: String
	public let name: String
	public let description: String
	public let id: String
	public let account: String
	public let hardware: String

    public init(token: String, createdAt: String, contract: String, billingGroup: String, name: String, description: String, id: String, account: String, hardware: String)
    {
		self.createdAt = createdAt
		self.contract = contract
		self.billingGroup = billingGroup
		self.name = name
		self.description = description
		self.id = id
		self.account = account
		self.hardware = hardware
    }
}

public struct SBDCreateDestination: Codable
{
	public let route: String?
	public let moack: Bool
	public let destination: String
	public let id: String
	public let type: String
	public let geodata: Bool

    public init(token: String, route: String?, moack: Bool, destination: String, id: String, type: String, geodata: Bool)
    {
		self.route = route
		self.moack = moack
		self.destination = destination
		self.id = id
		self.type = type
		self.geodata = geodata
    }
}

public struct SBDReassociateSubscriber: Codable
{
	public let subscriber: String
	public let networkStatus: String
	public let from: String
	public let id: String
	public let state: String
	public let to: String?
	public let plan: Plan

    public init(token: String, subscriber: String, networkStatus: String, from: String, id: String, state: String, to: String?, plan: Plan)
    {
		self.subscriber = subscriber
		self.networkStatus = networkStatus
		self.from = from
		self.id = id
		self.state = state
		self.to = to
		self.plan = plan
    }
}

public struct DataMTGetMessage: Codable
{
	public let id: String
	public let status: String
	public let createdAt: String
	public let payload: String
	public let submittedAt: String
	public let hardware: String
	public let queueSize: Float

    public init(token: String, id: String, status: String, createdAt: String, payload: String, submittedAt: String, hardware: String, queueSize: Float)
    {
		self.id = id
		self.status = status
		self.createdAt = createdAt
		self.payload = payload
		self.submittedAt = submittedAt
		self.hardware = hardware
		self.queueSize = queueSize
    }
}

public struct HardwareCreateHardware: Codable
{
	public let imei: String
	public let id: String
	public let type: String

    public init(token: String, imei: String, id: String, type: String)
    {
		self.imei = imei
		self.id = id
		self.type = type
    }
}

public struct HardwareGetHardware: Codable
{
	public let imei: String
	public let id: String
	public let type: String

    public init(token: String, imei: String, id: String, type: String)
    {
		self.imei = imei
		self.id = id
		self.type = type
    }
}

public struct hardwares: Codable
{
	public let imei: String
	public let id: String
	public let type: String

    public init(token: String, imei: String, id: String, type: String)
    {
		self.imei = imei
		self.id = id
		self.type = type
    }
}

public struct CreateSim: Codable
{
	public let iccid: String
	public let id: String

    public init(token: String, iccid: String, id: String)
    {
		self.iccid = iccid
		self.id = id
    }
}

public struct GetSim: Codable
{
	public let sim: String
	public let id: String

    public init(token: String, sim: String, id: String)
    {
		self.sim = sim
		self.id = id
    }
}

public struct SearchSims: Codable
{
	public let iccid: String
	public let id: String

    public init(token: String, iccid: String, id: String)
    {
		self.iccid = iccid
		self.id = id
    }
}

public struct CreateBillingGroup: Codable
{
	public let `default`: Bool
	public let name: String
	public let id: String
	public let account: String

    public init(token: String, default: Bool, name: String, id: String, account: String)
    {
		self.`default` = `default`
		self.name = name
		self.id = id
		self.account = account
    }
}

public struct SBDDestination: Codable
{
	public let route: String?
	public let moack: Bool
	public let destination: String
	public let id: String
	public let type: String
	public let geodata: Bool

    public init(token: String, route: String?, moack: Bool, destination: String, id: String, type: String, geodata: Bool)
    {
		self.route = route
		self.moack = moack
		self.destination = destination
		self.id = id
		self.type = type
		self.geodata = geodata
    }
}
