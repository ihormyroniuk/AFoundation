//
//  JsonObject.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct JsonObject: Equatable, Hashable, ExpressibleByDictionaryLiteral {
    
    public var dictionary: [JsonString: JsonValueContainer]
    
    public init(dictionary: [JsonString: JsonValueContainer]) {
        self.dictionary = dictionary
    }
    
    // MARK: ExpressibleByDictionaryLiteral
    
    public typealias Key = JsonString
    
    public typealias Value = JsonValueContainer
    
    public init(dictionaryLiteral elements: (JsonString, JsonValueContainer)...) {
        var dictionary: [JsonString: JsonValueContainer] = [:]
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
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(dictionary)
    }
    
    public subscript(index: JsonString) -> JsonValueContainer? {
        get {
            return dictionary[index]
        }
        set(newValue) {
            dictionary[index] = newValue
        }
    }
    
    public func value(_ key: JsonString) throws -> JsonValueContainer {
        let optionalValue = self[key]
        guard let value = optionalValue else {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        return value
    }
    
    public func string(_ key: JsonString) throws -> JsonString {
        let value = self[key]
        guard case .string(let string) = value else {
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
    
    public mutating func setString(_ string: JsonString, for key: JsonString) {
        dictionary[key] = .string(string)
    }

    public func optionalString(_ key: JsonString) throws -> JsonString? {
        let value = self[key]
        if case .string(let string) = value {
            return string
        } else if case .null = value {
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
        guard case .number(let number) = value else {
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
    
    public mutating func setNumber(_ number: JsonNumber, for key: JsonString) {
        dictionary[key] = .number(number)
    }

    public func optionalNumber(_ key: JsonString) throws -> JsonNumber? {
        let value = self[key]
        if case .number(let number) = value {
            return number
        } else if case .null = value {
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
        guard case .object(let object) = value else {
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
    
    public mutating func setObject(_ object: JsonObject, for key: JsonString) {
        dictionary[key] = .object(object)
    }

    public func optionalObject(_ key: JsonString) throws -> JsonObject? {
        let value = self[key]
        if case .object(let object) = value {
            return object
        } else if case .null = value {
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
        guard case .array(let array) = value else {
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
        if case .array(let array) = value {
            return array
        } else if case .null = value {
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
        guard case .boolean(let boolean) = value else {
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
        if case .boolean(let boolean) = value {
            return boolean
        } else if case .null = value {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotBooleanError(value: value!)
        throw error
    }
    
    public mutating func setBoolean(_ boolean: JsonBoolean, for key: JsonString) {
        dictionary[key] = .boolean(boolean)
    }
}
