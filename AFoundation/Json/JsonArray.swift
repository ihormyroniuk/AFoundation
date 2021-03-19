//
//  JsonArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonArray =  [JsonValue]

public extension JsonArray {
    
    // MARK: Strings
    
    func strings() throws -> [String] {
        let strings: [String]
        do { strings = try map({ try $0.string() }) } catch {
            throw NotStringsError(array: self, error: error)
        }
        return strings
    }
    private struct NotStringsError: Error, LocalizedError {
        let array: JsonArray
        let error: Error
        
        var errorDescription: String? {
            return "\(String(reflecting: Self.self))\n\(String(reflecting: array)) is not strings array\nError: \(String(reflecting: error))"
        }
    }
    
    func nullableStrings() throws -> [String?] {
        let strings: [String?]
        do { strings = try map({ try $0.nullableString() }) } catch {
            throw NotNullableStringsError(array: self, error: error)
        }
        return strings
    }
    private struct NotNullableStringsError: Error, LocalizedError {
        let array: JsonArray
        let error: Error
        
        var errorDescription: String? {
            return "\(String(reflecting: Self.self))\n\(String(reflecting: array)) is not nullable strings array\nError: \(String(reflecting: error))"
        }
    }
    
    mutating func appendString(_ string: String) {
        append(.string(string))
    }
    
    mutating func appendNullableString(_ string: String?) {
        guard let string = string else {
            append(JsonValue.null)
            return
        }
        append(.string(string))
    }
    
    mutating func setMissableString(_ string: String?) {
        guard let string = string else {
            return
        }
        append(.string(string))
    }
    
    // MARK: Numbers
    
    func numbers() throws -> [Decimal] {
        let numbers: [Decimal]
        do { numbers = try map({ try $0.number() }) } catch {
            throw NotNumbersError(array: self, error: error)
        }
        return numbers
    }
    private struct NotNumbersError: Error, LocalizedError {
        let array: JsonArray
        let error: Error
        
        var errorDescription: String? {
            return "\(String(reflecting: Self.self))\n\(String(reflecting: array)) is not strings array\nError: \(String(reflecting: error))"
        }
    }
    
    func nullableNumbers() throws -> [Decimal?] {
        let numbers: [Decimal?]
        do { numbers = try map({ try $0.nullableNumber() }) } catch {
            throw NotNullableNumbersError(array: self, error: error)
        }
        return numbers
    }
    private struct NotNullableNumbersError: Error, LocalizedError {
        let array: JsonArray
        let error: Error
        
        var errorDescription: String? {
            return "\(String(reflecting: Self.self))\n\(String(reflecting: array)) is not nullable strings array\nError: \(String(reflecting: error))"
        }
    }
    
    // MARK: Objects
    
    func objects() throws -> [JsonObject] {
        let objects: [JsonObject]
        do { objects = try map({ try $0.object() }) } catch {
            throw NotObjectsError(array: self, error: error)
        }
        return objects
    }
    private struct NotObjectsError: Error, LocalizedError {
        let array: JsonArray
        let error: Error
        
        var errorDescription: String? {
            return "\(String(reflecting: Self.self))\n\(String(reflecting: array)) is not strings array\nError: \(String(reflecting: error))"
        }
    }
    
    func nullableObjects() throws -> [JsonObject?] {
        let objects: [JsonObject?]
        do { objects = try map({ try $0.nullableObject() }) } catch {
            throw NotNullableObjectsError(array: self, error: error)
        }
        return objects
    }
    private struct NotNullableObjectsError: Error, LocalizedError {
        let array: JsonArray
        let error: Error
        
        var errorDescription: String? {
            return "\(String(reflecting: Self.self))\n\(String(reflecting: array)) is not nullable strings array\nError: \(String(reflecting: error))"
        }
    }
    
    // MARK: Arrays
    
    func arrays() throws -> [JsonArray] {
        let arrays: [JsonArray]
        do { arrays = try map({ try $0.array() }) } catch {
            throw NotArraysError(array: self, error: error)
        }
        return arrays
    }
    private struct NotArraysError: Error, LocalizedError {
        let array: JsonArray
        let error: Error
        
        var errorDescription: String? {
            return "\(String(reflecting: Self.self))\n\(String(reflecting: array)) is not strings array\nError: \(String(reflecting: error))"
        }
    }
    
    func nullableArrays() throws -> [JsonArray?] {
        let arrays: [JsonArray?]
        do { arrays = try map({ try $0.nullableArray() }) } catch {
            throw NotNullableArraysError(array: self, error: error)
        }
        return arrays
    }
    private struct NotNullableArraysError: Error, LocalizedError {
        let array: JsonArray
        let error: Error
        
        var errorDescription: String? {
            return "\(String(reflecting: Self.self))\n\(String(reflecting: array)) is not nullable strings array\nError: \(String(reflecting: error))"
        }
    }
    
    // MARK: Booleans
    
    func booleans() throws -> [Bool] {
        let booleans: [Bool]
        do { booleans = try map({ try $0.boolean() }) } catch {
            throw NotBooleansError(array: self, error: error)
        }
        return booleans
    }
    private struct NotBooleansError: Error, LocalizedError {
        let array: JsonArray
        let error: Error
        
        var errorDescription: String? {
            return "\(String(reflecting: Self.self))\n\(String(reflecting: array)) is not strings array\nError: \(String(reflecting: error))"
        }
    }
    
    func nullableBooleans() throws -> [Bool?] {
        let booleans: [Bool?]
        do { booleans = try map({ try $0.nullableBoolean() }) } catch {
            throw NotNullableBooleansError(array: self, error: error)
        }
        return booleans
    }
    private struct NotNullableBooleansError: Error, LocalizedError {
        let array: JsonArray
        let error: Error
        
        var errorDescription: String? {
            return "\(String(reflecting: Self.self))\n\(String(reflecting: array)) is not nullable strings array\nError: \(String(reflecting: error))"
        }
    }
    
}

