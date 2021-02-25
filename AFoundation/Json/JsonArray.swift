//
//  JsonArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonArray =  [JsonAnyValue]

public extension JsonArray {
    
    // MARK: Strings
    
    struct NotStringsError: Error, CustomDebugStringConvertible {
        private let array: JsonArray
        private let error: Error
        
        init(array: JsonArray, error: Error) {
            self.array = array
            self.error = error
        }
        
        public var debugDescription: String {
            return "\(String(reflecting: Self.self))\n\(String(reflecting: array)) is not strings array\nError: \(String(reflecting: error))"
        }
    }
    
    func strings() throws -> [String] {
        let strings: [String]
        do {
            strings = try map({ try $0.string() })
        } catch {
            throw NotStringsError(array: self, error: error)
        }
        return strings
    }
    
    struct NotNullableStringsError: Error, CustomDebugStringConvertible {
        private let array: JsonArray
        private let error: Error
        
        init(array: JsonArray, error: Error) {
            self.array = array
            self.error = error
        }
        
        public var debugDescription: String {
            return "\(String(reflecting: Self.self))\n\(String(reflecting: array)) is not nullable strings array\nError: \(String(reflecting: error))"
        }
    }
    
    func nullableStrings() throws -> [String?] {
        let strings: [String?]
        do {
            strings = try map({ try $0.nullableString() })
        } catch {
            throw NotNullableStringsError(array: self, error: error)
        }
        return strings
    }
    
    // MARK: Numbers
    
    func numbers() throws -> [Decimal] {
        return try map({ try $0.number() })
    }
    
    func objects() throws -> [JsonObject] {
        return try map({ try $0.object() })
    }
    
    func arrays() throws -> [JsonArray] {
        return try map({ try $0.array() })
    }
    
    func booleans() throws -> [Bool] {
        return try map({ try $0.boolean() })
    }
    
}

