// Sbd.swift
// https://docs.cloudloop.com/reference#create-subscriber

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct SbdSBDCreateSubscriberResult: Codable
{
	public let subscriber: SBDCreateSubscriber

    public init(token: String, subscriber: SBDCreateSubscriber)
    {
		self.subscriber = subscriber
    }
}

public struct SbdGetSubscriberResult: Codable
{
	public let subscriber: SBDGetSubscriber

    public init(token: String, subscriber: SBDGetSubscriber)
    {
		self.subscriber = subscriber
    }
}

public struct SbdSearchSubscribersResult: Codable, SBDResult
{
	public let subscribers: [SBDSearchSubscriber]

    public init(token: String, subscribers: [SBDSearchSubscriber])
    {
		self.subscribers = subscribers
    }
}

public struct SbdGetUsageResult: Codable
{
	public let usage: SBDUsage

    public init(token: String, usage: SBDUsage)
    {
		self.usage = usage
    }
}

public struct SbdGetUsageSummaryResult: Codable
{
	public let summary: UsageSummary

    public init(token: String, summary: UsageSummary)
    {
		self.summary = summary
    }
}

public struct SbdGetPlansResult: Codable
{
	public let plans: [SBDGetPlans]

    public init(token: String, plans: [SBDGetPlans])
    {
		self.plans = plans
    }
}

public struct SbdGetContractsResult: Codable
{
	public let contracts: [SBDGetContracts]

    public init(token: String, contracts: [SBDGetContracts])
    {
		self.contracts = contracts
    }
}

public struct SbdActivateSubscriberResult: Codable
{
	public let contract: SBDActivateSubscriber

    public init(token: String, contract: SBDActivateSubscriber)
    {
		self.contract = contract
    }
}

public struct SbdDeactivateSubscriberResult: Codable
{
	public let contract: SBDDeactivateSubscriber

    public init(token: String, contract: SBDDeactivateSubscriber)
    {
		self.contract = contract
    }
}

public struct SbdResumeSubscriberResult: Codable
{
	public let contract: SBDResumeSubscriber

    public init(token: String, contract: SBDResumeSubscriber)
    {
		self.contract = contract
    }
}

public struct SbdSuspendSubscriberResult: Codable
{
	public let contract: SBDSuspendSubscriber

    public init(token: String, contract: SBDSuspendSubscriber)
    {
		self.contract = contract
    }
}

public struct SbdChangeSubscriberResult: Codable
{
	public let contract: SBDChangeSubscriber

    public init(token: String, contract: SBDChangeSubscriber)
    {
		self.contract = contract
    }
}

public struct SbdUpdateSubscriberResult: Codable
{
	public let subscriber: SBDUpdateSubscriber

    public init(token: String, subscriber: SBDUpdateSubscriber)
    {
		self.subscriber = subscriber
    }
}

public struct SbdCreateDestinationResult: Codable, SBDResult
{
	public let destination: SBDCreateDestination

    public init(token: String, destination: SBDCreateDestination)
    {
		self.destination = destination
    }
}

public struct SbdDeleteDestinationResult: Codable, SBDResult
{
	public let result: Bool

    public init(token: String, result: Bool)
    {
		self.result = result
    }
}

public struct SbdReassociateSubscriberResult: Codable
{
	public let contract: SBDReassociateSubscriber

    public init(token: String, contract: SBDReassociateSubscriber)
    {
		self.contract = contract
    }
}

public struct SBDErrorResult: Codable, SBDResult
{
    public let at: Float
    public let error: String
    public let exceptions: [SBDExceptionType]?

    public init(token: String, at: Float, error: String, exceptions: [SBDExceptionType]?)
    {
        self.at = at
        self.error = error
        self.exceptions = exceptions
    }
}

public struct SBDExceptionType: Codable
{
    public let name: String
    public let id: Float
    
    public init(name: String, id: Float)
    {
        self.name = name
        self.id = id
    }
}

public struct SbdAssignBillingGroupResult: Codable
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

public protocol SBDResult { }

public struct Sbd
{
   public init() {}

    // https://docs.cloudloop.com/reference#create
    public func CreateSubscriber(token: String, hardware: String, name: String? = nil) -> SbdSBDCreateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/CreateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "hardware", value: hardware),
			URLQueryItem(name: "name", value: name ?? "")
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print("\nCreateSubscriber response: \(dataString)")
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
//        let dataString = String(decoding: resultData, as: UTF8.self)
//        print("\nGetSubscriber response: \(dataString)")
        let decoder = JSONDecoder()
        
        do
        {
            let result = try decoder.decode(SbdGetSubscriberResult.self, from: resultData)
            return result
        }
        catch
        {
            print("Failed to decode result from /Sbd/GetSubscriber to valid JSON. Error: \(error)")
            return nil
        }
    }
    

    // https://docs.cloudloop.com/reference#search-subscribers
    public func SearchSubscribers(token: String, query: String? = nil, status: String? = nil, hardware: String? = nil) -> SBDResult?
    {
        print("SBD.SearchSubscribers() called")
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/SearchSubscribers") else {return nil}

        components.queryItems = [URLQueryItem(name: "token", value: token)]
        
        if let query = query {
            let queryItem = URLQueryItem(name: "query", value: query)
            components.queryItems?.append(queryItem)
        }
        
        if let status = status {
            let statusItem = URLQueryItem(name: "status", value: status)
            components.queryItems?.append(statusItem)
        }
        
        if let hardware = hardware {
            let hardwareItem = URLQueryItem(name: "hardware", value: hardware)
            components.queryItems?.append(hardwareItem)
        }
        
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        
        print("Retrieved data contents of \(url.path): ")
        let dataString = String(decoding: resultData, as: UTF8.self)
        print("\nSearchSubscribers response: \(dataString)")
        let decoder = JSONDecoder()
        
        do
        {
            let result = try decoder.decode(SbdSearchSubscribersResult.self, from: resultData)
            return result
        }
        catch
        {
            do
            {
                let result = try decoder.decode(SBDErrorResult.self, from: resultData)                
                return result
            }
            catch
            {
                print("Failed to decode the Sbd/SearchSubscribers response into SBDErrorResult. Errror: \n\(error)")
                return nil
            }
        }
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
        print("\nGetUsage response: \(dataString)")
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
        print("\nGetUsage response: \(dataString)")
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
        print("\nGetPlans response: \(dataString)")
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
        print("\nGetContracts response: \(dataString)")
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
        print("ActivateSubscriber response: \(dataString)")
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
        print("\nDeactivateSubscriber response: \(dataString)")
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
        print("\nResumeSubscriber response: \(dataString)")
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
        print("\nSuspendSubscriber response: \(dataString)")
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
        print("\nChangeSubscriber response: \(dataString)")
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
        print("\nUpdateSubscriber response: \(dataString)")
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdUpdateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#create-destination
    public func CreateDestination(token: String, subscriber: String, destination: String, type: String, moack: Bool, geodata: Bool) -> SBDResult?
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
//        let dataString = String(decoding: resultData, as: UTF8.self)
//        print("\nCreate destination response: \(dataString)")
        
        let decoder = JSONDecoder()
        
        do
        {
            //SbdCreateDestinationResult
            let result = try decoder.decode(SbdCreateDestinationResult.self, from: resultData)
            return result
        }
        catch
        {
            do
            {
                let result = try decoder.decode(SBDErrorResult.self, from: resultData)
                return result
            }
            catch
            {
                print("Failed to decode the data from Sbd/CreateDestination to valid JSON. Error: \(error)")
                return nil
            }
        }
    }

    // https://docs.cloudloop.com/reference#delete-destination
    public func DeleteDestination(token: String, destination: String) -> SBDResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sbd/DeleteDestination") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "destination", value: destination)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        
        let dataString = String(decoding: resultData, as: UTF8.self)
        print("SBD Delete Destination response: \n\(dataString)")
        
        let decoder = JSONDecoder()
        
        if let result = try? decoder.decode(SbdDeleteDestinationResult.self, from: resultData)
        {
            return result
        }
        else if let sbdError = try? decoder.decode(SBDErrorResult.self, from: resultData)
        {
            return sbdError
        }
        else
        {
            print("Failed to decode the json data from Sbd/DeleteDestination to an SbdDeleteDestinationResult object.")
            return nil
        }
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
        print("ReassociateSubscriber response: \(dataString)")
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
        print("\nAssignBillingGroup response: \(dataString)")
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SbdAssignBillingGroupResult.self, from: resultData) else {return nil}

        return result
    }
}
