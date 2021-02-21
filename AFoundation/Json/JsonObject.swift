//
//  JsonObject.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonObject = [String: JsonAnyValue]

public extension JsonObject {
    
    // MARK: AnyValue
    
    struct MissingValueError: Error {
        private let object: JsonObject
        private let key: String
        
        init(object: JsonObject, key: String) {
            self.object = object
            self.key = key
        }
    }
    
    private func value(_ key: String) throws -> JsonAnyValue {
        let optionalValue = self[key]
        guard let value = optionalValue else {
            throw MissingValueError(object: self, key: key)
        }
        return value
    }

    // MARK: String
    
    struct NotStringError: Error {
        private let object: JsonObject
        private let key: String
        private let error: Error
        
        init(object: JsonObject, key: String, error: Error) {
            self.object = object
            self.key = key
            self.error = error
        }
    }
    
    func string(_ key: String) throws -> String {
        do {
            let value = try self.value(key)
            let string = try value.string()
            return string
        } catch {
            throw NotStringError(object: self, key: key, error: error)
        }
    }

    func nullableString(_ key: String) throws -> String? {
        let value = try self.value(key)
        guard case .string(let string) = value else {
            if case .null = value {
                return nil
            } else {
                let error = JsonAnyValueIsNotStringError(value: value)
                throw error
            }
        }
        return string
    }
    
    func missableString(_ key: String) throws -> String? {
        guard let value = self[key] else { return nil }
        if case .string(let string) = value { return string }
        throw JsonAnyValueIsNotStringError(value: value)
    }
    
    func missableNullableString(_ key: String) throws -> String? {
        guard let value = self[key] else {
            return nil
        }
        guard case .string(let string) = value else {
            if case .null = value {
                return nil
            } else {
                let error = JsonAnyValueIsNotStringError(value: value)
                throw error
            }
        }
        return string
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
        let value = self[key]
        guard case .number(let number) = value else {
            if value == nil {
                let error = JsonObjectValueIsMissingError(object: self, key: key)
                throw error
            } else {
                let error = JsonAnyValueIsNotNumberError(value: value!)
                throw error
            }
        }
        return number
    }

    func optionalNumber(_ key: String) throws -> Decimal? {
        let value = self[key]
        if case .number(let number) = value {
            return number
        } else if case .null = value {
            return nil
        } else if value == nil {
            let error = JsonObjectValueIsMissingError(object: self, key: key)
            throw error
        }
        let error = JsonAnyValueIsNotNumberError(value: value!)
        throw error
    }
    
    mutating func setNumber(_ number: Decimal, for key: String) {
        self[key] = .number(number)
    }
    
    mutating func setNullableNumber(_ number: Decimal?, for key: String) {
        guard let number = number else {
            self[key] = .null
            return
        }
        self[key] = .number(number)
    }
    
    mutating func setMissableNumber(_ number: Decimal?, for key: String) {
        guard let number = number else {
            self[key] = nil
            return
        }
        self[key] = .number(number)
    }
    
    // MARK: Object
    
    func object(_ key: String) throws -> JsonObject {
        let value = self[key]
        guard case .object(let object) = value else {
            if value == nil {
                let error = JsonObjectValueIsMissingError(object: self, key: key)
                throw error
            } else {
                let error = JsonAnyValueIsNotObjectError(value: value!)
                throw error
            }
        }
        return object
    }

    func optionalObject(_ key: String) throws -> JsonObject? {
        let value = self[key]
        if case .object(let object) = value {
            return object
        } else if case .null = value {
            return nil
        } else if value == nil {
            let error = JsonObjectValueIsMissingError(object: self, key: key)
            throw error
        }
        let error = JsonAnyValueIsNotObjectError(value: value!)
        throw error
    }
    
    mutating func setObject(_ object: JsonObject, for key: String) {
        self[key] = .object(object)
    }
    
    // MARK: Array
    
    func array(_ key: String) throws -> JsonArray {
        let value = self[key]
        guard case .array(let array) = value else {
            if value == nil {
                let error = JsonObjectValueIsMissingError(object: self, key: key)
                throw error
            } else {
                let error = JsonAnyValueIsNotArrayError(value: value!)
                throw error
            }
        }
        return array
    }

    func optionalArray(_ key: String) throws -> JsonArray? {
        let value = self[key]
        if case .array(let array) = value {
            return array
        } else if case .null = value {
            return nil
        } else if value == nil {
            let error = JsonObjectValueIsMissingError(object: self, key: key)
            throw error
        }
        let error = JsonAnyValueIsNotArrayError(value: value!)
        throw error
    }
    
    mutating func setArray(_ array: JsonArray, for key: String) {
        self[key] = .array(array)
    }
    
    // MARK: Boolean
    
    func boolean(_ key: String) throws -> Bool {
        let value = self[key]
        guard case .boolean(let bool) = value else {
            if value == nil {
                let error = JsonObjectValueIsMissingError(object: self, key: key)
                throw error
            } else {
                let error = JsonAnyValueIsNotBooleanError(value: value!)
                throw error
            }
        }
        return bool
    }

    func optionalBoolean(_ key: String) throws -> Bool? {
        let value = self[key]
        if case .boolean(let bool) = value {
            return bool
        } else if case .null = value {
            return nil
        } else if value == nil {
            let error = JsonObjectValueIsMissingError(object: self, key: key)
            throw error
        }
        let error = JsonAnyValueIsNotBooleanError(value: value!)
        throw error
    }
    
    mutating func setBoolean(_ boolean: Bool, for key: String) {
        self[key] = .boolean(boolean)
    }
    
    mutating func setNullableBoolean(_ boolean: Bool?, for key: String) {
        guard let boolean = boolean else {
            self[key] = .null
            return
        }
        self[key] = .boolean(boolean)
    }
    
    mutating func setMissableBoolean(_ boolean: Bool?, for key: String) {
        guard let boolean = boolean else {
            self[key] = nil
            return
        }
        self[key] = .boolean(boolean)
    }
}

public struct JsonObjectValueIsMissingError: LocalizedError {
    
    let object: JsonObject
    let key: String
    
    init(object: JsonObject, key: String) {
        self.object = object
        self.key = key
    }
    
}


public struct JsonAnyValueIsNotStringError: Error {
    
    private let value: JsonAnyValue
    
    init(value: JsonAnyValue) {
        self.value = value
    }
    
}

public struct JsonAnyValueIsNotNullableStringError: Error {
    
    private let value: JsonAnyValue
    
    init(value: JsonAnyValue) {
        self.value = value
    }
    
}

public struct JsonAnyValueIsNotNumberError: LocalizedError {
    
    private let value: JsonAnyValue
    
    init(value: JsonAnyValue) {
        self.value = value
    }
    
}

public struct JsonAnyValueIsNotObjectError: LocalizedError {
    
    private let value: JsonAnyValue
    
    init(value: JsonAnyValue) {
        self.value = value
    }
    
}

public struct JsonAnyValueIsNotArrayError: LocalizedError {
    
    private let value: JsonAnyValue
    
    init(value: JsonAnyValue) {
        self.value = value
    }
    
}

public struct JsonAnyValueIsNotBooleanError: LocalizedError {
    
    private let value: JsonAnyValue
    
    init(value: JsonAnyValue) {
        self.value = value
    }
    
}
