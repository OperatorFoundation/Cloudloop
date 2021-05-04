//
//  Endpoint.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/3/21.
//

import Foundation

public struct Endpoint
{
    public let name: String
    public let documentation: URL
    public let functions: [Function]

    public init(name: String, documentation: URL, functions: [Function])
    {
        self.name = name
        self.documentation = documentation
        self.functions = functions
    }
}
