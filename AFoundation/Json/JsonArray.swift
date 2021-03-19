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
    private struct NotStringsError: Error, CustomDebugStringConvertible {
        let array: JsonArray
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: array)) is not strings array\n\(String(reflecting: error))"
        }
    }
    
    func nullableStrings() throws -> [String?] {
        let strings: [String?]
        do { strings = try map({ try $0.nullableString() }) } catch {
            throw NotNullableStringsError(array: self, error: error)
        }
        return strings
    }
    private struct NotNullableStringsError: Error, CustomDebugStringConvertible {
        let array: JsonArray
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: array)) is not nullable strings array\n\(String(reflecting: error))"
        }
    }
    
    mutating func insertString(_ newString: String, at i: Int) {
        insert(.string(newString), at: i)
    }
    
    mutating func insertNullableString(_ newString: String?, at i: Int) {
        if let newString = newString { insert(.string(newString), at: i) }
        else { insert(.null, at: i) }
    }
    
    mutating func insertMissableString(_ newString: String?, at i: Int) {
        if let newString = newString { insert(.string(newString), at: i) }
    }
    
    mutating func appendString(_ string: String) {
        append(.string(string))
    }
    
    mutating func appendNullableString(_ string: String?) {
        if let string = string { append(.string(string)) }
        else { append(.null) }
    }
    
    mutating func appendMissableString(_ string: String?) {
        if let string = string { append(.string(string)) }
    }
    
    // MARK: Numbers
    
    func numbers() throws -> [Decimal] {
        let numbers: [Decimal]
        do { numbers = try map({ try $0.number() }) } catch {
            throw NotNumbersError(array: self, error: error)
        }
        return numbers
    }
    private struct NotNumbersError: Error, CustomDebugStringConvertible {
        let array: JsonArray
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: array)) is not numbers array\n\(String(reflecting: error))"
        }
    }
    
    func nullableNumbers() throws -> [Decimal?] {
        let numbers: [Decimal?]
        do { numbers = try map({ try $0.nullableNumber() }) } catch {
            throw NotNullableNumbersError(array: self, error: error)
        }
        return numbers
    }
    private struct NotNullableNumbersError: Error, CustomDebugStringConvertible {
        let array: JsonArray
        let error: Error
        var debugDescription: String {
            return "\(String(reflecting: array)) is not nullable numbers array\n\(String(reflecting: error))"
        }
    }
    
    mutating func insertNumber(_ newNumber: Decimal, at i: Int) {
        insert(.number(newNumber), at: i)
    }
    
    mutating func insertNullableNumber(_ newNumber: Decimal?, at i: Int) {
        if let newNumber = newNumber { insert(.number(newNumber), at: i) }
        else { insert(.null, at: i) }
    }
    
    mutating func insertMissableNumber(_ newNumber: Decimal?, at i: Int) {
        if let newNumber = newNumber { insert(.number(newNumber), at: i) }
    }
    
    mutating func appendNumber(_ number: Decimal) {
        append(.number(number))
    }
    
    mutating func appendNullableNumber(_ number: Decimal?) {
        if let number = number { append(.number(number)) }
        else { append(.null) }
    }
    
    mutating func appendMissableNumber(_ number: Decimal?) {
        if let number = number { append(.number(number)) }
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
    
    mutating func insertObject(_ newObject: JsonObject, at i: Int) {
        insert(.object(newObject), at: i)
    }
    
    mutating func insertNullableObject(_ newObject: JsonObject?, at i: Int) {
        if let newObject = newObject { insert(.object(newObject), at: i) }
        else { insert(.null, at: i) }
    }
    
    mutating func insertMissableObject(_ newObject: JsonObject?, at i: Int) {
        if let newObject = newObject { insert(.object(newObject), at: i) }
    }
    
    mutating func appendObject(_ object: JsonObject) {
        append(.object(object))
    }
    
    mutating func appendNullableObject(_ object: JsonObject?) {
        if let object = object { append(.object(object)) }
        else { append(.null) }
    }
    
    mutating func appendMissableObject(_ object: JsonObject?) {
        if let object = object { append(.object(object)) }
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
    
    mutating func insertArray(_ newArray: JsonArray, at i: Int) {
        insert(.array(newArray), at: i)
    }
    
    mutating func insertNullableArray(_ newArray: JsonArray?, at i: Int) {
        if let newArray = newArray { insert(.array(newArray), at: i) }
        else { insert(.null, at: i) }
    }
    
    mutating func insertMissableArray(_ newArray: JsonArray?, at i: Int) {
        if let newArray = newArray { insert(.array(newArray), at: i) }
    }
    
    mutating func appendArray(_ array: JsonArray) {
        append(.array(array))
    }
    
    mutating func appendNullableArray(_ array: JsonArray?) {
        if let array = array { append(.array(array)) }
        else { append(.null) }
    }
    
    mutating func appendMissableArray(_ array: JsonArray?) {
        if let array = array { append(.array(array)) }
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
    
    mutating func insertBoolean(_ newBoolean: Bool, at i: Int) {
        insert(.boolean(newBoolean), at: i)
    }
    
    mutating func insertNullableBoolean(_ newBoolean: Bool?, at i: Int) {
        if let newBoolean = newBoolean { insert(.boolean(newBoolean), at: i) }
        else { insert(.null, at: i) }
    }
    
    mutating func insertMissableBoolean(_ newBoolean: Bool?, at i: Int) {
        if let newBoolean = newBoolean { insert(.boolean(newBoolean), at: i) }
    }
    
    mutating func appendBoolean(_ boolean: Bool) {
        append(.boolean(boolean))
    }
    
    mutating func appendNullableBoolean(_ boolean: Bool?) {
        if let boolean = boolean { append(.boolean(boolean)) }
        else { append(.null) }
    }
    
    mutating func appendMissableBoolean(_ boolean: Bool?) {
        if let boolean = boolean { append(.boolean(boolean)) }
    }
}

