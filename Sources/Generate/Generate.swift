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

    guard let resources = File.contentsOfDirectory(atPath: resourcePath) else {return false}

    for resource in resources
    {
        let sourcePath = "\(resourcePath)/\(resource)"
        let destination = "\(sourceDir)/\(resource)"
        guard File.copy(sourcePath: sourcePath, destinationPath: destination) else {return false}
    }

    guard generateReadme(target: target, name: api.name, documentation: api.documentation) else {return false}

    guard generateTypesFile(target: target, types: api.types) else {return false}
    
    for endpoint in api.endpoints
    {
        guard generateEndpoint(baseURL: api.url, target: target, endpoint: endpoint) else {return false}
    }

    print("Success. Wrote files to \(sourceDir).")

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

func generateTypesFile(target: String, types: [ResultType]) -> Bool {
    let contentsResultTypes = generateTypes(types: types)
    
    let contents = """
     // Types.swift

     import Foundation

     \(contentsResultTypes)
     """

    let destination = "Sources/\(target)/Types.swift"

    return File.put(destination, contents: contents.data)
}

func generateTypes(types: [ResultType]) -> String
{
    let strings = types.map
    {
        type in

        return generateType(type: type)
    }

    return strings.joined(separator: "\n\n")
}

func generateType(type: ResultType) -> String
{
    let resultBody = generateResultBody(resultType: type)
    let resultInit = generateResultInit(resultType: type)

    let contents = """
    public struct \(type.name): Codable
    {
    \(resultBody)
    
    \(resultInit)
    }
    """

    return contents
}

func generateEndpoint(baseURL: String, target: String, endpoint: Endpoint) -> Bool
{
    let url = "\(baseURL)/\(endpoint.name)"

    guard let contentsFunctions = generateFunctions(baseUrl: url, endpointName: endpoint.name, functions: endpoint.functions) else {return false}
    let contentsResultTypes = generateResultTypes(endpointName: endpoint.name, functions: endpoint.functions)

    let contents = """
     // \(endpoint.name).swift
     // \(endpoint.documentation)

     import Foundation

     \(contentsResultTypes)

     public struct \(endpoint.name)
     {
        public init() {}
     
     \(contentsFunctions)
     }
     """

    let destination = "Sources/\(target)/\(endpoint.name).swift"

    return File.put(destination, contents: contents.data)
}

func generateFunctions(baseUrl: String, endpointName: String, functions: [Function]) -> String?
{
    let strings = functions.map
    {
        function in

        return generateFunction(baseUrl: baseUrl, endpointName: endpointName, function: function)
    }

    return strings.joined(separator: "\n\n")
}

func generateFunction(baseUrl: String, endpointName: String, function: Function) -> String
{
    let url = "\(baseUrl)/\(function.name)"

    let parameters = generateParameters(parameters: function.parameters)
    let functionBody = generateFunctionBody(url: url, endpointName: endpointName, function: function)
    if (function.parameters.count == 0) {
        return """
            // \(function.documentation)
            public func \(function.name)(token: String) -> \(endpointName)\(function.resultType.name)Result?
            {
        \(functionBody)
            }
        """
    } else {
        return """
            // \(function.documentation)
            public func \(function.name)(token: String, \(parameters)) -> \(endpointName)\(function.resultType.name)Result?
            {
        \(functionBody)
            }
        """
    }

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
    if parameter.optional {
        let contents = "\(parameter.name): \(parameter.type.rawValue)? = nil"
    
        return contents
    } else {
        let contents = "\(parameter.name): \(parameter.type.rawValue)"
    
        return contents
    }
}

func generateFunctionBody(url: String, endpointName: String, function: Function) -> String
{
    let dictionaryContents = generateDictionaryContents(parameters: function.parameters)

    let contents = """
            guard var components = URLComponents(string: "\(url)") else {return nil}
            components.queryItems = [
                URLQueryItem(name: "token", value: token),
    \(dictionaryContents)
            ]
            guard let url = components.url else {return nil}
            guard let resultData = try? Data(contentsOf: url) else {return nil}
            let dataString = String(decoding: resultData, as: UTF8.self)
            print(dataString)
            let decoder = JSONDecoder()
            guard let result = try? decoder.decode(\(endpointName)\(function.resultType.name)Result.self, from: resultData) else {return nil}

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
    if parameter.optional {
        let value = generateValue(value: parameter)
        let contents = "\t\t\tURLQueryItem(name: \"\(parameter.name)\", value: \(value))"

        return contents
    } else {
        let value = generateValue(value: parameter)
        let contents = "\t\t\tURLQueryItem(name: \"\(parameter.name)\", value: \(value))"

        return contents
    }
}

func generateValue(value: Parameter) -> String
{
    if value.optional {
        switch value.type
        {
            case .boolean:
                return "String(\(value.name) ?? \"\")"
            case .int32:
                return "String(\(value.name) ?? \"\")"
            case .string:
                return "\(value.name) ?? \"\""
        }
    } else {
        switch value.type
        {
            case .boolean:
                return "String(\(value.name))"
            case .int32:
                return "String(\(value.name))"
            case .string:
                return "\(value.name)"
        }
    }
}

func generateResultTypes(endpointName: String, functions: [Function]) -> String
{
    let strings = functions.map
    {
        function in

        return generateResultType(endpointName: endpointName, function: function)
    }

    return strings.joined(separator: "\n\n")
}

func generateResultType(endpointName: String, function: Function) -> String
{
    let resultBody = generateResultBody(resultType: function.resultType)
    let resultInit = generateResultInit(resultType: function.resultType)
    
    let contents = """
    public struct \(endpointName)\(function.resultType.name)Result: Codable
    {
    \(resultBody)
    
    \(resultInit)
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

func generateResultInit(resultType: ResultType) -> String
{
    let parameters = generateInitParameters(parameters: resultType.fields)
    let functionBody = generateInitBody(resultType: resultType)
    if (resultType.fields.count == 0)
    {
        return """
            public init(token: String)
            {
        \(functionBody)
            }
        """
    } else {
        return """
            public init(token: String, \(parameters))
            {
        \(functionBody)
            }
        """
    }
}

func generateInitParameters(parameters: [(String, ResultValueType)]) -> String
{
    let strings = parameters.map
    {
        parameter in

        generateInitParameter(parameter: parameter)
    }

    return strings.joined(separator: ", ")
}

func generateInitParameter(parameter: (String, ResultValueType)) -> String
{
    let (name, type) = parameter
    let typeString = generateResultValueType(valueType: type)
    let contents = "\(name): \(typeString)"
    
    return contents
}

func generateInitBody(resultType: ResultType) -> String
{
    let strings = resultType.fields.map
    {
        (key, _) in

        return generateInitField(key: key)
    }

    return strings.joined(separator: "\n")
}

func generateInitField(key: String) -> String
{
    if key == "default" {
        return "\t\tself.`\(key)` = `\(key)`"
    } else {
        return "\t\tself.\(key) = \(key)"
    }
}

func generateField(key: String, valueType: ResultValueType) -> String
{
    let valueString = generateResultValueType(valueType: valueType)
    if key == "default" {
        return "\tpublic let `\(key)`: \(valueString)"
    } else {
        return "\tpublic let \(key): \(valueString)"
    }
}

func generateResultValueType(valueType: ResultValueType) -> String
{
    switch valueType
    {
        case .string:
            return "String"
        case .identifier:
            return "String"
        case .date:
            return "Date"
        case .float:
            return "Float"
        case .int32:
            return "Int32"
        case .boolean:
            return "Bool"
        case .optional(let subType):
            let subtypeString = generateResultValueType(valueType: subType)
            return "\(subtypeString)?"
        case .array(let subType):
            let subtypeString = generateResultValueType(valueType: subType)
            return "[\(subtypeString)]"
        case .structure(let subType):
            return subType
    }
}
