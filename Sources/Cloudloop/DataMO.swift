// DataMO.swift
// https://docs.cloudloop.com/reference#retrieve-messages

import Foundation

public struct DataMOGetMessagesResult: Codable
{
	public let messages: [CloudloopMessage]

    public init(token: String, messages: [CloudloopMessage])
    {
		self.messages = messages
    }
}

public struct DataMORetrieveMessageLongPollResult: Codable
{
	public let lastMessageRetreived: String
	public let messages: [CloudloopMessage]

    public init(token: String, lastMessageRetreived: String, messages: [CloudloopMessage])
    {
		self.lastMessageRetreived = lastMessageRetreived
		self.messages = messages
    }
}

public struct DataMO
{
   public init() {}

    // https://docs.cloudloop.com/reference#retrieve-messages
    public func GetMessages(token: String, hardware: String, from: String, to: String) async -> DataMOGetMessagesResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMo/GetMessages") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "hardware", value: hardware),
			URLQueryItem(name: "from", value: from),
			URLQueryItem(name: "to", value: to)
        ]
        guard let url = components.url else {
            print("Could not make a URL from the provided options")
            return nil
        }
        
        guard let resultData = try? await Data(contentsOf: url) else {
            print("Could not make URL contents into data")
            return nil
        }
        
        let dataString = String(decoding: resultData, as: UTF8.self)
        print("\n URL data as string: \(dataString) \n")
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMOGetMessagesResult.self, from: resultData) else {
            print("Failed to decode GetMessages")
            return nil
        }

        return result
    }

    // https://docs.cloudloop.com/reference#retrieve-messages-long-poll
    public func GetMessagesPolled(token: String, maxPollTime: Int32, lastMessageReceived: String?) async -> DataMORetrieveMessageLongPollResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMo/GetMessagesPolled") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "maxPollTime", value: String(maxPollTime)),
			URLQueryItem(name: "lastMessageReceived", value: lastMessageReceived)
        ]
        guard let url = components.url else {
            print("Could not make a URL from the provided options")
            return nil
        }
        guard let resultData = try? await Data(contentsOf: url) else {
            print("Could not make URL contents into data")
            return nil
        }
        let dataString = String(decoding: resultData, as: UTF8.self)
        print("\n URL data as string: \(dataString) \n")
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMORetrieveMessageLongPollResult.self, from: resultData) else {
            print("Failed to decode GetMessages")
            return nil
        }

        return result
    }
}
