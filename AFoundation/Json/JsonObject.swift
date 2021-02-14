//
//  JsonObject.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonObject = [String: JsonValue]

extension Dictionary where Key == String, Value == JsonValue {
    
    public func value(_ key: String) throws -> JsonValue {
        let optionalValue = self[key]
        guard let value = optionalValue else {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        return value
    }
    
    public func string(_ key: String) throws -> String {
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
    
    public mutating func setString(_ string: String, for key: String) {
        self[key] = .string(string)
    }

    public func optionalString(_ key: String) throws -> String? {
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
    
    public func number(_ key: String) throws -> Decimal {
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
    
    public mutating func setNumber(_ number: Decimal, for key: String) {
        self[key] = .number(number)
    }

    public func optionalNumber(_ key: String) throws -> Decimal? {
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
    
    public func object(_ key: String) throws -> JsonObject {
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
    
    public mutating func setObject(_ object: JsonObject, for key: String) {
        self[key] = .object(object)
    }

    public func optionalObject(_ key: String) throws -> JsonObject? {
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
    
    public func array(_ key: String) throws -> JsonArray {
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

    public func optionalArray(_ key: String) throws -> JsonArray? {
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
    
    public func boolean(_ key: String) throws -> Bool {
        let value = self[key]
        guard case .boolean(let bool) = value else {
            if value == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotBooleanError(value: value!)
                throw error
            }
        }
        return bool
    }

    public func optionalBoolean(_ key: String) throws -> Bool? {
        let value = self[key]
        if case .boolean(let bool) = value {
            return bool
        } else if case .null = value {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotBooleanError(value: value!)
        throw error
    }
    
    public mutating func setBoolean(_ boolean: Bool, for key: String) {
        self[key] = .boolean(boolean)
    }
}

public struct JsonErrorValueMissing: LocalizedError {
    
    let object: JsonObject
    let key: String
    
    init(object: JsonObject, key: String) {
        self.object = object
        self.key = key
    }
    
}
