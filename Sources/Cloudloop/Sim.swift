// Sim.swift
// https://docs.cloudloop.com/reference#create-sim

import Foundation

public struct SimCreateSimResult: Codable
{
	public let sim: CreateSim

    public init(token: String, sim: CreateSim)
    {
		self.sim = sim
    }
}

public struct SimGetSimResult: Codable
{
	public let sim: GetSim

    public init(token: String, sim: GetSim)
    {
		self.sim = sim
    }
}

public struct SimSearchSimsResult: Codable
{
	public let sims: [SearchSims]

    public init(token: String, sims: [SearchSims])
    {
		self.sims = sims
    }
}

public struct Sim
{
   public init() {}

    // https://docs.cloudloop.com/reference#create-sim
    public func CreateSim(token: String, iccid: String) -> SimCreateSimResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sim/CreateSim") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "iccid", value: iccid)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SimCreateSimResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-sim
    public func GetSim(token: String, sim: String) -> SimGetSimResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sim/GetSim") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "sim", value: sim)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SimGetSimResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-sims
    public func SearchSims(token: String) -> SimSearchSimsResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Sim/SearchSims") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),

        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SimSearchSimsResult.self, from: resultData) else {return nil}

        return result
    }
}