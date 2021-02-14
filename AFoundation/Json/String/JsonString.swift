//
//  JsonString.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct JsonString: Equatable, Hashable, ExpressibleByStringLiteral {
    
    public let string: String
    
    public init(_ string: String) {
        self.string = string
    }
    
    // MARK: ExpressibleByStringLiteral
    
    public typealias StringLiteralType = String
    
    public init(stringLiteral string: String) {
        self.string = string
    }
    
    // MARK: Equatable
    
    public static func == (lhs: JsonString, rhs: JsonString) -> Bool {
        return lhs.string == rhs.string
    }
    
    // MARK: Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(string)
    }
}
