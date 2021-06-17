// User.swift
// https://docs.cloudloop.com/reference#generate-token

import Foundation

public struct UserGenerateTokenResult: Codable
{


    public init(token: String)
    {

    }
}

public struct User
{
   public init() {}

    // https://docs.cloudloop.com/reference#generate-token
    public func GenerateToken(token: String) -> UserGenerateTokenResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/User/GenerateToken") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),

        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(UserGenerateTokenResult.self, from: resultData) else {return nil}

        return result
    }
}