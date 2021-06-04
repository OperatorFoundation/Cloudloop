// Types.swift

import Foundation

public struct SimResult: Codable
{
	let id: Identifier
	let iccid: String
}

public struct HardwareResult: Codable
{
	let imei: String
	let id: Identifier
	let type: String
}

public struct Subscriber: Codable
{
	let billingGroup: Identifier
	let contract: Identifier?
	let sim: Identifier?
	let description: String
	let account: Identifier
	let id: Identifier
	let name: String
	let createdAt: Date
}

public struct Usage: Codable
{
	let at: Date
	let duration: Float
	let cost: Float
	let fee: String
	let contract: Identifier
}

public struct UsageSummary: Codable
{
	let utilisation: Float
	let allocated: Float
	let id: Identifier
	let calculatedAt: Date
	let month: Float
	let contract: Identifier
	let year: Float
	let remaining: Float
}

public struct PoolSummary: Codable
{
	let year: Float
	let plan: Identifier
	let id: Identifier
	let calculatedAt: Date
	let utilisation: Float
	let allocated: Float
	let remaining: Float
	let month: Float
}

public struct Contract: Codable
{
	let to: Identifier?
	let from: Date
	let networkStatus: String
	let hardware: Identifier
	let id: Identifier
	let plan: Plan
	let subscriber: Identifier
	let state: String
}

public struct GetContract: Codable
{
	let subscriber: Identifier
	let localNumberAccess: Bool
	let imsi: Identifier?
	let networkStatus: String
	let localNumber: String?
	let to: Date?
	let commitedTo: Date?
	let msisdn: Identifier?
	let id: Identifier
	let from: Date
	let state: String
	let hardware: Identifier
	let plan: ContractPlan
}

public struct Plan: Codable
{
	let suspensible: Bool
	let commitment: Float
	let minimum: Float
	let pooled: Bool
	let description: String
	let id: Identifier
	let name: String
	let increment: Float
	let inclusive: Float
}

public struct GetPlan: Codable
{
	let inclusive: Float
	let description: String
	let pooled: Bool
	let name: String
	let suspendible: Bool
	let increment: Float
	let minimum: Float
	let commitment: Float
	let currency: String
	let id: Identifier
}

public struct ContractPlan: Codable
{
	let description: String
	let minimum: Float
	let feeMonthly: Float
	let inclusive: Float
	let increment: Float
	let commitment: Float
	let name: String
	let id: Identifier
	let pooled: Bool
	let suspendible: Bool
}

public struct SBDContract: Codable
{
	let from: Date
	let id: Identifier
	let to: Date
	let state: String
	let plan: SBDPlan
	let subscriber: Identifier
	let committedTo: Date
	let networkStatus: String
}

public struct SBDGetContracts: Codable
{
	let networkStatus: String
	let id: Identifier
	let state: String
	let subscriber: Identifier
	let from: Date
	let committedTo: Date?
	let to: Date?
	let plan: Plan
}

public struct SBDPlan: Codable
{
	let commitment: Float
	let feeMonthly: Float
	let id: Identifier
	let suspendible: Bool
	let inclusive: Float
	let terminable: Bool
	let pooled: Bool
	let increment: Float
	let description: String
	let terminationFee: Float
	let name: String
}

public struct SBDSubscriber: Codable
{
	let billingGroup: Identifier
	let createdAt: Date
	let name: String
	let hardware: Identifier
	let account: Identifier
	let contract: Identifier?
	let lastSeen: Date?
	let description: String?
	let customMonitorThreshold: String?
	let id: Identifier
}

public struct SBDUsage: Codable
{
	let cost: Float
	let at: Date
	let momsn: Float
	let size: Float
	let fee: String
	let contract: Identifier
}

public struct SBDGetPlans: Codable
{
	let suspendible: Bool
	let currency: String
	let transactionFees: Bool
	let increment: Float
	let activationFee: Float
	let terminable: Bool
	let description: String
	let terminationFee: Float
	let name: String
	let id: Identifier
	let minimum: Float
	let feeMonthly: Float
	let pooled: Bool
	let inclusive: Float
	let commitment: Float
}

public struct Messages: Codable
{
	let cdrReference: Float
	let longitude: Float
	let payload: String
	let hardware: Identifier
	let rxAt: Date
	let id: Identifier
	let cepRadius: Float
	let status: String
	let momsn: Float
	let txAt: Date
	let latitude: Float
}

public struct Requests: Codable
{
	let hardware: Identifier
	let status: String
	let message: Identifier?
	let requestAt: Date?
}

public struct DataMTMessages: Codable
{
	let size: Float
	let payload: String
	let submittedAt: Date
	let hardware: Identifier
	let status: String
	let queueSize: Float
	let id: Identifier
	let createdAt: Date
}

public struct BillingGroups: Codable
{
	let name: String
	let id: Identifier
	let account: Identifier
	let `default`: Bool
}

public struct TelephonyCreateSubscriber: Codable
{
	let sim: Identifier
	let createdAt: Date
	let id: Identifier
	let contract: Identifier?
	let billingGroup: Identifier
	let account: Identifier
	let name: String
	let description: String
}

public struct TelephonyGetSubscriber: Codable
{
	let createdAt: Date
	let id: Identifier
	let name: String
	let description: String
	let sim: SimResult
	let account: Identifier
	let hardware: HardwareResult
	let billingGroup: Identifier
	let contract: Contract
}

public struct TelephonyActivateSubscriber: Codable
{
	let networkStatus: String
	let subscriber: Identifier
	let id: Identifier
	let from: Date
	let to: Date?
	let localNumberAccess: Bool
	let localNumber: String?
	let plan: Plan
	let hardware: Identifier
	let state: String
}

public struct TelephonyDeactivateSubscriber: Codable
{
	let subscriber: Identifier
	let id: Identifier
	let state: String
	let to: Date?
	let from: Date
	let networkStatus: String
	let plan: Plan
	let hardware: Identifier
}

public struct TelephonyResumeSubscriber: Codable
{
	let id: Identifier
	let from: Date
	let plan: Plan
	let hardware: Identifier
	let to: Date?
	let networkStatus: String
	let state: String
	let subscriber: Identifier
}

public struct TelephonySuspendSubscriber: Codable
{
	let state: String
	let subscriber: Identifier
	let hardware: Identifier
	let from: Date
	let plan: Plan
	let to: Date
	let networkStatus: String
	let id: Identifier
}

public struct TelephonyChangeSubscriber: Codable
{
	let state: String
	let subscriber: Identifier
	let plan: Plan
	let networkStatus: String
	let to: Date?
	let hardware: Identifier
	let from: Date
	let id: Identifier
}

public struct TelephonyUpdateSubscriber: Codable
{
	let description: String
	let id: Identifier
	let hardware: Identifier
	let name: String
	let contract: Identifier
	let accoundt: Identifier
	let billingGroup: Identifier
	let createdAt: Date
}

public struct TelephonyReassociateSubscriber: Codable
{
	let id: Identifier
	let hardware: Identifier?
	let account: Identifier
	let name: String
	let description: String
	let createdAt: Date
	let billingGroup: Identifier
	let sim: SimResult
	let contract: Identifier?
}

public struct SBDCreateSubscriber: Codable
{
	let billingGroup: Identifier
	let description: String
	let account: Identifier
	let contract: Identifier?
	let id: Identifier
	let hardware: Identifier
	let name: String
	let createdAt: Date
}

public struct SBDGetSubscriber: Codable
{
	let account: Identifier
	let id: Identifier
	let contract: SBDContract
	let billingGroup: Identifier
	let name: String
	let description: String
	let hardware: HardwareResult
	let destinations: [String]
	let createdAt: Date
}

public struct SBDActivateSubscriber: Codable
{
	let subscriber: Identifier
	let from: Date
	let state: String
	let id: Identifier
	let plan: Plan
	let networkStatus: String
	let to: Date?
}

public struct SBDDeactivateSubscriber: Codable
{
	let state: String
	let plan: Plan
	let id: Identifier
	let subscriber: Identifier
	let to: Date
	let networkStatus: String
	let from: Date
}

public struct SBDResumeSubscriber: Codable
{
	let subscriber: Identifier
	let networkStatus: String
	let to: Date?
	let plan: Plan
	let from: Date
	let id: Identifier
	let state: String
}

public struct SBDSuspendSubscriber: Codable
{
	let subscriber: Identifier
	let to: Date
	let plan: Plan
	let networkStatus: String
	let from: Date
	let id: Identifier
	let state: String
}

public struct SBDChangeSubscriber: Codable
{
	let to: Date?
	let plan: Plan
	let id: Identifier
	let networkStatus: String
	let state: String
	let subscriber: Identifier
	let from: Date
}

public struct SBDUpdateSubscriber: Codable
{
	let description: String
	let id: Identifier
	let account: Identifier
	let hardware: Identifier
	let contract: Identifier
	let createdAt: Date
	let name: String
	let billingGroup: Identifier
}

public struct SBDCreateDestination: Codable
{
	let moack: Bool
	let destination: String
	let id: Identifier
	let geodata: Bool
	let type: Identifier
}

public struct SBDReassociateSubscriber: Codable
{
	let from: Date
	let subscriber: Identifier
	let networkStatus: String
	let state: String
	let plan: Plan
	let id: Identifier
	let to: Date?
}

public struct DataMTGetMessage: Codable
{
	let submittedAt: Date
	let status: String
	let hardware: Identifier
	let queueSize: Float
	let createdAt: Date
	let id: Identifier
	let payload: String
}

public struct HardwareCreateHardware: Codable
{
	let imei: String
	let type: String
	let id: Identifier
}

public struct HardwareGetHardware: Codable
{
	let id: Identifier
	let type: String
	let imei: String
}

public struct hardwares: Codable
{
	let imei: String
	let type: String
	let id: Identifier
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
	let id: Identifier
	let `default`: Bool
	let name: String
	let account: Identifier
}