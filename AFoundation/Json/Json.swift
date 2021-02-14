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
public enum JsonValueContainer: Equatable, Hashable {
    
    // MARK: String
    
    case string(JsonString)
    
    init(_ string: JsonString) {
        self = .string(string)
    }
    
    // MARK: Number
    
    case number(JsonNumber)
    
    init(_ number: JsonNumber) {
        self = .number(number)
    }
    
    // MARK: Object
    
    case object(JsonObject)
    
    init(_ object: JsonObject) {
        self = .object(object)
    }
    
    // MARK: Array
    
    case array(JsonArray)
    
    init(_ array: JsonArray) {
        self = .array(array)
    }
    
    // MARK: Array
    
    case boolean(JsonBoolean)
    
    init(_ boolean: JsonBoolean) {
        self = .boolean(boolean)
    }
    
    // MARK: Array
    
    case null
    private static let nsNull = NSNull()
    
    // MARK: Equatable
    
    public static func == (lhs: JsonValueContainer, rhs: JsonValueContainer) -> Bool {
        switch (lhs, rhs) {
        case (let .string(lhsString), let .string(rhsString)):
            return lhsString == rhsString
        case (let .number(lhsNumber), let .number(rhsNumber)):
            return lhsNumber == rhsNumber
        case (let .object(lhsObject), let .object(rhsObject)):
            return lhsObject == rhsObject
        case (let .array(lhsArray), let .array(rhsArray)):
            return lhsArray == rhsArray
        case (let .boolean(lhsBoolean), let .boolean(rhsBoolean)):
            return lhsBoolean == rhsBoolean
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
        case let .boolean(boolean):
            hasher.combine(boolean)
        case .null:
            hasher.combine(JsonValueContainer.nsNull)
        }
    }
    
    public func string() throws -> JsonString {
        guard case .string(let string) = self else {
            let error = JsonValueIsNotStringError(value: self)
            throw error
        }
        return string
    }
    
    public func number() throws -> JsonNumber {
        guard case .number(let number) = self else {
            let error = JsonValueIsNotNumberError(value: self)
            throw error
        }
        return number
    }
    
    public func object() throws -> JsonObject {
        guard case .object(let object) = self else {
            let error = JsonValueIsNotObjectError(value: self)
            throw error
        }
        return object
    }
    
    public func array() throws -> JsonArray {
        guard case .array(let array) = self else {
            let error = JsonValueIsNotArrayError(value: self)
            throw error
        }
        return array
    }
    
    public func boolean() throws -> JsonBoolean {
        guard case .boolean(let boolean) = self else {
            let error = JsonValueIsNotBooleanError(value: self)
            throw error
        }
        return boolean
    }
    
    public func null() throws -> JsonNull {
        guard case .null = self else {
            let error = JsonValueIsNotNullError(value: self)
            throw error
        }
        return JsonNull()
    }
}

public struct JsonValueIsNotStringError: Error {
    
    private let value: JsonValueContainer
    
    init(value: JsonValueContainer) {
        self.value = value
    }
    
}

public struct JsonValueIsNotNumberError: LocalizedError {
    
    private let value: JsonValueContainer
    
    init(value: JsonValueContainer) {
        self.value = value
    }
    
}

public struct JsonValueIsNotObjectError: LocalizedError {
    
    private let value: JsonValueContainer
    
    init(value: JsonValueContainer) {
        self.value = value
    }
    
}

public struct JsonValueIsNotArrayError: LocalizedError {
    
    private let value: JsonValueContainer
    
    init(value: JsonValueContainer) {
        self.value = value
    }
    
}

public struct JsonValueIsNotBooleanError: LocalizedError {
    
    private let value: JsonValueContainer
    
    init(value: JsonValueContainer) {
        self.value = value
    }
    
}

public struct JsonValueIsNotNullError: LocalizedError {
    
    private let value: JsonValueContainer
    
    init(value: JsonValueContainer) {
        self.value = value
    }
    
}
