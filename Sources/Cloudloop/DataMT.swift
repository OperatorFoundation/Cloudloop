// DataMT.swift
// https://docs.cloudloop.com/reference#send-message

import Foundation

public struct DataMTSendMessageResult: Codable
{
	public let requests: [Requests]

    public init(token: String, requests: [Requests])
    {
		self.requests = requests
    }
}

public struct DataMTGetMessageResult: Codable
{
	public let message: DataMTGetMessage

    public init(token: String, message: DataMTGetMessage)
    {
		self.message = message
    }
}

public struct DataMTDataMTGetMessagesResult: Codable
{
	public let messages: [DataMTMessages]

    public init(token: String, messages: [DataMTMessages])
    {
		self.messages = messages
    }
}

public struct DataMTGetMessagesPolledResult: Codable
{
	public let messages: [DataMTMessages]

    public init(token: String, messages: [DataMTMessages])
    {
		self.messages = messages
    }
}

public struct DataMT
{
   public init() {}

    // https://docs.cloudloop.com/reference#send-message
    public func SendMessage(hardware: String, payload: String, flushMT: Bool = false) -> DataMTSendMessageResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMT/SendMessage") else {return nil}
        components.queryItems = [
			URLQueryItem(name: "hardware", value: hardware),
			URLQueryItem(name: "payload", value: payload),
            URLQueryItem(name: "flushMt", value: String(flushMT))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
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
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMTGetMessageResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-messages
    public func GetMessages(token: String, hardware: String, from: String, to: String) -> DataMTDataMTGetMessagesResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMT/GetMessages") else {return nil}
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
        guard let result = try? decoder.decode(DataMTDataMTGetMessagesResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#getmessagespolled
    public func GetMessagesPolled(token: String, lastMessageRetrieved: String, maxPollTime: Int32) -> DataMTGetMessagesPolledResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMT/GetMessagesPolled") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "lastMessageRetrieved", value: lastMessageRetrieved),
			URLQueryItem(name: "maxPollTime", value: String(maxPollTime))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMTGetMessagesPolledResult.self, from: resultData) else {return nil}

        return result
    }
}
