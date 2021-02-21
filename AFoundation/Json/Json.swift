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
public enum JsonAnyValue: Equatable, Hashable {
    
    // MARK: String
    
    case string(String)
    
    init(_ string: String) {
        self = .string(string)
    }
    
    public struct NotStringError: Error {
        private let value: JsonAnyValue
        
        init(value: JsonAnyValue) {
            self.value = value
        }
    }
    
    public func string() throws -> String {
        if case .string(let string) = self { return string }
        throw NotStringError(value: self)
    }
    
    public struct NotNullableStringError: Error {
        private let value: JsonAnyValue
        
        init(value: JsonAnyValue) {
            self.value = value
        }
    }
    
    public func nullableString() throws -> String? {
        if case .string(let string) = self { return string }
        if case .null = self { return nil }
        throw NotNullableStringError(value: self)
    }
    
    // MARK: Number
    
    case number(Decimal)
    
    init(_ number: Decimal) {
        self = .number(number)
    }
    
    public struct NotNumberError: LocalizedError {
        private let value: JsonAnyValue
        
        init(value: JsonAnyValue) {
            self.value = value
        }
    }
    
    public func number() throws -> Decimal {
        if case .number(let number) = self { return number }
        throw NotNumberError(value: self)
    }
    
    public struct NotNullableNumberError: LocalizedError {
        private let value: JsonAnyValue
        
        init(value: JsonAnyValue) {
            self.value = value
        }
    }
    
    public func nullableNumber() throws -> Decimal? {
        if case .number(let decimal) = self { return decimal }
        if case .null = self { return nil }
        throw NotNullableNumberError(value: self)
    }
    
    // MARK: Object
    
    case object(JsonObject)
    
    init(_ object: JsonObject) {
        self = .object(object)
    }
    
    public struct NotObjectError: LocalizedError {
        private let value: JsonAnyValue
        
        init(value: JsonAnyValue) {
            self.value = value
        }
    }
    
    public func object() throws -> JsonObject {
        if case .object(let object) = self { return object }
        throw NotObjectError(value: self)
    }
    
    public struct NotNullableObjectError: LocalizedError {
        private let value: JsonAnyValue
        
        init(value: JsonAnyValue) {
            self.value = value
        }
    }
    
    public func nullableObject() throws -> JsonObject? {
        if case .object(let object) = self { return object }
        if case .null = self { return nil }
        throw NotNullableObjectError(value: self)
    }
    
    // MARK: Array
    
    case array(JsonArray)
    
    init(_ array: JsonArray) {
        self = .array(array)
    }
    
    public struct NotArrayError: LocalizedError {
        private let value: JsonAnyValue
        
        init(value: JsonAnyValue) {
            self.value = value
        }
    }
    
    public func array() throws -> JsonArray {
        if case .array(let array) = self { return array }
        throw NotArrayError(value: self)
    }
    
    public struct NotNullableArrayError: LocalizedError {
        private let value: JsonAnyValue
        
        init(value: JsonAnyValue) {
            self.value = value
        }
    }
    
    public func nullableArray() throws -> JsonArray? {
        if case .array(let array) = self { return array }
        if case .null = self { return nil }
        throw NotNullableArrayError(value: self)
    }
    
    // MARK: Boolean
    
    case boolean(Bool)
    
    init(_ boolean: Bool) {
        self = .boolean(boolean)
    }
    
    public struct NotBooleanError: LocalizedError {
        private let value: JsonAnyValue
        
        init(value: JsonAnyValue) {
            self.value = value
        }
    }
    
    public func boolean() throws -> Bool {
        if case .boolean(let bool) = self { return bool }
        throw NotBooleanError(value: self)
    }
    
    public struct NotNullableBooleanError: LocalizedError {
        private let value: JsonAnyValue
        
        init(value: JsonAnyValue) {
            self.value = value
        }
    }
    
    public func nullableBoolean() throws -> Bool? {
        if case .boolean(let bool) = self { return bool }
        if case .null = self { return nil }
        throw NotNullableBooleanError(value: self)
    }
    
    // MARK: Null
    
    case null
    
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
            let hashValue = 0
            hasher.combine(hashValue)
        }
    }
}
