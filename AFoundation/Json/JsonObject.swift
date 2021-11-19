//
//  JsonObject.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonObject = [String: JsonValue]

public extension JsonObject {
    
    func hasKey(_ key: String) -> Bool {
        let hasKey = self[key] != nil
        return hasKey
    }
    
    // MARK: Value
    
    func value(_ key: String) throws -> JsonValue {
        if let value = self[key] { return value }
        else { throw Error("Cannot get \(String(reflecting: JsonValue.self)) for key \(String(reflecting: key)) in \(String(reflecting: self))") }
    }

    // MARK: String
    
    func string(_ key: String) throws -> String {
        do {
            let value = try self.value(key)
            let string = try value.string()
            return string
        } catch {
            throw Error("Cannot get \(String(reflecting: String.self)) for key \(String(reflecting: key)) in \(String(reflecting: self))\n\(String(reflecting: error))")
        }
    }

    func nullableString(_ key: String) throws -> String? {
        do {
            let value = try self.value(key)
            let string = try value.nullableString()
            return string
        } catch {
            throw Error("Cannot get \(String(reflecting: String?.self)) for key \(String(reflecting: key)) in \(String(reflecting: self))\n\(String(reflecting: error))")
        }
    }
    
    func missableString(_ key: String) throws -> String? {
        do {
            guard let value = self[key] else { return nil }
            let string: String = try value.string()
            return string
        } catch {
            throw Error("Cannot get \(String(reflecting: String?.self)) for key \(String(reflecting: key)) in \(String(reflecting: self))\n\(String(reflecting: error))")
        }
    }
    
    func missableNullableString(_ key: String) throws -> String? {
        guard let value = self[key] else { return nil }
        let string: String?
        do { string = try value.nullableString() } catch {
            throw Error("Cannot get \(String(reflecting: String?.self)) for key \(String(reflecting: key)) in \(String(reflecting: self))\n\(String(reflecting: error))")
        }
        return string
    }
    
    mutating func setString(_ string: String, for key: String) {
        self[key] = .string(string)
    }
    
    mutating func setNullableString(_ string: String?, for key: String) {
        if let string = string { self[key] = .string(string) }
        else { self[key] = .null }
    }
    
    mutating func setMissableString(_ string: String?, for key: String) {
        if let string = string { self[key] = .string(string) }
    }
    
    // MARK: Number
    
    func number(_ key: String) throws -> Decimal {
        do {
            let value = try self.value(key)
            let number = try value.number()
            return number
        } catch {
            throw Error("\(String(reflecting: self)) does not have number for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
    }

    func nullableNumber(_ key: String) throws -> Decimal? {
        do {
            let value = try self.value(key)
            let number = try value.nullableNumber()
            return number
        } catch {
            throw Error("\(String(reflecting: self)) does not have number or null for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
    }
    
    func missableNumber(_ key: String) throws -> Decimal? {
        guard let value = self[key] else { return nil }
        let number: Decimal
        do { number = try value.number() } catch {
            throw Error("\(String(reflecting: self)) does not have number for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
        return number
    }
    
    func missableNullableNumber(_ key: String) throws -> Decimal? {
        guard let value = self[key] else { return nil }
        let number: Decimal?
        do { number = try value.nullableNumber() } catch {
            throw Error("\(String(reflecting: self)) does not have number or null for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
        return number
    }
    
    mutating func setNumber(_ decimal: Decimal, for key: String) {
        self[key] = .number(decimal)
    }
    
    mutating func setNullableNumber(_ decimal: Decimal?, for key: String) {
        if let decimal = decimal { self[key] = .number(decimal) }
        else { self[key] = .null }
    }
    
    // MARK: Object
    
    func object(_ key: String) throws -> JsonObject {
        do {
            let value = try self.value(key)
            let object = try value.object()
            return object
        } catch {
            throw Error("\(String(reflecting: self)) does not have object for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
    }

    func nullableObject(_ key: String) throws -> JsonObject? {
        do {
            let value = try self.value(key)
            let object = try value.nullableObject()
            return object
        } catch {
            throw Error("\(String(reflecting: self)) does not have object or null for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
    }
    
    func missableObject(_ key: String) throws -> JsonObject? {
        guard let value = self[key] else { return nil }
        let object: JsonObject
        do { object = try value.object() } catch {
            throw Error("\(String(reflecting: self)) does not have object for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
        return object
    }
    
    func missableNullableObject(_ key: String) throws -> JsonObject? {
        guard let value = self[key] else { return nil }
        let object: JsonObject?
        do { object = try value.nullableObject() } catch {
            throw Error("\(String(reflecting: self)) does not have object or null for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
        return object
    }
    
    mutating func setObject(_ object: JsonObject, for key: String) {
        self[key] = .object(object)
    }
    
    mutating func setNullableObject(_ object: JsonObject?, for key: String) {
        if let object = object { self[key] = .object(object) }
        else { self[key] = .null }
    }
    
    // MARK: Array
    
    func array(_ key: String) throws -> JsonArray {
        do {
            let value = try self.value(key)
            let array = try value.array()
            return array
        } catch {
            throw Error("\(String(reflecting: self)) does not have array for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
    }

    func nullableArray(_ key: String) throws -> JsonArray? {
        do {
            let value = try self.value(key)
            let array = try value.nullableArray()
            return array
        } catch {
            throw Error("\(String(reflecting: self)) does not have array or null for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
    }
    
    func missableArray(_ key: String) throws -> JsonArray? {
        guard let value = self[key] else { return nil }
        let array: JsonArray
        do { array = try value.array() } catch {
            throw Error("\(String(reflecting: self)) does not have array for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
        return array
    }
    
    func missableNullableArray(_ key: String) throws -> JsonArray? {
        guard let value = self[key] else { return nil }
        let array: JsonArray?
        do { array = try value.nullableArray() } catch {
            throw Error("\(String(reflecting: self)) does not have array or null for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
        return array
    }
    
    mutating func setArray(_ array: JsonArray, for key: String) {
        self[key] = .array(array)
    }
    
    mutating func setNullableArray(_ array: JsonArray?, for key: String) {
        if let array = array { self[key] = .array(array) }
        else { self[key] = .null }
    }
    
    // MARK: Boolean
    
    func boolean(_ key: String) throws -> Bool {
        do {
            let value = try self.value(key)
            let bool = try value.boolean()
            return bool
        } catch {
            throw Error("\(String(reflecting: object)) does not have boolean for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
    }

    func nullableBoolean(_ key: String) throws -> Bool? {
        do {
            let value = try self.value(key)
            let bool = try value.nullableBoolean()
            return bool
        } catch {
            throw Error("\(String(reflecting: object)) does not have boolean or null for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
    }
    
    func missableBoolean(_ key: String) throws -> Bool? {
        guard let value = self[key] else { return nil }
        let bool: Bool
        do { bool = try value.boolean() } catch {
            throw Error("\(String(reflecting: object)) does not have boolean for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
        return bool
    }
    
    func missableNullableBoolean(_ key: String) throws -> Bool? {
        guard let value = self[key] else { return nil }
        let bool: Bool?
        do { bool = try value.nullableBoolean() } catch {
            throw Error("\(String(reflecting: object)) does not have boolean or null for key \(String(reflecting: key))\n\(String(reflecting: error))")
        }
        return bool
    }
    
    mutating func setBoolean(_ bool: Bool, for key: String) {
        self[key] = .boolean(bool)
    }
    
    mutating func setNullableBoolean(_ bool: Bool?, for key: String) {
        if let bool = bool { self[key] = .boolean(bool) }
        else { self[key] = .null }
    }
    
}
