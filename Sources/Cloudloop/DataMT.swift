// DataMT.swift
// https://docs.cloudloop.com/reference#send-message

import Foundation

public struct DataMTSendMessageResult: Codable
{
	let requests: [Requests]
}

public struct DataMTGetMessageResult: Codable
{
	let message: DataMTGetMessage
}

public struct DataMTDataMTGetMessagesResult: Codable
{
	let messages: [DataMTMessages]
}

public struct DataMTGetMessagesPolledResult: Codable
{
	let messages: [DataMTMessages]
}

public struct DataMT
{
    // https://docs.cloudloop.com/reference#send-message
    public func SendMessage(token: String, hardware: Identifier, payload: String) -> DataMTSendMessageResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMT/SendMessage") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "hardware", value: hardware.string),
			URLQueryItem(name: "payload", value: payload)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMTSendMessageResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-message-status
    public func GetMessage(token: String, message: String) -> DataMTGetMessageResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMT/GetMessage") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "message", value: message)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMTGetMessageResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-messages
    public func GetMessages(token: String, hardware: Identifier, from: Date, to: Date) -> DataMTDataMTGetMessagesResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMT/GetMessages") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "hardware", value: hardware.string),
			URLQueryItem(name: "from", value: DateFormatter().string(from: from)),
			URLQueryItem(name: "to", value: DateFormatter().string(from: to))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMTDataMTGetMessagesResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#getmessagespolled
    public func GetMessagesPolled(token: String, lastMessageRetrieved: Identifier, maxPollTime: Int32) -> DataMTGetMessagesPolledResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMT/GetMessagesPolled") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "lastMessageRetrieved", value: lastMessageRetrieved.string),
			URLQueryItem(name: "maxPollTime", value: String(maxPollTime))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMTGetMessagesPolledResult.self, from: resultData) else {return nil}

        return result
    }
}