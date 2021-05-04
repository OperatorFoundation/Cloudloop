//
//  Parameter.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/3/21.
//

import Foundation

public struct Parameter
{
    public let name: String
    public let description: String?
    public let type: ParameterType
    public let optional: Bool

    public init(name: String, description: String? = nil, type: ParameterType, optional: Bool = false)
    {
        self.name = name
        self.description = description
        self.type = type
        self.optional = optional
    }
}
