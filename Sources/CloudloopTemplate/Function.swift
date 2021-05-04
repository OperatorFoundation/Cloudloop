//
//  Function.swift
//  
//
//  Created by Dr. Brandon Wiley on 5/3/21.
//

import Foundation

public struct Function
{
    public let name: String
    public let documentation: URL
    public let resultType: ResultType
    public let parameters: [Parameter]

    public init(name: String, documentation: URL, resultType: ResultType, parameters: [Parameter])
    {
        self.name = name
        self.documentation = documentation
        self.resultType = resultType
        self.parameters = parameters
    }
}
