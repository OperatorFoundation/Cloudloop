// Sim.swift
// https://docs.cloudloop.com/reference#create-sim

import Foundation

public struct SimCreateSimResult: Codable
{
	let sim: CreateSim
}

public struct SimGetSimResult: Codable
{
	let sim: GetSim
}

public struct SimSearchSimsResult: Codable
{
	let sims: [SearchSims]
}

public struct Sim
{
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
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(SimSearchSimsResult.self, from: resultData) else {return nil}

        return result
    }
}