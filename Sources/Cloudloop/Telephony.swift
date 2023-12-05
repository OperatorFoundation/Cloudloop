// Telephony.swift
// https://docs.cloudloop.com/reference#create

import Foundation

public struct TelephonyTelephonyCreateSubscriberResult: Codable
{
	public let subscriber: TelephonyCreateSubscriber

    public init(token: String, subscriber: TelephonyCreateSubscriber)
    {
		self.subscriber = subscriber
    }
}

public struct TelephonyGetSubscriberResult: Codable
{
	public let subscriber: TelephonyGetSubscriber

    public init(token: String, subscriber: TelephonyGetSubscriber)
    {
		self.subscriber = subscriber
    }
}

public struct TelephonySearchSubscribersResult: Codable
{
	public let subscribers: [Subscriber]

    public init(token: String, subscribers: [Subscriber])
    {
		self.subscribers = subscribers
    }
}

public struct TelephonyGetUsageResult: Codable
{
	public let usage: [Usage]

    public init(token: String, usage: [Usage])
    {
		self.usage = usage
    }
}

public struct TelephonyGetUsageSummaryResult: Codable
{
	public let summary: [UsageSummary]

    public init(token: String, summary: [UsageSummary])
    {
		self.summary = summary
    }
}

public struct TelephonyGetPoolSummaryResult: Codable
{
	public let summary: [PoolSummary]

    public init(token: String, summary: [PoolSummary])
    {
		self.summary = summary
    }
}

public struct TelephonyGetPlansResult: Codable
{
	public let plan: [GetPlan]

    public init(token: String, plan: [GetPlan])
    {
		self.plan = plan
    }
}

public struct TelephonyGetContractsResult: Codable
{
	public let contracts: [GetContract]

    public init(token: String, contracts: [GetContract])
    {
		self.contracts = contracts
    }
}

public struct TelephonyActivateSubscriberResult: Codable
{
	public let contract: TelephonyActivateSubscriber

    public init(token: String, contract: TelephonyActivateSubscriber)
    {
		self.contract = contract
    }
}

public struct TelephonyDeactivateSubscriberResult: Codable
{
	public let contract: TelephonyDeactivateSubscriber

    public init(token: String, contract: TelephonyDeactivateSubscriber)
    {
		self.contract = contract
    }
}

public struct TelephonyResumeSubscriberResult: Codable
{
	public let contract: TelephonyResumeSubscriber

    public init(token: String, contract: TelephonyResumeSubscriber)
    {
		self.contract = contract
    }
}

public struct TelephonySuspendSubscriberResult: Codable
{
	public let contract: TelephonySuspendSubscriber

    public init(token: String, contract: TelephonySuspendSubscriber)
    {
		self.contract = contract
    }
}

public struct TelephonyChangeSubscriberResult: Codable
{
	public let contract: TelephonyChangeSubscriber

    public init(token: String, contract: TelephonyChangeSubscriber)
    {
		self.contract = contract
    }
}

public struct TelephonyUpdateSubscriberResult: Codable
{
	public let subscriber: TelephonyUpdateSubscriber

    public init(token: String, subscriber: TelephonyUpdateSubscriber)
    {
		self.subscriber = subscriber
    }
}

public struct TelephonyReassociateSubscriberResult: Codable
{
	public let subscriber: TelephonyReassociateSubscriber

    public init(token: String, subscriber: TelephonyReassociateSubscriber)
    {
		self.subscriber = subscriber
    }
}

public struct TelephonyAssignBillingGroupResult: Codable
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

public struct Telephony
{
   public init() {}

    // https://docs.cloudloop.com/reference#create
    public func CreateSubscriber(token: String, sim: String, name: String? = nil) -> TelephonyTelephonyCreateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/CreateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "sim", value: sim),
			URLQueryItem(name: "name", value: name ?? "")
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyTelephonyCreateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#retrieve
    public func GetSubscriber(token: String, subscriber: String) -> TelephonyGetSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/GetSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyGetSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#search
    public func SearchSubscribers(token: String) -> TelephonySearchSubscribersResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/GetSubscribers") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),

        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonySearchSubscribersResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#usage-1
    public func GetUsage(token: String, subscriber: String, year: Int32, month: Int32) -> TelephonyGetUsageResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/GetUsage") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber),
			URLQueryItem(name: "year", value: String(year)),
			URLQueryItem(name: "month", value: String(month))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyGetUsageResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#subscriber-summary2
    public func GetUsageSummary(token: String, subscriber: String, year: Int32, month: Int32) -> TelephonyGetUsageSummaryResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/GetUsageSummary") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber),
			URLQueryItem(name: "year", value: String(year)),
			URLQueryItem(name: "month", value: String(month))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyGetUsageSummaryResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-pool-usage-summary2
    public func GetPoolSummary(token: String, year: Int32, month: Int32) -> TelephonyGetPoolSummaryResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/GetPoolSummary") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "year", value: String(year)),
			URLQueryItem(name: "month", value: String(month))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyGetPoolSummaryResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#retrieve-plans-1
    public func GetPlans(token: String) -> TelephonyGetPlansResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/GetPlans") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),

        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyGetPlansResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#retrieve-contracts
    public func GetContracts(token: String, subscriber: String) -> TelephonyGetContractsResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/GetContracts") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyGetContractsResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#activate-1
    public func ActivateSubscriber(token: String, subscriber: String, hardware: String, plan: String, localNumberAccess: Bool) -> TelephonyActivateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/DoActivateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber),
			URLQueryItem(name: "hardware", value: hardware),
			URLQueryItem(name: "plan", value: plan),
			URLQueryItem(name: "localNumberAccess", value: String(localNumberAccess))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyActivateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#deactivate-1
    public func DeactivateSubscriber(token: String, subscriber: String) -> TelephonyDeactivateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/DoDeactivateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyDeactivateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#refresh-2
    public func ResumeSubscriber(token: String, subscriber: String) -> TelephonyResumeSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/DoResumeSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyResumeSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#suspend-subscriber
    public func SuspendSubscriber(token: String, subscriber: String) -> TelephonySuspendSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/DoSuspendSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonySuspendSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#change-contract
    public func ChangeSubscriber(token: String, subscriber: String, plan: String) -> TelephonyChangeSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/DoChangeSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber),
			URLQueryItem(name: "plan", value: plan)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyChangeSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#update-subscriber-tel
    public func UpdateSubscriber(token: String, subscriber: String, name: String, description: String) -> TelephonyUpdateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/UpdateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber),
			URLQueryItem(name: "name", value: name),
			URLQueryItem(name: "description", value: description)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyUpdateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#reassociate-subscriber
    public func ReassociateSubscriber(token: String, subscriber: String, sim: String, hardware: String) -> TelephonyReassociateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/DoReassociateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber),
			URLQueryItem(name: "sim", value: sim),
			URLQueryItem(name: "hardware", value: hardware)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyReassociateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#assign-billing-group-1
    public func AssignBillingGroup(token: String, subscriber: String, billingGroup: String) -> TelephonyAssignBillingGroupResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/DoAssignBillingGroup") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber),
			URLQueryItem(name: "billingGroup", value: billingGroup)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TelephonyAssignBillingGroupResult.self, from: resultData) else {return nil}

        return result
    }
}
