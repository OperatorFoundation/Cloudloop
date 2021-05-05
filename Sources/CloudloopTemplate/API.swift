//
//  File.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/3/21.
//

import Foundation

public struct API
{
    public let name: String
    public let url: String
    public let documentation: URL
    public let types: [ResultType]
    public let endpoints: [Endpoint]

    public init(name: String, url: String, documentation: URL, types: [ResultType], endpoints: [Endpoint])
    {
        self.name = name
        self.url = url
        self.documentation = documentation
        self.types = types
        self.endpoints = endpoints
    }
}
