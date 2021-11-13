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
        else { throw Error("Cannot get \(String(reflecting: String.self)) for \(String(reflecting: self))") }
    }
    
    public func nullableString() throws -> String? {
        if case .string(let string) = self { return string }
        else if case .null = self { return nil }
        else { throw Error("Cannot get \(String(reflecting: String?.self)) for \(String(reflecting: self))") }
    }
    
    // MARK: Number
    
    case number(Decimal)
    
    public init(_ number: Decimal) {
        self = .number(number)
    }
    
    public func number() throws -> Decimal {
        if case .number(let number) = self { return number }
        else { throw Error("Cannot get \(String(reflecting: Decimal.self)) for \(String(reflecting: self))") }
    }
    
    public func nullableNumber() throws -> Decimal? {
        if case .number(let decimal) = self { return decimal }
        else if case .null = self { return nil }
        else { throw Error("Cannot get \(String(reflecting: Decimal?.self)) for \(String(reflecting: self))") }
    }
    
    // MARK: Object
    
    case object(JsonObject)
    
    public init(_ object: JsonObject) {
        self = .object(object)
    }
    
    public func object() throws -> JsonObject {
        if case .object(let object) = self { return object }
        else { throw Error("Cannot get \(String(reflecting: JsonObject.self)) for \(String(reflecting: self))") }
    }
    
    public func nullableObject() throws -> JsonObject? {
        if case .object(let object) = self { return object }
        else if case .null = self { return nil }
        else { throw Error("Cannot get \(String(reflecting: JsonObject?.self)) for \(String(reflecting: self))") }
    }
    
    // MARK: Array
    
    case array(JsonArray)
    
    public init(_ array: JsonArray) {
        self = .array(array)
    }
    
    public func array() throws -> JsonArray {
        if case .array(let array) = self { return array }
        else { throw Error("Cannot get \(String(reflecting: JsonArray.self)) for \(String(reflecting: self))") }
    }
    
    public func nullableArray() throws -> JsonArray? {
        if case .array(let array) = self { return array }
        else if case .null = self { return nil }
        else { throw Error("Cannot get \(String(reflecting: JsonArray?.self)) for \(String(reflecting: self))") }
    }
    
    // MARK: Boolean
    
    case boolean(Bool)
    
    public init(_ boolean: Bool) {
        self = .boolean(boolean)
    }
    
    public func boolean() throws -> Bool {
        if case .boolean(let bool) = self { return bool }
        else { throw Error("Cannot get \(String(reflecting: Bool.self)) for \(String(reflecting: self))") }
    }
    
    public func nullableBoolean() throws -> Bool? {
        if case .boolean(let bool) = self { return bool }
        else if case .null = self { return nil }
        else { throw Error("Cannot get \(String(reflecting: Bool?.self)) for \(String(reflecting: self))") }
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
