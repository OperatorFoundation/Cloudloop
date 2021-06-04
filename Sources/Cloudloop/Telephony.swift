// Telephony.swift
// https://docs.cloudloop.com/reference#create

import Foundation

public struct TelephonyTelephonyCreateSubscriberResult: Codable
{
	let subscriber: TelephonyCreateSubscriber
}

public struct TelephonyGetSubscriberResult: Codable
{
	let subscriber: TelephonyGetSubscriber
}

public struct TelephonySearchSubscribersResult: Codable
{
	let subscribers: [Subscriber]
}

public struct TelephonyGetUsageResult: Codable
{
	let usage: [Usage]
}

public struct TelephonyGetUsageSummaryResult: Codable
{
	let summary: [UsageSummary]
}

public struct TelephonyGetPoolSummaryResult: Codable
{
	let summary: [PoolSummary]
}

public struct TelephonyGetPlansResult: Codable
{
	let plan: [GetPlan]
}

public struct TelephonyGetContractsResult: Codable
{
	let contracts: [GetContract]
}

public struct TelephonyActivateSubscriberResult: Codable
{
	let contract: TelephonyActivateSubscriber
}

public struct TelephonyDeactivateSubscriberResult: Codable
{
	let contract: TelephonyDeactivateSubscriber
}

public struct TelephonyResumeSubscriberResult: Codable
{
	let contract: TelephonyResumeSubscriber
}

public struct TelephonySuspendSubscriberResult: Codable
{
	let contract: TelephonySuspendSubscriber
}

public struct TelephonyChangeSubscriberResult: Codable
{
	let contract: TelephonyChangeSubscriber
}

public struct TelephonyUpdateSubscriberResult: Codable
{
	let subscriber: TelephonyUpdateSubscriber
}

public struct TelephonyReassociateSubscriberResult: Codable
{
	let subscriber: TelephonyReassociateSubscriber
}

public struct TelephonyAssignBillingGroupResult: Codable
{
	let `default`: Bool
	let name: String
	let id: Identifier
	let account: Identifier
}

public struct Telephony
{
    // https://docs.cloudloop.com/reference#create
    public func CreateSubscriber(token: String, sim: Identifier, name: String) -> TelephonyTelephonyCreateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/CreateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "sim", value: sim.string),
			URLQueryItem(name: "name", value: name)
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
    public func GetSubscriber(token: String, subscriber: Identifier) -> TelephonyGetSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/GetSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string)
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
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/SearchSubscribers") else {return nil}
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
    public func GetUsage(token: String, subscriber: Identifier, year: Int32, month: Int32) -> TelephonyGetUsageResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/GetUsage") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
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
    public func GetUsageSummary(token: String, subscriber: Identifier, year: Int32, month: Int32) -> TelephonyGetUsageSummaryResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/GetUsageSummary") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
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
    public func GetContracts(token: String, subscriber: Identifier) -> TelephonyGetContractsResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/GetContracts") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string)
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
    public func ActivateSubscriber(token: String, subscriber: Identifier, hardware: Identifier, plan: String, localNumberAccess: Bool) -> TelephonyActivateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/ActivateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
			URLQueryItem(name: "hardware", value: hardware.string),
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
    public func DeactivateSubscriber(token: String, subscriber: Identifier) -> TelephonyDeactivateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/DeactivateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string)
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
    public func ResumeSubscriber(token: String, subscriber: Identifier) -> TelephonyResumeSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/ResumeSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string)
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
    public func SuspendSubscriber(token: String, subscriber: Identifier) -> TelephonySuspendSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/SuspendSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string)
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
    public func ChangeSubscriber(token: String, subscriber: Identifier, plan: String) -> TelephonyChangeSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/ChangeSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
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
    public func UpdateSubscriber(token: String, subscriber: Identifier, name: String, description: String) -> TelephonyUpdateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/UpdateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
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
    public func ReassociateSubscriber(token: String, subscriber: Identifier, sim: Identifier, hardware: Identifier) -> TelephonyReassociateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/ReassociateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
			URLQueryItem(name: "sim", value: sim.string),
			URLQueryItem(name: "hardware", value: hardware.string)
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
    public func AssignBillingGroup(token: String, subscriber: Identifier, billingGroup: Identifier) -> TelephonyAssignBillingGroupResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/AssignBillingGroup") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
			URLQueryItem(name: "billingGroup", value: billingGroup.string)
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