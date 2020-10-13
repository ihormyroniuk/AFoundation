//
//  Json.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol JsonValue { }
public extension JsonValue {
    
    func string() throws -> JsonString {
        guard let string = self as? JsonString else {
            let error = UnexpectedError()
            throw error
        }
        return string
    }
    
    func number() throws -> JsonNumber {
        guard let number = self as? JsonNumber else {
            let error = UnexpectedError()
            throw error
        }
        return number
    }
    
    func object() throws -> JsonObject {
        guard let object = self as? JsonObject else {
            let error = UnexpectedError()
            throw error
        }
        return object
    }
    
    func array() throws -> JsonArray {
        guard let array = self as? JsonArray else {
            let error = UnexpectedError()
            throw error
        }
        return array
    }
    
    func boolean() throws -> JsonBoolean {
        guard let boolean = self as? JsonBoolean else {
            let error = UnexpectedError()
            throw error
        }
        return boolean
    }
    
    func null() throws -> JsonNull {
        guard let null = self as? JsonNull else {
            let error = UnexpectedError()
            throw error
        }
        return null
    }
    
}

// MARK: String

public typealias JsonString = String
extension JsonString: JsonValue { }

// MARK: Number

public typealias JsonNumber = Decimal
extension JsonNumber: JsonValue { }

// MARK: Object

public typealias JsonObject = [String: Any]
extension JsonObject: JsonValue { }

public func ==(lhs: JsonObject, rhs: JsonObject) -> Bool {
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}

public func ==(lhs: JsonObject?, rhs: JsonObject) -> Bool {
    guard let lhs = lhs else { return false }
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}

// MARK: Array

public typealias JsonArray = [Any]
extension JsonArray: JsonValue { }
public typealias JsonArrayStrings = [JsonString]
public typealias JsonArrayNumbers = [JsonNumber]
public typealias JsonArrayObjects = [JsonObject]
public typealias JsonArrayArrays = [JsonArray]
public typealias JsonArrayBooleans = [JsonBoolean]

public func ==(lhs: JsonArray, rhs: JsonArray) -> Bool {
    return NSArray(array: lhs).isEqual(to: rhs)
}

public func ==(lhs: JsonArray?, rhs: JsonArray) -> Bool {
    guard let lhs = lhs else { return false }
    return NSArray(array: lhs).isEqual(to: rhs)
}

// MARK: Boolean

public typealias JsonBoolean = Bool
extension JsonBoolean: JsonValue { }

// MARK: Null

public typealias JsonNull = NSNull
extension JsonNull: JsonValue { }
