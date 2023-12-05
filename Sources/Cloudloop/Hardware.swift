// Hardware.swift
// https://docs.cloudloop.com/reference#create-hardware

import Foundation

public struct HardwareCreateHardwareResult: Codable
{
	public let hardware: HardwareCreateHardware

    public init(token: String, hardware: HardwareCreateHardware)
    {
		self.hardware = hardware
    }
}

public struct HardwareGetHardwareResult: Codable
{
	public let hardware: HardwareGetHardware

    public init(token: String, hardware: HardwareGetHardware)
    {
		self.hardware = hardware
    }
}

public struct HardwareSearchHardwareResult: Codable
{
	public let hardwares: [hardwares]

    public init(token: String, hardwares: [hardwares])
    {
		self.hardwares = hardwares
    }
}

public struct Hardware
{
   public init() {}

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
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(HardwareCreateHardwareResult.self, from: resultData) else {return nil}

        return result
    }

    // https://docs.cloudloop.com/reference#get-hardware
    public func GetHardware(token: String, imei: String) -> HardwareGetHardwareResult?
    {
        let urlString = "https://api.cloudloop.com/Hardware/GetHardware"
        guard var components = URLComponents(string: urlString) else
        {
            print("Failed to create a url for \(urlString)")
            return nil
        }
        
        components.queryItems = [
            URLQueryItem(name: "token", value: token),
			URLQueryItem(name: "imei", value: imei)
        ]
        guard let url = components.url else {return nil}
        
        do
        {
            let resultData = try Data(contentsOf: url)

            let dataString = String(decoding: resultData, as: UTF8.self)
            print("Received a result from GetHardware request: \(dataString)")
            
            do
            {
                let decoder = JSONDecoder()
                let result = try decoder.decode(HardwareGetHardwareResult.self, from: resultData)
                return result
            }
            catch (let jsonError)
            {
                print("Failed to decode the GetHardware result: \(jsonError)")
                return nil
            }
        }
        catch (let resultError)
        {
            print("Received an error from GetHardware request: \(resultError)")
            return nil
        }
    }

    // https://docs.cloudloop.com/reference#search-hardware
    public func SearchHardware(token: String) -> HardwareSearchHardwareResult?
    {
        guard var components = URLComponents(string: "https://api.cloudloop.com/Hardware/GetHardwares") else {return nil}
        components.queryItems = [
            URLQueryItem(name: "token", value: token),

        ]
        guard let url = components.url else {return nil}
        guard let resultData = try? Data(contentsOf: url) else {return nil}
        let dataString = String(decoding: resultData, as: UTF8.self)
        print(dataString)
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(HardwareSearchHardwareResult.self, from: resultData) else {return nil}

        return result
    }
}
