// Types.swift

import Foundation

public struct SimResult: Codable
{
	let iccid: String
	let id: Identifier
}

public struct HardwareResult: Codable
{
	let imei: String
	let id: Identifier
	let type: String
}

public struct Subscriber: Codable
{
	let createdAt: Date
	let sim: Identifier?
	let contract: Identifier?
	let billingGroup: Identifier
	let name: String
	let description: String
	let id: Identifier
	let account: Identifier
}

public struct Usage: Codable
{
	let duration: Float
	let at: Date
	let cost: Float
	let fee: String
	let contract: Identifier
}

public struct UsageSummary: Codable
{
	let month: Float
	let year: Float
	let contract: Identifier
	let id: Identifier
	let calculatedAt: Date
	let remaining: Float
	let utilisation: Float
	let allocated: Float
}

public struct PoolSummary: Codable
{
	let month: Float
	let year: Float
	let id: Identifier
	let plan: Identifier
	let calculatedAt: Date
	let remaining: Float
	let utilisation: Float
	let allocated: Float
}

public struct Contract: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Identifier?
	let plan: Plan
	let hardware: Identifier
}

public struct GetContract: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date?
	let commitedTo: Date?
	let imsi: Identifier?
	let msisdn: Identifier?
	let localNumberAccess: Bool
	let localNumber: String?
	let plan: ContractPlan
	let hardware: Identifier
}

public struct Plan: Codable
{
	let inclusive: Float
	let pooled: Bool
	let suspensible: Bool
	let name: String
	let description: String
	let increment: Float
	let commitment: Float
	let id: Identifier
	let minimum: Float
}

public struct GetPlan: Codable
{
	let inclusive: Float
	let pooled: Bool
	let suspendible: Bool
	let name: String
	let description: String
	let increment: Float
	let commitment: Float
	let currency: String
	let id: Identifier
	let minimum: Float
}

public struct ContractPlan: Codable
{
	let feeMonthly: Float
	let inclusive: Float
	let pooled: Bool
	let suspendible: Bool
	let name: String
	let description: String
	let increment: Float
	let commitment: Float
	let id: Identifier
	let minimum: Float
}

public struct SBDContract: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let committedTo: Date
	let from: Date
	let id: Identifier
	let state: String
	let to: Date
	let plan: SBDPlan
}

public struct SBDGetContracts: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date?
	let committedTo: Date?
	let plan: Plan
}

public struct SBDPlan: Codable
{
	let feeMonthly: Float
	let inclusive: Float
	let suspendible: Bool
	let description: String
	let increment: Float
	let commitment: Float
	let pooled: Bool
	let terminationFee: Float
	let terminable: Bool
	let name: String
	let id: Identifier
}

public struct SBDSubscriber: Codable
{
	let createdAt: Date
	let lastSeen: Date?
	let contract: Identifier?
	let billingGroup: Identifier
	let name: String
	let description: String?
	let id: Identifier
	let customMonitorThreshold: String?
	let account: Identifier
	let hardware: Identifier
}

public struct SBDUsage: Codable
{
	let momsn: Float
	let at: Date
	let cost: Float
	let size: Float
	let fee: String
	let contract: Identifier
}

public struct SBDGetPlans: Codable
{
	let feeMonthly: Float
	let inclusive: Float
	let suspendible: Bool
	let description: String
	let increment: Float
	let commitment: Float
	let transitionFees: Bool
	let pooled: Bool
	let activationFee: Float
	let terminationFee: Float
	let terminable: Bool
	let name: String
	let currency: String
	let id: Identifier
	let minimum: Float
}

public struct Messages: Codable
{
	let id: Identifier
	let hardware: Identifier
	let payload: String
	let txAt: Date
	let rxAt: Date
	let cdrReference: Float
	let cepRadius: Float
	let latitude: Float
	let longitude: Float
	let momsn: Float
	let status: String
}

public struct Requests: Codable
{
	let requestAt: Date?
	let message: Identifier?
	let hardware: Identifier
	let status: String
}

public struct DataMTMessages: Codable
{
	let createdAt: Date
	let queueSize: Float
	let size: Float
	let payload: String
	let id: Identifier
	let submittedAt: Date
	let hardware: Identifier
	let status: String
}

public struct BillingGroups: Codable
{
	let `default`: Bool
	let name: String
	let id: Identifier
	let account: Identifier
}

public struct TelephonyCreateSubscriber: Codable
{
	let createdAt: Date
	let sim: Identifier
	let contract: Identifier?
	let billingGroup: Identifier
	let name: String
	let description: String
	let id: Identifier
	let account: Identifier
}

public struct TelephonyGetSubscriber: Codable
{
	let createdAt: Date
	let sim: SimResult
	let contract: Contract
	let name: String
	let description: String
	let id: Identifier
	let account: Identifier
	let hardware: HardwareResult
	let billingGroup: Identifier
}

public struct TelephonyActivateSubscriber: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date?
	let localNumberAccess: Bool
	let localNumber: String?
	let plan: Plan
	let hardware: Identifier
}

public struct TelephonyDeactivateSubscriber: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date?
	let plan: Plan
	let hardware: Identifier
}

public struct TelephonyResumeSubscriber: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date?
	let plan: Plan
	let hardware: Identifier
}

public struct TelephonySuspendSubscriber: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date
	let plan: Plan
	let hardware: Identifier
}

public struct TelephonyChangeSubscriber: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date?
	let plan: Plan
	let hardware: Identifier
}

public struct TelephonyUpdateSubscriber: Codable
{
	let createdAt: Date
	let contract: Identifier
	let billingGroup: Identifier
	let name: String
	let description: String
	let id: Identifier
	let accoundt: Identifier
	let hardware: Identifier
}

public struct TelephonyReassociateSubscriber: Codable
{
	let createdAt: Date
	let sim: SimResult
	let contract: Identifier?
	let billingGroup: Identifier
	let name: String
	let description: String
	let id: Identifier
	let account: Identifier
	let hardware: Identifier?
}

public struct SBDCreateSubscriber: Codable
{
	let createdAt: Date
	let contract: Identifier?
	let billingGroup: Identifier
	let name: String
	let description: String
	let id: Identifier
	let account: Identifier
	let hardware: Identifier
}

public struct SBDGetSubscriber: Codable
{
	let createdAt: Date
	let contract: SBDContract
	let destinations: [String]
	let billingGroup: Identifier
	let name: String
	let description: String
	let id: Identifier
	let account: Identifier
	let hardware: HardwareResult
}

public struct SBDActivateSubscriber: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date?
	let plan: Plan
}

public struct SBDDeactivateSubscriber: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date
	let plan: Plan
}

public struct SBDResumeSubscriber: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date?
	let plan: Plan
}

public struct SBDSuspendSubscriber: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date
	let plan: Plan
}

public struct SBDChangeSubscriber: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date?
	let plan: Plan
}

public struct SBDUpdateSubscriber: Codable
{
	let createdAt: Date
	let contract: Identifier
	let billingGroup: Identifier
	let name: String
	let description: String
	let id: Identifier
	let account: Identifier
	let hardware: Identifier
}

public struct SBDCreateDestination: Codable
{
	let moack: Bool
	let destination: String
	let id: Identifier
	let type: Identifier
	let geodata: Bool
}

public struct SBDReassociateSubscriber: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
	let to: Date?
	let plan: Plan
}

public struct DataMTGetMessage: Codable
{
	let id: Identifier
	let status: String
	let createdAt: Date
	let payload: String
	let submittedAt: Date
	let hardware: Identifier
	let queueSize: Float
}

public struct HardwareCreateHardware: Codable
{
	let imei: String
	let id: Identifier
	let type: String
}

public struct HardwareGetHardware: Codable
{
	let imei: String
	let id: Identifier
	let type: String
}

public struct hardwares: Codable
{
	let imei: String
	let id: Identifier
	let type: String
}

public struct CreateSim: Codable
{
	let iccid: String
	let id: Identifier
}

public struct GetSim: Codable
{
	let sim: String
	let id: Identifier
}

public struct SearchSims: Codable
{
	let iccid: String
	let id: Identifier
}

public struct CreateBillingGroup: Codable
{
	let `default`: Bool
	let name: String
	let id: Identifier
	let account: Identifier
}