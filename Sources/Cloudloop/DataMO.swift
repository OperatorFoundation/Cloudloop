// DataMO.swift
// https://docs.cloudloop.com/reference#retrieve-messages

import Foundation

public struct DataMODataMOGetMessagesResult: Codable
{
	let messages: [Messages]
}

public struct DataMOReceiveMessageLongPollResult: Codable
{
	let lastMessageRetreived: String
	let messages: [Messages]
}

public struct DataMO
{
    // https://docs.cloudloop.com/reference#retrieve-messages
    public func GetMessages(token: String, hardware: Identifier, from: Date, to: Date) -> DataMODataMOGetMessagesResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMO/GetMessages") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "hardware", value: hardware.string),
			URLQueryItem(name: "from", value: DateFormatter().string(from: from)),
			URLQueryItem(name: "to", value: DateFormatter().string(from: to))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMODataMOGetMessagesResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#retrieve-messages-long-poll
    public func GetMessagesPolled(token: String, maxPollTime: Int32, lastMessageReceived: String) -> DataMOReceiveMessageLongPollResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMO/GetMessagesPolled") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "maxPollTime", value: String(maxPollTime)),
			URLQueryItem(name: "lastMessageReceived", value: lastMessageReceived)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMOReceiveMessageLongPollResult.self, from: resultData) else {return nil}

        return result
    }
}