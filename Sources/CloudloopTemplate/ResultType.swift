//
//  ResultType.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/4/21.
//

import Foundation

public struct ResultType
{
    public let fields: [String: ResultValueType]

    public init(fields: [String: ResultValueType])
    {
        self.fields = fields
    }
}

public indirect enum ResultValueType
{
    case optional(ResultValueType)
    case array(ResultValueType)
    case structure(ResultType)
    case float
    case string
    case date
    case identifier
}
