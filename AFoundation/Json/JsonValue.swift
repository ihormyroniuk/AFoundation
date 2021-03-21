//
//  Json.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://tools.ietf.org/html/rfc7159
 */
public enum JsonValue: Equatable, Hashable, CustomDebugStringConvertible {
    
    // MARK: String
    
    case string(String)
    
    public init(_ string: String) {
        self = .string(string)
    }
    
    public func string() throws -> String {
        if case .string(let string) = self { return string }
        else { throw NotStringError(jsonValue: self) }
    }
    struct NotStringError: Error, CustomDebugStringConvertible {
        private let fileId: StaticString
        private let line: UInt
        private let jsonValue: JsonValue
        
        init(fileId: StaticString = #fileID, line: UInt = #line, jsonValue: JsonValue) {
            self.fileId = fileId
            self.line = line
            self.jsonValue = jsonValue
        }
        
        var debugDescription: String {
            return "\(String(reflecting: Self.self)) - for line \(String(reflecting: line)) in file \(String(reflecting: fileId))\n\(String(reflecting: jsonValue)) is not string"
        }
    }
    
    public func nullableString() throws -> String? {
        if case .string(let string) = self { return string }
        else if case .null = self { return nil }
        else { throw NotNullableStringError(value: self) }
    }
    private struct NotNullableStringError: Error, CustomDebugStringConvertible {
        let value: JsonValue
        var debugDescription: String { return "\(String(reflecting: value)) is not string or null" }
    }
    
    // MARK: Number
    
    case number(Decimal)
    
    public init(_ number: Decimal) {
        self = .number(number)
    }
    
    public func number() throws -> Decimal {
        if case .number(let number) = self { return number }
        else { throw NotNumberError(value: self) }
    }
    private struct NotNumberError: Error, CustomDebugStringConvertible {
        let value: JsonValue
        var debugDescription: String { return "\(String(reflecting: value)) is not number" }
    }
    
    public func nullableNumber() throws -> Decimal? {
        if case .number(let decimal) = self { return decimal }
        else if case .null = self { return nil }
        else { throw NotNullableNumberError(value: self) }
    }
    private struct NotNullableNumberError: Error, CustomDebugStringConvertible {
        let value: JsonValue
        var debugDescription: String { return "\(String(reflecting: value)) is not number or null" }
    }
    
    // MARK: Object
    
    case object(JsonObject)
    
    public init(_ object: JsonObject) {
        self = .object(object)
    }
    
    public func object() throws -> JsonObject {
        if case .object(let object) = self { return object }
        else { throw NotObjectError(value: self) }
    }
    private struct NotObjectError: Error, CustomDebugStringConvertible {
        let value: JsonValue
        var debugDescription: String { return "\(String(reflecting: value)) is not object" }
    }
    
    public func nullableObject() throws -> JsonObject? {
        if case .object(let object) = self { return object }
        else if case .null = self { return nil }
        else { throw NotNullableObjectError(value: self) }
    }
    private struct NotNullableObjectError: Error, CustomDebugStringConvertible {
        let value: JsonValue
        var debugDescription: String { return "\(String(reflecting: value)) is not object or null" }
    }
    
    // MARK: Array
    
    case array(JsonArray)
    
    public init(_ array: JsonArray) {
        self = .array(array)
    }
    
    public func array() throws -> JsonArray {
        if case .array(let array) = self { return array }
        else { throw NotArrayError(value: self) }
    }
    private struct NotArrayError: Error, CustomDebugStringConvertible {
        let value: JsonValue
        var debugDescription: String { return "\(String(reflecting: value)) is not array" }
    }
    
    public func nullableArray() throws -> JsonArray? {
        if case .array(let array) = self { return array }
        else if case .null = self { return nil }
        else { throw NotNullableArrayError(value: self) }
    }
    private struct NotNullableArrayError: Error, CustomDebugStringConvertible {
        let value: JsonValue
        var debugDescription: String { return "\(String(reflecting: value)) is not array or null" }
    }
    
    // MARK: Boolean
    
    case boolean(Bool)
    
    public init(_ boolean: Bool) {
        self = .boolean(boolean)
    }
    
    public func boolean() throws -> Bool {
        if case .boolean(let bool) = self { return bool }
        else { throw NotBooleanError(value: self) }
    }
    private struct NotBooleanError: Error, CustomDebugStringConvertible {
        let value: JsonValue
        var debugDescription: String { return "\(String(reflecting: value)) is not boolean" }
    }
    
    public func nullableBoolean() throws -> Bool? {
        if case .boolean(let bool) = self { return bool }
        else if case .null = self { return nil }
        else { throw NotNullableBooleanError(value: self) }
    }
    private struct NotNullableBooleanError: Error, CustomDebugStringConvertible {
        let value: JsonValue
        var debugDescription: String { return "\(String(reflecting: value)) is not boolean or null" }
    }
    
    // MARK: Null
    
    case null
    
    // MARK: Equatable
    
    public static func == (lhs: JsonValue, rhs: JsonValue) -> Bool {
        switch (lhs, rhs) {
        case (let .string(lhsString), let .string(rhsString)): return lhsString == rhsString
        case (let .number(lhsNumber), let .number(rhsNumber)): return lhsNumber == rhsNumber
        case (let .object(lhsObject), let .object(rhsObject)): return lhsObject == rhsObject
        case (let .array(lhsArray), let .array(rhsArray)): return lhsArray == rhsArray
        case (let .boolean(lhsBool), let .boolean(rhsBool)): return lhsBool == rhsBool
        case (.null, .null): return true
        default: return false
        }
    }
    
    // MARK: Hashable
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case let .string(string): hasher.combine(string)
        case let .number(number): hasher.combine(number)
        case let .object(object): hasher.combine(object)
        case let .array(array): hasher.combine(array)
        case let .boolean(bool): hasher.combine(bool)
        case .null: hasher.combine(0)
        }
    }
    
    // MARK: CustomDebugStringConvertible
    
    public var debugDescription: String {
        switch self {
        case let .string(string): return "\(String(reflecting: Self.self)).string(\(String(reflecting: string)))"
        case let .number(number): return "\(String(reflecting: Self.self)).number(\(String(reflecting: number)))"
        case let .object(object): return "\(String(reflecting: Self.self)).object(\(String(reflecting: object)))"
        case let .array(array): return "\(String(reflecting: Self.self)).array(\(String(reflecting: array)))"
        case let .boolean(bool): return "\(String(reflecting: Self.self)).boolean(\(String(reflecting: bool)))"
        case .null: return "\(String(reflecting: Self.self)).null"
        }
    }
}
