//
//  JsonString.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonString = String
extension JsonString: JsonValue { }

public extension JsonValue {
    
    func string() throws -> JsonString {
        guard let string = self as? JsonString else {
            let error = JsonValueIsNotStringError(value: self)
            throw error
        }
        return string
    }

}

public class JsonString1: JsonValue1, ExpressibleByStringLiteral {
    
    public let string: String
    
    public convenience init(string: String) {
        self.init(stringLiteral: string)
    }
    
    // MARK: ExpressibleByStringLiteral
    public typealias StringLiteralType = String
    
    required public init(stringLiteral string: String) {
        self.string = string
        super.init()
    }
    
    // MARK: Equatable
    
    public static func == (lhs: JsonString1, rhs: JsonString1) -> Bool {
        return lhs.string == rhs.string
    }
    
    // MARK: Hashable
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(string)
    }
}

public struct JsonValueIsNotStringError: Error {
    
    private let value: JsonValue
    
    init(value: JsonValue) {
        self.value = value
    }
    
}
