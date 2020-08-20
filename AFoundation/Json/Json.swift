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

// MARK: Object

public extension JsonObject {
    
    func jsonString(_ key: JsonString) throws -> JsonString {
        let value = self[key]
        guard let string = value as? JsonString else {
            if self[key] == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotString(object: self, key: key, value: value!)
                throw error
            }
        }
        return string
    }
    
    func optionalJsonString(_ key: JsonString) throws -> JsonString? {
        let value = self[key]
        guard let string = value as? JsonString else {
            if self[key] == nil {
                return nil
            } else {
                let error = JsonErrorValueNotString(object: self, key: key, value: value!)
                throw error
            }
        }
        return string
    }
    
    func jsonNumber(_ key: JsonString) throws -> JsonNumber {
        let value = self[key]
        guard let number = value as? NSNumber else {
            if self[key] == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotNumber(object: self, key: key, value: value!)
                throw error
            }
        }
        return number
    }
    
    func optionalJsonNumber(_ key: JsonString) throws -> JsonNumber? {
        let value = self[key]
        guard let number = value as? NSNumber else {
            if self[key] == nil {
                return nil
            } else {
                let error = JsonErrorValueNotNumber(object: self, key: key, value: value!)
                throw error
            }
        }
        return number
    }
    
    func jsonObject(_ key: JsonString) throws -> JsonObject {
        let value = self[key]
        guard let object = value as? JsonObject else {
            if self[key] == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotObject(object: self, key: key, value: value!)
                throw error
            }
        }
        return object
    }
    
    func optionalJsonObject(_ key: JsonString) throws -> JsonObject? {
        let value = self[key]
        guard let object = value as? JsonObject else {
            if self[key] == nil {
                return nil
            } else {
                let error = JsonErrorValueNotObject(object: self, key: key, value: value!)
                throw error
            }
        }
        return object
    }

    func jsonArray(_ key: JsonString) throws -> JsonArray {
        let value = self[key]
        guard let array = value as? JsonArray else {
            if self[key] == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotArray(object: self, key: key, value: value!)
                throw error
            }
        }
        return array
    }
    
    func optionalJsonArray(_ key: JsonString) throws -> JsonArray? {
        let value = self[key]
        guard let array = value as? JsonArray else {
            if self[key] == nil {
                return nil
            } else {
                let error = JsonErrorValueNotArray(object: self, key: key, value: value!)
                throw error
            }
        }
        return array
    }
    
    func jsonBoolean(_ key: JsonString) throws -> Bool {
        let value = self[key]
        guard let boolean = value as? Bool else {
            if self[key] == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotBoolean(object: self, key: key, value: value!)
                throw error
            }
        }
        return boolean
    }
    
    func optionalJsonBoolean(_ key: JsonString) throws -> Bool? {
        let value = self[key]
        guard let boolean = value as? Bool else {
            if self[key] == nil {
                return nil
            } else {
                let error = JsonErrorValueNotBoolean(object: self, key: key, value: value!)
                throw error
            }
        }
        return boolean
    }
    
    func jsonNull(_ key: JsonString) throws -> JsonNull {
        let value = self[key]
        guard let null = value as? NSNull else {
            if self[key] == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotNull(object: self, key: key, value: value!)
                throw error
            }
        }
        return null
    }
    
    func optionalJsonNull(_ key: JsonString) throws -> JsonNull? {
        let value = self[key]
        guard let null = value as? NSNull else {
            if self[key] == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotNull(object: self, key: key, value: value!)
                throw error
            }
        }
        return null
    }
    
}

// MARK: Array

public typealias JsonArrayStrings = [JsonString]
public typealias JsonArrayNumbers = [JsonNumber]
public typealias JsonArrayObjects = [JsonObject]
public typealias JsonArrayArrays = [JsonArray]
public typealias JsonArrayBooleans = [JsonBoolean]

public extension JsonArray {
    
    func jsonArrayStrings() throws -> JsonArrayStrings {
        guard let arrayStrings = self as? JsonArrayStrings else {
            let error = JsonErrorNotArrayStrings(array: self)
            throw error
        }
        return arrayStrings
    }
    
    func jsonArrayNumbers() throws -> JsonArrayNumbers {
        guard let arrayNumbers = self as? JsonArrayNumbers else {
            let error = JsonErrorNotArrayNumbers(array: self)
            throw error
        }
        return arrayNumbers
    }
    
    func jsonArrayObjects() throws -> JsonArrayObjects {
        guard let arrayObjects = self as? JsonArrayObjects else {
            let error = JsonErrorNotArrayObjects(array: self)
            throw error
        }
        return arrayObjects
    }
    
    func jsonArrayArrays() throws -> JsonArrayArrays {
        guard let arrayArrays = self as? JsonArrayArrays else {
            let error = JsonErrorNotArrayArrays(array: self)
            throw error
        }
        return arrayArrays
    }
    
    func jsonArrayBooleans() throws -> JsonArrayBooleans {
        guard let arrayBooleans = self as? JsonArrayBooleans else {
            let error = JsonErrorNotArrayBooleans(array: self)
            throw error
        }
        return arrayBooleans
    }
    
}
