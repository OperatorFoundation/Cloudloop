// Types.swift

import Foundation

public struct SimResult: Codable
{
	let id: Identifier
	let iccid: String
}

public struct HardwareResult: Codable
{
	let type: String
	let imei: String
	let id: Identifier
}

public struct Subscriber: Codable
{
	let sim: Identifier?
	let createdAt: Date
	let contract: Identifier?
	let id: Identifier
	let description: String
	let billingGroup: Identifier
	let account: Identifier
	let name: String
}

public struct Usage: Codable
{
	let cost: Float
	let duration: Float
	let fee: String
	let at: Date
	let contract: Identifier
}

public struct UsageSummary: Codable
{
	let remaining: Float
	let year: Float
	let allocated: Float
	let id: Identifier
	let contract: Identifier
	let month: Float
	let calculatedAt: Date
	let utilisation: Float
}

public struct PoolSummary: Codable
{
	let plan: Identifier
	let utilisation: Float
	let year: Float
	let calculatedAt: Date
	let month: Float
	let allocated: Float
	let id: Identifier
	let remaining: Float
}

public struct Contract: Codable
{
	let subscriber: Identifier
	let from: Date
	let id: Identifier
	let state: String
	let networkStatus: String
	let to: Identifier?
	let plan: Plan
	let hardware: Identifier
}

public struct GetContract: Codable
{
	let networkStatus: String
	let to: Date?
	let hardware: Identifier
	let id: Identifier
	let commitedTo: Date?
	let localNumberAccess: Bool
	let localNumber: String?
	let subscriber: Identifier
	let from: Date
	let imsi: Identifier?
	let state: String
	let plan: ContractPlan
	let msisdn: Identifier?
}

public struct Plan: Codable
{
	let id: Identifier
	let pooled: Bool
	let suspensible: Bool
	let name: String
	let minimum: Float
	let inclusive: Float
	let description: String
	let increment: Float
	let commitment: Float
}

public struct GetPlan: Codable
{
	let name: String
	let commitment: Float
	let id: Identifier
	let description: String
	let increment: Float
	let pooled: Bool
	let currency: String
	let suspendible: Bool
	let inclusive: Float
	let minimum: Float
}

public struct ContractPlan: Codable
{
	let increment: Float
	let commitment: Float
	let inclusive: Float
	let pooled: Bool
	let id: Identifier
	let name: String
	let minimum: Float
	let description: String
	let feeMonthly: Float
	let suspendible: Bool
}

public struct SBDContract: Codable
{
	let id: Identifier
	let to: Date
	let committedTo: Date
	let from: Date
	let state: String
	let networkStatus: String
	let plan: SBDPlan
	let subscriber: Identifier
}

public struct SBDGetContracts: Codable
{
	let plan: Plan
	let to: Date?
	let subscriber: Identifier
	let state: String
	let committedTo: Date?
	let networkStatus: String
	let id: Identifier
	let from: Date
}

public struct SBDPlan: Codable
{
	let commitment: Float
	let terminationFee: Float
	let name: String
	let id: Identifier
	let description: String
	let pooled: Bool
	let feeMonthly: Float
	let terminable: Bool
	let increment: Float
	let inclusive: Float
	let suspendible: Bool
}

public struct SBDSubscriber: Codable
{
	let createdAt: Date
	let billingGroup: Identifier
	let customMonitorThreshold: String?
	let lastSeen: Date?
	let description: String?
	let contract: Identifier?
	let hardware: Identifier
	let name: String
	let id: Identifier
	let account: Identifier
}

public struct SBDUsage: Codable
{
	let size: Float
	let at: Date
	let fee: String
	let momsn: Float
	let contract: Identifier
	let cost: Float
}

public struct SBDGetPlans: Codable
{
	let inclusive: Float
	let feeMonthly: Float
	let suspendible: Bool
	let pooled: Bool
	let commitment: Float
	let currency: String
	let increment: Float
	let id: Identifier
	let minimum: Float
	let description: String
	let name: String
}

public struct Messages: Codable
{
	let id: Identifier
	let momsn: Float
	let longitude: Float
	let txAt: Date
	let cepRadius: Float
	let rxAt: Date
	let hardware: Identifier
	let cdrReference: Float
	let status: String
	let payload: String
	let latitude: Float
}

public struct Requests: Codable
{
	let message: Identifier?
	let status: String
	let requestAt: Date?
	let hardware: Identifier
}

public struct DataMTMessages: Codable
{
	let size: Float
	let id: Identifier
	let submittedAt: Date
	let hardware: Identifier
	let status: String
	let payload: String
	let createdAt: Date
	let queueSize: Float
}

public struct BillingGroups: Codable
{
	let `default`: Bool
	let account: Identifier
	let id: Identifier
	let name: String
}

public struct TelephonyCreateSubscriber: Codable
{
	let description: String
	let sim: Identifier
	let contract: Identifier?
	let createdAt: Date
	let account: Identifier
	let id: Identifier
	let billingGroup: Identifier
	let name: String
}

public struct TelephonyGetSubscriber: Codable
{
	let hardware: HardwareResult
	let billingGroup: Identifier
	let createdAt: Date
	let name: String
	let description: String
	let account: Identifier
	let sim: SimResult
	let id: Identifier
	let contract: Contract
}

public struct TelephonyActivateSubscriber: Codable
{
	let localNumber: String?
	let to: Date?
	let subscriber: Identifier
	let networkStatus: String
	let id: Identifier
	let state: String
	let localNumberAccess: Bool
	let hardware: Identifier
	let plan: Plan
	let from: Date
}

public struct TelephonyDeactivateSubscriber: Codable
{
	let id: Identifier
	let state: String
	let subscriber: Identifier
	let from: Date
	let plan: Plan
	let networkStatus: String
	let to: Date?
	let hardware: Identifier
}

public struct TelephonyResumeSubscriber: Codable
{
	let networkStatus: String
	let state: String
	let from: Date
	let subscriber: Identifier
	let hardware: Identifier
	let id: Identifier
	let to: Date?
	let plan: Plan
}

public struct TelephonySuspendSubscriber: Codable
{
	let from: Date
	let to: Date
	let subscriber: Identifier
	let plan: Plan
	let hardware: Identifier
	let state: String
	let id: Identifier
	let networkStatus: String
}

public struct TelephonyChangeSubscriber: Codable
{
	let to: Date?
	let id: Identifier
	let networkStatus: String
	let plan: Plan
	let hardware: Identifier
	let from: Date
	let subscriber: Identifier
	let state: String
}

public struct TelephonyUpdateSubscriber: Codable
{
	let name: String
	let hardware: Identifier
	let contract: Identifier
	let createdAt: Date
	let description: String
	let billingGroup: Identifier
	let id: Identifier
	let accoundt: Identifier
}

public struct TelephonyReassociateSubscriber: Codable
{
	let contract: Identifier?
	let hardware: Identifier?
	let billingGroup: Identifier
	let sim: SimResult
	let description: String
	let name: String
	let account: Identifier
	let id: Identifier
	let createdAt: Date
}

public struct SBDCreateSubscriber: Codable
{
	let account: Identifier
	let billingGroup: Identifier
	let contract: Identifier?
	let id: Identifier
	let hardware: Identifier
	let createdAt: Date
	let name: String
	let description: String
}

public struct SBDGetSubscriber: Codable
{
	let createdAt: Date
	let name: String
	let id: Identifier
	let account: Identifier
	let destinations: [String]
	let contract: SBDContract
	let billingGroup: Identifier
	let hardware: HardwareResult
	let description: String
}

public struct SBDActivateSubscriber: Codable
{
	let id: Identifier
	let state: String
	let networkStatus: String
	let from: Date
	let to: Date?
	let subscriber: Identifier
	let plan: Plan
}

public struct SBDDeactivateSubscriber: Codable
{
	let networkStatus: String
	let id: Identifier
	let from: Date
	let state: String
	let subscriber: Identifier
	let plan: Plan
	let to: Date
}

public struct SBDResumeSubscriber: Codable
{
	let networkStatus: String
	let state: String
	let id: Identifier
	let from: Date
	let to: Date?
	let subscriber: Identifier
	let plan: Plan
}

public struct SBDSuspendSubscriber: Codable
{
	let plan: Plan
	let networkStatus: String
	let id: Identifier
	let state: String
	let subscriber: Identifier
	let to: Date
	let from: Date
}

public struct SBDChangeSubscriber: Codable
{
	let state: String
	let subscriber: Identifier
	let id: Identifier
	let to: Date?
	let from: Date
	let networkStatus: String
	let plan: Plan
}

public struct SBDUpdateSubscriber: Codable
{
	let billingGroup: Identifier
	let name: String
	let id: Identifier
	let contract: Identifier
	let account: Identifier
	let description: String
	let hardware: Identifier
	let createdAt: Date
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
	let networkStatus: String
	let from: Date
	let id: Identifier
	let to: Date?
	let state: String
	let plan: Plan
	let subscriber: Identifier
}

public struct DataMTGetMessage: Codable
{
	let status: String
	let queueSize: Float
	let hardware: Identifier
	let createdAt: Date
	let payload: String
	let id: Identifier
	let submittedAt: Date
}

public struct HardwareCreateHardware: Codable
{
	let id: Identifier
	let imei: String
	let type: String
}

public struct HardwareGetHardware: Codable
{
	let id: Identifier
	let type: String
	let imei: String
}

public struct hardwares: Codable
{
	let type: String
	let imei: String
	let id: Identifier
}

public struct CreateSim: Codable
{
	let id: Identifier
	let iccid: String
}

public struct GetSim: Codable
{
	let id: Identifier
	let sim: String
}

public struct SearchSims: Codable
{
	let iccid: String
	let id: Identifier
}

public struct CreateBillingGroup: Codable
{
	let name: String
	let `default`: Bool
	let id: Identifier
	let account: Identifier
}