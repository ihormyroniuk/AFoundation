//
//  Json.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol JsonValue { }

public typealias JsonString = String
extension JsonString: JsonValue { }

public typealias JsonNumber = NSNumber
extension JsonNumber: JsonValue { }

public typealias JsonObject = [JsonString: JsonValue]
extension JsonObject: JsonValue { }

public typealias JsonArray = [JsonValue]
extension JsonArray: JsonValue { }
public typealias JsonArrayStrings = [JsonString]
public typealias JsonArrayNumbers = [JsonNumber]
public typealias JsonArrayObjects = [JsonObject]
public typealias JsonArrayArrays = [JsonArray]
public typealias JsonArrayBooleans = [JsonBoolean]

public typealias JsonBoolean = Bool
extension JsonBoolean: JsonValue { }

public typealias JsonNull = NSNull
extension JsonNull: JsonValue { }

public func ==(lhs: JsonObject, rhs: JsonObject) -> Bool {
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}

public func ==(lhs: JsonObject?, rhs: JsonObject) -> Bool {
    guard let lhs = lhs else { return false }
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}

public func ==(lhs: JsonArray, rhs: JsonArray) -> Bool {
    return NSArray(array: lhs).isEqual(to: rhs)
}

public func ==(lhs: JsonArray?, rhs: JsonArray) -> Bool {
    guard let lhs = lhs else { return false }
    return NSArray(array: lhs).isEqual(to: rhs)
}
