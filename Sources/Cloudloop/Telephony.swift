// Telephony.swift
// https://docs.cloudloop.com/reference#create

import Foundation

public struct CreateSubscriberResult: Codable
{
	let sim: Identifier
	let id: Identifier
	let account: Identifier
	let contract: Identifier?
	let name: String
	let createdAt: Date
	let billingGroup: Identifier
	let description: String
}

public struct GetSubscriberResult: Codable
{
	let id: Identifier
	let sim: Sim
	let name: String
	let contract: Contract
	let createdAt: Date
	let account: Identifier
	let hardware: Hardware
}

public struct SearchSubscribersResult: Codable
{
	let subscribers: [Subscriber]
}

public struct Telephony
{
    // https://docs.cloudloop.com/reference#create
    public func CreateSubscriber(token: String, sim: Identifier, name: String) -> CreateSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/CreateSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "sim", value: sim.string),
			URLQueryItem(name: "name", value: name)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(CreateSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#retrieve
    public func GetSubscriber(token: String, subscriber: Identifier) -> GetSubscriberResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/GetSubscriber") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "subscriber", value: subscriber.string)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(GetSubscriberResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#search
    public func SearchSubscribers(token: String, ) -> SearchSubscribersResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Telephony/SearchSubscribers") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),

        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SearchSubscribersResult.self, from: resultData) else {return nil}

        return result
    }
}