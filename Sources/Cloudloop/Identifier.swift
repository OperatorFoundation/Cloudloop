// https://docs.cloudloop.com/reference#identifiers

import Foundation

public struct Identifier: Codable
{
    public let string: String

    public init?(_ string: String)
    {
        guard string.count == 32 else {return nil}

        self.string = string
    }
}
