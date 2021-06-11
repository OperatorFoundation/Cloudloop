// Sbd.swift
// https://docs.cloudloop.com/reference#create-subscriber

import Foundation

public struct SbdSBDCreateSubscriberResult: Codable
{
	let subscriber: SBDCreateSubscriber
}

public struct SbdGetSubscriberResult: Codable
{
	let subscriber: SBDGetSubscriber
}

public struct SbdSearchSubscribersResult: Codable
{
	let subscribers: [SBDSearchSubscriber]
}

public struct SbdGetUsageResult: Codable
{
	let usage: SBDUsage
}

public struct SbdGetUsageSummaryResult: Codable
{
	let summary: UsageSummary
}

public struct SbdGetPlansResult: Codable
{
	let plans: [SBDGetPlans]
}

public struct SbdGetContractsResult: Codable
{
	let contracts: [SBDGetContracts]
}

public struct SbdActivateSubscriberResult: Codable
{
	let contract: SBDActivateSubscriber
}

public struct SbdDeactivateSubscriberResult: Codable
{
	let contract: SBDDeactivateSubscriber
}

public struct SbdResumeSubscriberResult: Codable
{
	let contract: SBDResumeSubscriber
}

public struct SbdSuspendSubscriberResult: Codable
{
	let contract: SBDSuspendSubscriber
}

public struct SbdChangeSubscriberResult: Codable
{
	let contract: SBDChangeSubscriber
}

public struct SbdUpdateSubscriberResult: Codable
{
	let subscriber: SBDUpdateSubscriber
}

public struct SbdCreateDestinationResult: Codable
{
	let destination: SBDCreateDestination
}

public struct SbdDeleteDestinationResult: Codable
{
	let at: Float
	let error: String
}

public struct SbdReassociateSubscriberResult: Codable
{
	let contract: SBDReassociateSubscriber
}

public struct SbdAssignBillingGroupResult: Codable
{
	let `default`: Bool
	let name: String
	let id: String
	let account: String
}

public struct Sbd
{
    // https://docs.cloudloop.com/reference#create
    public func CreateSubscriber(token: String, hardware: String, name: String) -> SbdSBDCreateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/CreateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "hardware", value: hardware),
			URLQueryItem(name: "name", value: name)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdSBDCreateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-subscriber
    public func GetSubscriber(token: String, subscriber: String, imei: String) -> SbdGetSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/GetSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber),
			URLQueryItem(name: "imei", value: imei)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdGetSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#search-subscribers
    public func SearchSubscribers(token: String, query: String, status: String, hardware: String) -> SbdSearchSubscribersResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/SearchSubscribers") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "query", value: query),
			URLQueryItem(name: "status", value: status),
			URLQueryItem(name: "hardware", value: hardware)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdSearchSubscribersResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-usage
    public func GetUsage(token: String, subscriber: String, year: Int32, month: Int32) -> SbdGetUsageResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/GetUsage") else {return nil}
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
        guard let result = try? decoder.decode(SbdGetUsageResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-usage-summary
    public func GetUsageSummary(token: String, subscriber: String, year: Int32, month: Int32) -> SbdGetUsageSummaryResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/GetUsageSummary") else {return nil}
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
        guard let result = try? decoder.decode(SbdGetUsageSummaryResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-plans
    public func GetPlans(token: String) -> SbdGetPlansResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/GetPlans") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),

        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdGetPlansResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-contracts
    public func GetContracts(token: String, subscriber: String) -> SbdGetContractsResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/GetContracts") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdGetContractsResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#activate-subscriber
    public func ActivateSubscriber(token: String, subscriber: String, plan: String) -> SbdActivateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/ActivateSubscriber") else {return nil}
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
        guard let result = try? decoder.decode(SbdActivateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#deactivate-subscriber
    public func DeactivateSubscriber(token: String, subscriber: String) -> SbdDeactivateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/DeactivateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdDeactivateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#resume-subscriber
    public func ResumeSubscriber(token: String, subscriber: String) -> SbdResumeSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/ResumeSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdResumeSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#suspend-subscriber-1
    public func SuspendSubscriber(token: String, subscriber: String) -> SbdSuspendSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/SuspendSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdSuspendSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#change-subscriber
    public func ChangeSubscriber(token: String, subscriber: String, plan: String) -> SbdChangeSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/ChangeSubscriber") else {return nil}
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
        guard let result = try? decoder.decode(SbdChangeSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#update-subscriber
    public func UpdateSubscriber(token: String, subscriber: String, name: String, description: String) -> SbdUpdateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/UpdateSubscriber") else {return nil}
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
        guard let result = try? decoder.decode(SbdUpdateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#create-destination
    public func CreateDestination(token: String, subscriber: String, destination: String, type: String, moack: Bool, geodata: Bool) -> SbdCreateDestinationResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/CreateDestination") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber),
			URLQueryItem(name: "destination", value: destination),
			URLQueryItem(name: "type", value: type),
			URLQueryItem(name: "moack", value: String(moack)),
			URLQueryItem(name: "geodata", value: String(geodata))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdCreateDestinationResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#delete-destination
    public func DeleteDestination(token: String, destination: String) -> SbdDeleteDestinationResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/DeleteDestination") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "destination", value: destination)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdDeleteDestinationResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#swap-subscriber
    public func ReassociateSubscriber(token: String, subscriber: String, hardware: String) -> SbdReassociateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/ReassociateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber),
			URLQueryItem(name: "hardware", value: hardware)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdReassociateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#assign-billing-group
    public func AssignBillingGroup(token: String, subscriber: String, billingGroup: String) -> SbdAssignBillingGroupResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/AssignBillingGroup") else {return nil}
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
        guard let result = try? decoder.decode(SbdAssignBillingGroupResult.self, from: resultData) else {return nil}

        return result
    }
}