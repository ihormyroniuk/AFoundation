//
//  Json.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol JsonValue { }

extension String: JsonValue { }
extension NSNumber: JsonValue { }
extension Bool: JsonValue { }
extension NSNull: JsonValue { }
extension JsonObject: JsonValue { }
extension JsonArray: JsonValue { }

public typealias JsonString = String
public typealias JsonNumber = NSNumber
public typealias JsonObject = [JsonString: JsonValue]
public typealias JsonArray = [JsonValue]
public typealias JsonBoolean = Bool
public typealias JsonNull = NSNull

public struct JsonErrorValueMissing: LocalizedError {
    
    let object: JsonObject
    let key: String
    
    init(object: JsonObject, key: String) {
        self.object = object
        self.key = key
    }
    
}
