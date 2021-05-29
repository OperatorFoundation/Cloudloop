// SBD.swift
// https://docs.cloudloop.com/reference#create-subscriber

import Foundation

public struct SBDSBDCreateSubscriberResult: Codable
{
	let subscriber: SBDCreateSubscriber
}

public struct SBDGetSubscriberResult: Codable
{
	let subscriber: SBDGetSubscriber
}

public struct SBDSearchSubscribersResult: Codable
{
	let subscribers: [SBDSubscriber]
}

public struct SBDGetUsageResult: Codable
{
	let usage: SBDUsage
}

public struct SBDGetUsageSummaryResult: Codable
{
	let summary: UsageSummary
}

public struct SBDGetPlansResult: Codable
{
	let plans: SBDGetPlans
}

public struct SBDGetContractsResult: Codable
{
	let contracts: [SBDGetContracts]
}

public struct SBDActivateSubscriberResult: Codable
{
	let contract: SBDActivateSubscriber
}

public struct SBDDeactivateSubscriberResult: Codable
{
	let contract: SBDDeactivateSubscriber
}

public struct SBDResumeSubscriberResult: Codable
{
	let contract: SBDResumeSubscriber
}

public struct SBDSuspendSubscriberResult: Codable
{
	let contract: SBDSuspendSubscriber
}

public struct SBDChangeSubscriberResult: Codable
{
	let contract: SBDChangeSubscriber
}

public struct SBDUpdateSubscriberResult: Codable
{
	let subscriber: SBDUpdateSubscriber
}

public struct SBDCreateDestinationResult: Codable
{
	let destination: SBDCreateDestination
}

public struct SBDDeleteDestinationResult: Codable
{
	let result: Bool
}

public struct SBDReassociateSubscriberResult: Codable
{
	let contract: SBDReassociateSubscriber
}

public struct SBDAssignBillingGroupResult: Codable
{
	let `default`: Bool
	let name: String
	let id: Identifier
	let account: Identifier
}

public struct SBD
{
    // https://docs.cloudloop.com/reference#create
    public func CreateSubscriber(token: String, hardware: Identifier, name: String) -> SBDSBDCreateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/CreateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "hardware", value: hardware.string),
			URLQueryItem(name: "name", value: name)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDSBDCreateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-subscriber
    public func GetSubscriber(token: String, subscriber: Identifier, imei: String) -> SBDGetSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/GetSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
			URLQueryItem(name: "imei", value: imei)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDGetSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#search-subscribers
    public func SearchSubscribers(token: String, query: String, status: String, hardware: Identifier) -> SBDSearchSubscribersResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/SearchSubscribers") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "query", value: query),
			URLQueryItem(name: "status", value: status),
			URLQueryItem(name: "hardware", value: hardware.string)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDSearchSubscribersResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-usage
    public func GetUsage(token: String, subscriber: Identifier, year: Int32, month: Int32) -> SBDGetUsageResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/GetUsage") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
			URLQueryItem(name: "year", value: String(year)),
			URLQueryItem(name: "month", value: String(month))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDGetUsageResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-usage-summary
    public func GetUsageSummary(token: String, subscriber: Identifier, year: Int32, month: Int32) -> SBDGetUsageSummaryResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/GetUsageSummary") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
			URLQueryItem(name: "year", value: String(year)),
			URLQueryItem(name: "month", value: String(month))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDGetUsageSummaryResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-plans
    public func GetPlans(token: String) -> SBDGetPlansResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/GetPlans") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),

        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDGetPlansResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-contracts
    public func GetContracts(token: String, subscriber: Identifier) -> SBDGetContractsResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/GetContracts") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDGetContractsResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#activate-subscriber
    public func ActivateSubscriber(token: String, subscriber: Identifier, plan: String) -> SBDActivateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/ActivateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
			URLQueryItem(name: "plan", value: plan)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDActivateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#deactivate-subscriber
    public func DeactivateSubscriber(token: String, subscriber: Identifier) -> SBDDeactivateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/DeactivateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDDeactivateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#resume-subscriber
    public func ResumeSubscriber(token: String, subscriber: Identifier) -> SBDResumeSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/ResumeSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDResumeSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#suspend-subscriber-1
    public func SuspendSubscriber(token: String, subscriber: Identifier) -> SBDSuspendSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/SuspendSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDSuspendSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#change-subscriber
    public func ChangeSubscriber(token: String, subscriber: Identifier, plan: String) -> SBDChangeSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/ChangeSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
			URLQueryItem(name: "plan", value: plan)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDChangeSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#update-subscriber
    public func UpdateSubscriber(token: String, subscriber: Identifier, name: String, description: String) -> SBDUpdateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/UpdateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
			URLQueryItem(name: "name", value: name),
			URLQueryItem(name: "description", value: description)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDUpdateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#create-destination
    public func CreateDestination(token: String, subscriber: Identifier, destination: String, type: String, moack: Bool, geodata: Bool) -> SBDCreateDestinationResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/CreateDestination") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
			URLQueryItem(name: "destination", value: destination),
			URLQueryItem(name: "type", value: type),
			URLQueryItem(name: "moack", value: String(moack)),
			URLQueryItem(name: "geodata", value: String(geodata))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDCreateDestinationResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#delete-destination
    public func DeleteDestination(token: String, destination: String) -> SBDDeleteDestinationResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/DeleteDestination") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "destination", value: destination)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDDeleteDestinationResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#swap-subscriber
    public func ReassociateSubscriber(token: String, subscriber: Identifier, hardware: Identifier) -> SBDReassociateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/ReassociateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
			URLQueryItem(name: "hardware", value: hardware.string)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDReassociateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#assign-billing-group
    public func AssignBillingGroup(token: String, subscriber: Identifier, billingGroup: Identifier) -> SBDAssignBillingGroupResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/SBD/AssignBillingGroup") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string),
			URLQueryItem(name: "billingGroup", value: billingGroup.string)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SBDAssignBillingGroupResult.self, from: resultData) else {return nil}

        return result
    }
}