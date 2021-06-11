// Types.swift

import Foundation

public struct SimResult: Codable
{
	let iccid: String
	let id: String
}

public struct HardwareResult: Codable
{
	let imei: String
	let id: String
	let type: String
	let account: String
}

public struct Subscriber: Codable
{
	let createdAt: Date
	let sim: String?
	let contract: String?
	let billingGroup: String
	let name: String
	let description: String
	let id: String
	let account: String
}

public struct Usage: Codable
{
	let duration: Float
	let at: Date
	let cost: Float
	let fee: String
	let contract: String
}

public struct UsageSummary: Codable
{
	let month: Float
	let year: Float
	let contract: String
	let id: String
	let calculatedAt: Date
	let remaining: Float
	let utilisation: Float
	let allocated: Float
}

public struct PoolSummary: Codable
{
	let month: Float
	let year: Float
	let id: String
	let plan: String
	let calculatedAt: Date
	let remaining: Float
	let utilisation: Float
	let allocated: Float
}

public struct Contract: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: String?
	let plan: Plan
	let hardware: String
}

public struct GetContract: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date?
	let commitedTo: Date?
	let imsi: String?
	let msisdn: String?
	let localNumberAccess: Bool
	let localNumber: String?
	let plan: ContractPlan
	let hardware: String
}

public struct Plan: Codable
{
	let feeMonthly: Float
	let inclusive: Float
	let suspensible: Bool
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
	let id: String
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
	let id: String
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
	let id: String
	let minimum: Float
}

public struct SBDContract: Codable
{
	let subscriber: String
	let networkStatus: String
	let committedTo: Date
	let from: Date
	let id: String
	let state: String
	let to: Date?
	let plan: SBDPlan
	let hardware: String
}

public struct SBDGetContracts: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date?
	let plan: Plan
	let hardware: String
}

public struct SBDPlan: Codable
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
	let id: String
	let minimum: Float
}

public struct SBDSubscriber: Codable
{
	let createdAt: Date
	let lastSeen: Date?
	let contract: String?
	let billingGroup: String
	let name: String
	let description: String?
	let id: String
	let customMonitorThreshold: String?
	let account: String
	let hardware: String
}

public struct SBDSearchSubscriber: Codable
{
	let createdAt: Date
	let lastSeen: Date
	let contract: String
	let billingGroup: String
	let name: String
	let description: String
	let id: String
	let account: String
	let hardware: String
}

public struct SBDUsage: Codable
{
	let momsn: Float
	let at: Date
	let cost: Float
	let size: Float
	let fee: String
	let contract: String
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
	let id: String
	let minimum: Float
}

public struct Messages: Codable
{
	let id: String
	let hardware: String
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
	let message: String?
	let hardware: String
	let status: String
}

public struct DataMTMessages: Codable
{
	let createdAt: Date
	let queueSize: Float
	let size: Float
	let payload: String
	let id: String
	let submittedAt: Date
	let hardware: String
	let status: String
}

public struct BillingGroups: Codable
{
	let `default`: Bool
	let name: String
	let id: String
	let account: String
}

public struct TelephonyCreateSubscriber: Codable
{
	let createdAt: Date
	let sim: String
	let contract: String?
	let billingGroup: String
	let name: String
	let description: String
	let id: String
	let account: String
}

public struct TelephonyGetSubscriber: Codable
{
	let createdAt: Date
	let sim: SimResult
	let contract: Contract
	let name: String
	let description: String
	let id: String
	let account: String
	let hardware: HardwareResult
	let billingGroup: String
}

public struct TelephonyActivateSubscriber: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date?
	let localNumberAccess: Bool
	let localNumber: String?
	let plan: Plan
	let hardware: String
}

public struct TelephonyDeactivateSubscriber: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date?
	let plan: Plan
	let hardware: String
}

public struct TelephonyResumeSubscriber: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date?
	let plan: Plan
	let hardware: String
}

public struct TelephonySuspendSubscriber: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date
	let plan: Plan
	let hardware: String
}

public struct TelephonyChangeSubscriber: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date?
	let plan: Plan
	let hardware: String
}

public struct TelephonyUpdateSubscriber: Codable
{
	let createdAt: Date
	let contract: String
	let billingGroup: String
	let name: String
	let description: String
	let id: String
	let accoundt: String
	let hardware: String
}

public struct TelephonyReassociateSubscriber: Codable
{
	let createdAt: Date
	let sim: SimResult
	let contract: String?
	let billingGroup: String
	let name: String
	let description: String
	let id: String
	let account: String
	let hardware: String?
}

public struct SBDCreateSubscriber: Codable
{
	let createdAt: Date
	let contract: String?
	let billingGroup: String
	let name: String
	let description: String
	let id: String
	let account: String
	let hardware: String
}

public struct SBDGetSubscriber: Codable
{
	let createdAt: Date
	let lastSeen: Date
	let contract: SBDContract
	let billingGroup: String
	let destinations: [SBDDestination]
	let name: String
	let description: String
	let id: String
	let customMonitorThreshold: Float?
	let account: String
	let hardware: HardwareResult
}

public struct SBDActivateSubscriber: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date?
	let plan: Plan
}

public struct SBDDeactivateSubscriber: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date
	let plan: Plan
}

public struct SBDResumeSubscriber: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date?
	let plan: Plan
}

public struct SBDSuspendSubscriber: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date
	let plan: Plan
}

public struct SBDChangeSubscriber: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date?
	let plan: Plan
}

public struct SBDUpdateSubscriber: Codable
{
	let createdAt: Date
	let contract: String
	let billingGroup: String
	let name: String
	let description: String
	let id: String
	let account: String
	let hardware: String
}

public struct SBDCreateDestination: Codable
{
	let route: String?
	let moack: Bool
	let destination: String
	let id: String
	let type: String
	let geodata: Bool
}

public struct SBDReassociateSubscriber: Codable
{
	let subscriber: String
	let networkStatus: String
	let from: Date
	let id: String
	let state: String
	let to: Date?
	let plan: Plan
}

public struct DataMTGetMessage: Codable
{
	let id: String
	let status: String
	let createdAt: Date
	let payload: String
	let submittedAt: Date
	let hardware: String
	let queueSize: Float
}

public struct HardwareCreateHardware: Codable
{
	let imei: String
	let id: String
	let type: String
}

public struct HardwareGetHardware: Codable
{
	let imei: String
	let id: String
	let type: String
}

public struct hardwares: Codable
{
	let imei: String
	let id: String
	let type: String
}

public struct CreateSim: Codable
{
	let iccid: String
	let id: String
}

public struct GetSim: Codable
{
	let sim: String
	let id: String
}

public struct SearchSims: Codable
{
	let iccid: String
	let id: String
}

public struct CreateBillingGroup: Codable
{
	let `default`: Bool
	let name: String
	let id: String
	let account: String
}

public struct SBDDestination: Codable
{
	let route: String?
	let moack: Bool
	let destination: String
	let id: String
	let type: String
	let geodata: Bool
}