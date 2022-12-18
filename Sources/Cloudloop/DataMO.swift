// DataMO.swift
// https://docs.cloudloop.com/reference#retrieve-messages

import Foundation

public struct DataMODataMOGetMessagesResult: Codable
{
	public let messages: [Messages]

    public init(token: String, messages: [Messages])
    {
		self.messages = messages
    }
}

public struct DataMOReceiveMessageLongPollResult: Codable
{
	public let lastMessageRetreived: String
	public let messages: [Messages]

    public init(token: String, lastMessageRetreived: String, messages: [Messages])
    {
		self.lastMessageRetreived = lastMessageRetreived
		self.messages = messages
    }
}

public struct DataMO
{
   public init() {}

    // https://docs.cloudloop.com/reference#retrieve-messages
    public func GetMessages(token: String, hardware: String, from: String, to: String) -> DataMODataMOGetMessagesResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMO/GetMessages") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "hardware", value: hardware),
			URLQueryItem(name: "from", value: from),
			URLQueryItem(name: "to", value: to)
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
    public func GetMessagesPolled(token: String, maxPollTime: Int32, lastMessageReceived: String?) -> DataMOReceiveMessageLongPollResult?
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
