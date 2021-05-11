//
//  ResultType.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/4/21.
//

import Foundation

public struct ResultType
{
    public let name: String
    public let fields: [String: ResultValueType]

    public init(name: String, fields: [String: ResultValueType])
    {
        self.name = name
        self.fields = fields
    }
}

public indirect enum ResultValueType
{
    case optional(ResultValueType)
    case array(ResultValueType)
    case structure(String)
    case float
    case int32
    case boolean
    case string
    case date
    case identifier
}
