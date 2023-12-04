// Platform.swift
// https://docs.cloudloop.com/reference#ping

import Foundation

public struct PlatformPingResult: Codable
{
	public let ping: String

    public init(token: String, ping: String)
    {
		self.ping = ping
    }
}

public struct Platform
{
   public init() {}

    // https://docs.cloudloop.com/reference#ping
    public func Ping(token: String) async -> PlatformPingResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Platform/Ping") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),

        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? await Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(PlatformPingResult.self, from: resultData) else {return nil}

        return result
    }
}
