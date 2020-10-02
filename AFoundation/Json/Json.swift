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
