// Hardware.swift
// https://docs.cloudloop.com/reference#create-hardware

import Foundation

public struct HardwareCreateHardwareResult: Codable
{
	let hardware: HardwareCreateHardware
}

public struct HardwareGetHardwareResult: Codable
{
	let hardware: HardwareGetHardware
}

public struct HardwareSearchHardwareResult: Codable
{
	let hardwares: [hardwares]
}

public struct Hardware
{
    // https://docs.cloudloop.com/reference#create-hardware
    public func CreateHardware(token: String, imei: String, type: String) -> HardwareCreateHardwareResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Hardware/CreateHardware") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "imei", value: imei),
			URLQueryItem(name: "type", value: type)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(HardwareCreateHardwareResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-hardware
    public func GetHardware(token: String, hardware: Identifier, imei: String) -> HardwareGetHardwareResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Hardware/GetHardware") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "hardware", value: hardware.string),
			URLQueryItem(name: "imei", value: imei)
        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(HardwareGetHardwareResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#search-hardware
    public func SearchHardware(token: String) -> HardwareSearchHardwareResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Hardware/SearchHardware") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),

        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(HardwareSearchHardwareResult.self, from: resultData) else {return nil}

        return result
    }
}