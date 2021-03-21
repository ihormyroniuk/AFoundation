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
    
    // MARK: Value
    
    func value(_ key: String) throws -> JsonValue {
        if let value = self[key] { return value }
        else { throw MissingValueError(object: self, key: key) }
    }
    private struct MissingValueError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have value for key \(String(reflecting: key))"
        }
    }

    // MARK: String
    
    func string(_ key: String) throws -> String {
        do {
            let value = try self.value(key)
            let string = try value.string()
            return string
        } catch {
            throw NotStringError(object: self, key: key, error: error)
        }
    }
    private struct NotStringError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have string for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }

    func nullableString(_ key: String) throws -> String? {
        do {
            let value = try self.value(key)
            let string = try value.nullableString()
            return string
        } catch {
            throw NotNullableStringError(object: self, key: key, error: error)
        }
    }
    private struct NotNullableStringError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have string or null for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    func missableString(_ key: String) throws -> String? {
        guard let value = self[key] else { return nil }
        let string: String
        do { string = try value.string() } catch {
            throw NotMissableStringError(object: self, key: key, error: error)
        }
        return string
    }
    private struct NotMissableStringError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have string for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    func missableNullableString(_ key: String) throws -> String? {
        guard let value = self[key] else { return nil }
        let string: String?
        do { string = try value.nullableString() } catch {
            throw NotMissableNullableStringError(object: self, key: key, error: error)
        }
        return string
    }
    private struct NotMissableNullableStringError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have string or null for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    mutating func setString(_ string: String, for key: String) {
        self[key] = .string(string)
    }
    
    mutating func setNullableString(_ string: String?, for key: String) {
        guard let string = string else {
            self[key] = .null
            return
        }
        self[key] = .string(string)
    }
    
    mutating func setMissableString(_ string: String?, for key: String) {
        guard let string = string else {
            self[key] = nil
            return
        }
        self[key] = .string(string)
    }
    
    // MARK: Number
    
    func number(_ key: String) throws -> Decimal {
        do {
            let value = try self.value(key)
            let number = try value.number()
            return number
        } catch {
            throw NotNumberError(object: self, key: key, error: error)
        }
    }
    private struct NotNumberError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have number for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }

    func nullableNumber(_ key: String) throws -> Decimal? {
        do {
            let value = try self.value(key)
            let number = try value.nullableNumber()
            return number
        } catch {
            throw NotNullableNumberError(object: self, key: key, error: error)
        }
    }
    private struct NotNullableNumberError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have number or null for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    func missableNumber(_ key: String) throws -> Decimal? {
        guard let value = self[key] else { return nil }
        let number: Decimal
        do { number = try value.number() } catch {
            throw NotMissableNumberError(object: self, key: key, error: error)
        }
        return number
    }
    private struct NotMissableNumberError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have number for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    func missableNullableNumber(_ key: String) throws -> Decimal? {
        guard let value = self[key] else { return nil }
        let number: Decimal?
        do { number = try value.nullableNumber() } catch {
            throw NotMissableNullableNumberError(object: self, key: key, error: error)
        }
        return number
    }
    private struct NotMissableNullableNumberError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have number or null for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    mutating func setNumber(_ decimal: Decimal, for key: String) {
        self[key] = .number(decimal)
    }
    
    mutating func setNullableNumber(_ decimal: Decimal?, for key: String) {
        guard let decimal = decimal else {
            self[key] = .null
            return
        }
        self[key] = .number(decimal)
    }
    
    mutating func setMissableNumber(_ decimal: Decimal?, for key: String) {
        guard let decimal = decimal else {
            self[key] = nil
            return
        }
        self[key] = .number(decimal)
    }
    
    // MARK: Object
    
    func object(_ key: String) throws -> JsonObject {
        do {
            let value = try self.value(key)
            let object = try value.object()
            return object
        } catch {
            throw NotObjectError(object: self, key: key, error: error)
        }
    }
    private struct NotObjectError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have object for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }

    func nullableObject(_ key: String) throws -> JsonObject? {
        do {
            let value = try self.value(key)
            let object = try value.nullableObject()
            return object
        } catch {
            throw NotNullableObjectError(object: self, key: key, error: error)
        }
    }
    private struct NotNullableObjectError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have object or null for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    func missableObject(_ key: String) throws -> JsonObject? {
        guard let value = self[key] else { return nil }
        let object: JsonObject
        do { object = try value.object() } catch {
            throw NotMissableObjectError(object: self, key: key, error: error)
        }
        return object
    }
    private struct NotMissableObjectError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have object for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    func missableNullableObject(_ key: String) throws -> JsonObject? {
        guard let value = self[key] else { return nil }
        let object: JsonObject?
        do { object = try value.nullableObject() } catch {
            throw NotMissableNullableObjectError(object: self, key: key, error: error)
        }
        return object
    }
    private struct NotMissableNullableObjectError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have object or null for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    mutating func setObject(_ object: JsonObject, for key: String) {
        self[key] = .object(object)
    }
    
    mutating func setNullableObject(_ object: JsonObject?, for key: String) {
        if let object = object { self[key] = .object(object) }
        else { self[key] = .null }
    }
    
    mutating func setMissableObject(_ object: JsonObject?, for key: String) {
        if let object = object { self[key] = .object(object) }
        else { self[key] = nil }
    }
    
    // MARK: Array
    
    func array(_ key: String) throws -> JsonArray {
        do {
            let value = try self.value(key)
            let array = try value.array()
            return array
        } catch {
            throw NotArrayError(object: self, key: key, error: error)
        }
    }
    private struct NotArrayError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have array for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }

    func nullableArray(_ key: String) throws -> JsonArray? {
        do {
            let value = try self.value(key)
            let array = try value.nullableArray()
            return array
        } catch {
            throw NotNullableArrayError(object: self, key: key, error: error)
        }
    }
    private struct NotNullableArrayError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have array or null for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    func missableArray(_ key: String) throws -> JsonArray? {
        guard let value = self[key] else { return nil }
        let array: JsonArray
        do { array = try value.array() } catch {
            throw NotMissableArrayError(object: self, key: key, error: error)
        }
        return array
    }
    private struct NotMissableArrayError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have array for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    func missableNullableArray(_ key: String) throws -> JsonArray? {
        guard let value = self[key] else { return nil }
        let array: JsonArray?
        do { array = try value.nullableArray() } catch {
            throw NotMissableNullableArrayError(object: self, key: key, error: error)
        }
        return array
    }
    private struct NotMissableNullableArrayError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have array or null for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    mutating func setArray(_ array: JsonArray, for key: String) {
        self[key] = .array(array)
    }
    
    mutating func setNullableArray(_ array: JsonArray?, for key: String) {
        if let array = array { self[key] = .array(array) }
        else { self[key] = .null }
    }
    
    mutating func setMissableArray(_ array: JsonArray?, for key: String) {
        if let array = array { self[key] = .array(array) }
        else { self[key] = nil }
    }
    
    // MARK: Boolean
    
    func boolean(_ key: String) throws -> Bool {
        do {
            let value = try self.value(key)
            let bool = try value.boolean()
            return bool
        } catch {
            throw NotBooleanError(object: self, key: key, error: error)
        }
    }
    private struct NotBooleanError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have boolean for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }

    func nullableBoolean(_ key: String) throws -> Bool? {
        do {
            let value = try self.value(key)
            let bool = try value.nullableBoolean()
            return bool
        } catch {
            throw NotNullableBooleanError(object: self, key: key, error: error)
        }
    }
    private struct NotNullableBooleanError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have boolean or null for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    func missableBoolean(_ key: String) throws -> Bool? {
        guard let value = self[key] else { return nil }
        let bool: Bool
        do { bool = try value.boolean() } catch {
            throw NotMissableBooleanError(object: self, key: key, error: error)
        }
        return bool
    }
    private struct NotMissableBooleanError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have boolean for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    func missableNullableBoolean(_ key: String) throws -> Bool? {
        guard let value = self[key] else { return nil }
        let bool: Bool?
        do { bool = try value.nullableBoolean() } catch {
            throw NotMissableNullableBooleanError(object: self, key: key, error: error)
        }
        return bool
    }
    private struct NotMissableNullableBooleanError: Error, CustomDebugStringConvertible {
        let object: JsonObject
        let key: String
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: object)) does not have boolean or null for key \(String(reflecting: key))\n\(String(reflecting: error))"
        }
    }
    
    mutating func setBoolean(_ bool: Bool, for key: String) {
        self[key] = .boolean(bool)
    }
    
    mutating func setNullableBoolean(_ bool: Bool?, for key: String) {
        if let bool = bool { self[key] = .boolean(bool) }
        else { self[key] = .null }
    }
    
    mutating func setMissableBoolean(_ bool: Bool?, for key: String) {
        if let bool = bool { self[key] = .boolean(bool) }
        else { self[key] = nil }
    }
}
