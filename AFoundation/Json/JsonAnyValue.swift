//
//  Json.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://www.json.org/json-en.html
 */
public enum JsonAnyValue: Equatable, Hashable, CustomDebugStringConvertible {
    
    // MARK: String
    
    case string(String)
    
    public init(_ string: String) {
        self = .string(string)
    }
    
    public func string() throws -> String {
        if case .string(let string) = self { return string }
        struct NotStringError: Error, LocalizedError {
            let value: JsonAnyValue
            var errorDescription: String? {
                return "\(String(reflecting: Self.self))\n\(String(reflecting: value)) is not string"
            }
        }
        throw NotStringError(value: self)
    }
    
    public func nullableString() throws -> String? {
        if case .string(let string) = self { return string }
        if case .null = self { return nil }
        struct NotNullableStringError: Error, LocalizedError {
            let value: JsonAnyValue
            public var errorDescription: String? {
                return "\(String(reflecting: Self.self))\n\(String(reflecting: value)) is not string or null"
            }
        }
        throw NotNullableStringError(value: self)
    }
    
    // MARK: Number
    
    case number(Decimal)
    
    public init(_ number: Decimal) {
        self = .number(number)
    }
    
    public func number() throws -> Decimal {
        if case .number(let number) = self { return number }
        struct NotNumberError: Error, LocalizedError {
            let value: JsonAnyValue
            public var errorDescription: String? {
                return "\(String(reflecting: Self.self))\n\(String(reflecting: value)) is not number"
            }
        }
        throw NotNumberError(value: self)
    }
    
    public func nullableNumber() throws -> Decimal? {
        if case .number(let decimal) = self { return decimal }
        if case .null = self { return nil }
        struct NotNullableNumberError: Error, LocalizedError {
            let value: JsonAnyValue
            var errorDescription: String? {
                return "\(String(reflecting: Self.self))\n\(String(reflecting: value)) is not number or null"
            }
        }
        throw NotNullableNumberError(value: self)
    }
    
    // MARK: Object
    
    case object(JsonObject)
    
    public init(_ object: JsonObject) {
        self = .object(object)
    }
    
    public func object() throws -> JsonObject {
        if case .object(let object) = self { return object }
        struct NotObjectError: Error, LocalizedError {
            let value: JsonAnyValue
            public var errorDescription: String? {
                return "\(String(reflecting: Self.self))\n\(String(reflecting: value)) is not object"
            }
        }
        throw NotObjectError(value: self)
    }
    
    public func nullableObject() throws -> JsonObject? {
        if case .object(let object) = self { return object }
        if case .null = self { return nil }
        struct NotNullableObjectError: Error, LocalizedError {
            let value: JsonAnyValue
            var errorDescription: String? {
                return "\(String(reflecting: Self.self))\n\(String(reflecting: value)) is not object or null"
            }
        }
        throw NotNullableObjectError(value: self)
    }
    
    // MARK: Array
    
    case array(JsonArray)
    
    public init(_ array: JsonArray) {
        self = .array(array)
    }
    
    public func array() throws -> JsonArray {
        if case .array(let array) = self { return array }
        struct NotArrayError: Error, LocalizedError {
            let value: JsonAnyValue
            var errorDescription: String? {
                return "\(String(reflecting: Self.self))\n\(String(reflecting: value)) is not array"
            }
        }
        throw NotArrayError(value: self)
    }
    
    public func nullableArray() throws -> JsonArray? {
        if case .array(let array) = self { return array }
        if case .null = self { return nil }
        struct NotNullableArrayError: Error, LocalizedError {
            let value: JsonAnyValue
            var errorDescription: String? {
                return "\(String(reflecting: Self.self))\n\(String(reflecting: value)) is not array or null"
            }
        }
        throw NotNullableArrayError(value: self)
    }
    
    // MARK: Boolean
    
    case boolean(Bool)
    
    public init(_ boolean: Bool) {
        self = .boolean(boolean)
    }
    
    public func boolean() throws -> Bool {
        if case .boolean(let bool) = self { return bool }
        struct NotBooleanError: Error, LocalizedError {
            let value: JsonAnyValue
            var errorDescription: String? {
                return "\(String(reflecting: Self.self))\n\(String(reflecting: value)) is not boolean"
            }
        }
        throw NotBooleanError(value: self)
    }
    
    public func nullableBoolean() throws -> Bool? {
        if case .boolean(let bool) = self { return bool }
        if case .null = self { return nil }
        struct NotNullableBooleanError: Error, LocalizedError {
            let value: JsonAnyValue
            public var errorDescription: String? {
                return "\(String(reflecting: Self.self))\n\(String(reflecting: value)) is not boolean or null"
            }
        }
        throw NotNullableBooleanError(value: self)
    }
    
    // MARK: Null
    
    case null
    
    public init() {
        self = .null
    }
    
    // MARK: Equatable
    
    public static func == (lhs: JsonAnyValue, rhs: JsonAnyValue) -> Bool {
        switch (lhs, rhs) {
        case (let .string(lhsString), let .string(rhsString)):
            return lhsString == rhsString
        case (let .number(lhsNumber), let .number(rhsNumber)):
            return lhsNumber == rhsNumber
        case (let .object(lhsObject), let .object(rhsObject)):
            return lhsObject == rhsObject
        case (let .array(lhsArray), let .array(rhsArray)):
            return lhsArray == rhsArray
        case (let .boolean(lhsBool), let .boolean(rhsBool)):
            return lhsBool == rhsBool
        case (.null, .null):
            return true
        default:
            return false
        }
    }
    
    // MARK: Hashable
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case let .string(string):
            hasher.combine(string)
        case let .number(number):
            hasher.combine(number)
        case let .object(object):
            hasher.combine(object)
        case let .array(array):
            hasher.combine(array)
        case let .boolean(bool):
            hasher.combine(bool)
        case .null:
            hasher.combine(0)
        }
    }
    
    // MARK: CustomDebugStringConvertible
    
    public var debugDescription: String {
        switch self {
        case let .string(string):
            return "\(String(reflecting: Self.self))(.string(\(String(reflecting: string))))"
        case let .number(number):
            return "\(String(reflecting: Self.self))(.number(\(String(reflecting: number))))"
        case let .object(object):
            return "\(String(reflecting: Self.self))(.object(\(String(reflecting: object))))"
        case let .array(array):
            return "\(String(reflecting: Self.self))(.array(\(String(reflecting: array))))"
        case let .boolean(bool):
            return "\(String(reflecting: Self.self))(.boolean(\(String(reflecting: bool))))"
        case .null:
            return "\(String(reflecting: Self.self))(.null)"
        }
    }
}
