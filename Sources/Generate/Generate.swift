//
//  File.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/3/21.
//

import Foundation
import Gardener
import CloudloopTemplate

public func generate(_ api: API, target: String, resourcePath: String) -> Bool
{
    let sourceDir = "Sources/\(target)"
    if File.exists(sourceDir)
    {
        guard File.delete(atPath: sourceDir) else {return false}
    }

    guard File.makeDirectory(atPath: sourceDir) else {return false}

    print(File.currentDirectory())
    print(resourcePath)
    guard let resources = File.contentsOfDirectory(atPath: resourcePath) else {return false}

    for resource in resources
    {
        let sourcePath = "\(resourcePath)/\(resource)"
        let destination = "\(sourceDir)/\(resource)"
        guard File.copy(sourcePath: sourcePath, destinationPath: destination) else {return false}
    }

    guard generateReadme(target: target, name: api.name, documentation: api.documentation) else {return false}

    for endpoint in api.endpoints
    {
        guard generateEndpoint(baseURL: api.url, target: target, endpoint: endpoint) else {return false}
    }

    return true
}

func generateReadme(target: String, name: String, documentation: URL) -> Bool
{
    let readme = """
    Swift wrapper for the \(name) API

    \(documentation)
    """

    let destination = "Sources/\(target)/README.md"

    return File.put(destination, contents: readme.data)
}

func generateEndpoint(baseURL: String, target: String, endpoint: Endpoint) -> Bool
{
    let url = "\(baseURL)/\(endpoint.name)"

    guard let contentsFunctions = generateFunctions(baseUrl: url, functions: endpoint.functions) else {return false}
    let contentsResultTypes = generateResultTypes(functions: endpoint.functions)

    let contents = """
    // \(endpoint.name).swift
    // \(endpoint.documentation)

    import Foundation

    \(contentsResultTypes)

    public struct \(endpoint.name)
    {
    \(contentsFunctions)
    }
    """

    let destination = "Sources/\(target)/\(endpoint.name).swift"

    return File.put(destination, contents: contents.data)
}

func generateFunctions(baseUrl: String, functions: [Function]) -> String?
{
    let strings = functions.map
    {
        function in

        return generateFunction(baseUrl: baseUrl, function: function)
    }

    return strings.joined(separator: "\n\n")
}

func generateFunction(baseUrl: String, function: Function) -> String
{
    let url = "\(baseUrl)/\(function.name)"

    let parameters = generateParameters(parameters: function.parameters)
    let functionBody = generateFunctionBody(url: url, function: function)

    let contents = """
        // \(function.documentation)
        public func \(function.name)(\(parameters)) -> \(function.name)Result?
        {
    \(functionBody)
        }
    """

    return contents
}

func generateParameters(parameters: [Parameter]) -> String
{
    let strings = parameters.map
    {
        parameter in

        generateParameter(parameter: parameter)
    }

    return strings.joined(separator: ", ")
}

func generateParameter(parameter: Parameter) -> String
{
    let contents = "\(parameter.name): \(parameter.type.rawValue)"
    
    return contents
}

func generateFunctionBody(url: String, function: Function) -> String
{
    let dictionaryContents = generateDictionaryContents(parameters: function.parameters)

    let contents = """
            guard var components = URLComponents(string: "\(url)") else {return nil}
            components.queryItems = [
    \(dictionaryContents)
            ]
            guard let url = components.url else {return nil}
            guard let resultData = try? Data(contentsOf: url) else {return nil}
            let decoder = JSONDecoder()
            guard let result = try? decoder.decode(\(function.name)Result.self, from: resultData) else {return nil}

            return result
    """

    return contents
}

func generateDictionaryContents(parameters: [Parameter]) -> String
{
    let strings = parameters.map
    {
        parameter in

        return generateDictionaryPair(parameter: parameter)
    }

    return strings.joined(separator: ",\n")
}

func generateDictionaryPair(parameter: Parameter) -> String
{
    let value = generateValue(value: parameter)
    let contents = "\t\t\tURLQueryItem(name: \"\(parameter.name)\", value: \(value))"

    return contents
}

func generateValue(value: Parameter) -> String
{
    switch value.type
    {
        case .boolean:
            return "String(\(value.name))"
        case .identifier:
            return "\(value.name).string"
        case .int32:
            return "String(\(value.name))"
        case .string:
            return "\(value.name)"
        case .date:
            return "String(\(value.name))"
    }
}

func generateResultTypes(functions: [Function]) -> String
{
    let strings = functions.map
    {
        function in

        return generateResultType(function: function)
    }

    return strings.joined(separator: "\n\n")
}

func generateResultType(function: Function) -> String
{
    let resultBody = generateResultBody(resultType: function.resultType)

    let contents = """
    public struct \(function.name)Result: Codable
    {
    \(resultBody)
    }
    """

    return contents
}

func generateResultBody(resultType: ResultType) -> String
{
    let strings = resultType.fields.map
    {
        (key, valueType) in

        return generateField(key: key, valueType: valueType)
    }

    return strings.joined(separator: "\n")
}

func generateField(key: String, valueType: ResultValueType) -> String
{
    let valueString = generateResultValueType(valueType: valueType)

    return "\tlet \(key): \(valueString)"
}

func generateResultValueType(valueType: ResultValueType) -> String
{
    switch valueType
    {
        case .string:
            return "String"
        case .identifier:
            return "Identifier"
        case .date:
            return "Date"
        case .float:
            return "Float"
        case .optional(let subType):
            let subtypeString = generateResultValueType(valueType: subType)
            return "\(subtypeString)?"
        case .array(let subType):
            let subtypeString = generateResultValueType(valueType: subType)
            return "[\(subtypeString)]"
        case .structure(let subType):
            // FIXME
            return "FIXME(\(subType))"
    }
}
