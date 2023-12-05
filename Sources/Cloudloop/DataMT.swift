// DataMT.swift
// https://docs.cloudloop.com/reference#send-message

import Foundation

import Datable
import SwiftHexTools

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
    public func SendMessage(token: String, hardware: String, payload: String, flushMT: Bool = false) async -> DataMTSendMessageResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMt/DoSendMessage") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "hardware", value: hardware),
            URLQueryItem(name: "payload", value: payload.data.hex),
            URLQueryItem(name: "flushMt", value: String(flushMT))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? await Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMTSendMessageResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-message-status
    public func GetMessage(token: String, message: String) async -> DataMTGetMessageResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMt/GetMessage") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "message", value: message)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? await Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMTGetMessageResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-messages
    public func GetMessages(token: String, hardware: String, from: String, to: String) async -> DataMTDataMTGetMessagesResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMt/GetMessages") else {return nil}
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
        guard let result = try? decoder.decode(DataMTDataMTGetMessagesResult.self, from: resultData) else {
            print("Failed to decode GetMessages")
            return nil
        }

        return result
    }

    // https://docs.cloudloop.com/reference#getmessagespolled
    public func GetMessagesPolled(token: String, lastMessageRetrieved: String, maxPollTime: Int32) async -> DataMTGetMessagesPolledResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/DataMt/GetMessagesPolled") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "lastMessageRetrieved", value: lastMessageRetrieved),
			URLQueryItem(name: "maxPollTime", value: String(maxPollTime))
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? await Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(DataMTGetMessagesPolledResult.self, from: resultData) else {return nil}

        return result
    }
}
