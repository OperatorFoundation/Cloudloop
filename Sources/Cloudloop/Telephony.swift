// Telephony.swift
// https://docs.cloudloop.com/reference#create

import Foundation

public struct CreateSubscriberResult: Codable
{
	let contract: Identifier?
	let createdAt: Date
	let sim: Identifier
	let account: Identifier
	let description: String
	let id: Identifier
	let name: String
	let billingGroup: Identifier
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
}