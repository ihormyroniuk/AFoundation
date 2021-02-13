//
//  JsonObject.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public class JsonObject: JsonValue, ExpressibleByDictionaryLiteral {
    
    public var dictionary: [JsonString: JsonValue]
    
    public init(dictionary: [JsonString: JsonValue]) {
        self.dictionary = dictionary
        super.init()
    }
    
    // MARK: ExpressibleByDictionaryLiteral
    
    public typealias Key = JsonString
    
    public typealias Value = JsonValue
    
    required public init(dictionaryLiteral elements: (JsonString, JsonValue)...) {
        var dictionary: [JsonString: JsonValue] = [:]
        for element in elements {
            dictionary[element.0] = element.1
        }
        self.dictionary = dictionary
    }
    
    // MARK: Equatable
    
    public static func == (lhs: JsonObject, rhs: JsonObject) -> Bool {
        return lhs.dictionary == rhs.dictionary
    }
    
    // MARK: Hashable
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(dictionary)
    }
    
    public subscript(index: JsonString) -> JsonValue? {
        get {
            return dictionary[index]
        }
        set(newValue) {
            dictionary[index] = newValue
        }
    }
    
    public func value(_ key: JsonString) throws -> JsonValue {
        let optionalValue = self[key]
        guard let value = optionalValue else {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        return value
    }
    
    public func string(_ key: JsonString) throws -> JsonString {
        let value = self[key]
        guard let string = value as? JsonString else {
            if value == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotStringError(value: value!)
                throw error
            }
        }
        return string
    }

    public func optionalString(_ key: JsonString) throws -> JsonString? {
        let value = self[key]
        if let string = value as? JsonString {
            return string
        } else if value is JsonNull {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotStringError(value: value!)
        throw error
    }
    
    public func number(_ key: JsonString) throws -> JsonNumber {
        let value = self[key]
        guard let number = value as? JsonNumber else {
            if value == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotNumberError(value: value!)
                throw error
            }
        }
        return number
    }

    public func optionalNumber(_ key: JsonString) throws -> JsonNumber? {
        let value = self[key]
        if let number = value as? JsonNumber {
            return number
        } else if value is JsonNull {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotNumberError(value: value!)
        throw error
    }
    
    public func object(_ key: JsonString) throws -> JsonObject {
        let value = self[key]
        guard let object = value as? JsonObject else {
            if value == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotObjectError(value: value!)
                throw error
            }
        }
        return object
    }

    public func optionalObject(_ key: JsonString) throws -> JsonObject? {
        let value = self[key]
        if let object = value as? JsonObject {
            return object
        } else if value is JsonNull {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotObjectError(value: value!)
        throw error
    }
    
    public func array(_ key: JsonString) throws -> JsonArray {
        let value = self[key]
        guard let array = value as? JsonArray else {
            if value == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotArrayError(value: value!)
                throw error
            }
        }
        return array
    }

    public func optionalArray(_ key: JsonString) throws -> JsonArray? {
        let value = self[key]
        if let array = value as? JsonArray {
            return array
        } else if value is JsonNull {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotArrayError(value: value!)
        throw error
    }
    
    public func boolean(_ key: JsonString) throws -> JsonBoolean {
        let value = self[key]
        guard let boolean = value as? JsonBoolean else {
            if value == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotBooleanError(value: value!)
                throw error
            }
        }
        return boolean
    }

    public func optionalBoolean(_ key: JsonString) throws -> JsonBoolean? {
        let value = self[key]
        if let boolean = value as? JsonBoolean {
            return boolean
        } else if value is JsonNull {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotBooleanError(value: value!)
        throw error
    }
}
