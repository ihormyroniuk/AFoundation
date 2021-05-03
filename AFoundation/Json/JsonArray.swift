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
    
    init(_ strings: [String]) {
        self = strings.map({ .string($0) })
    }
    
    func strings() throws -> [String] {
        let strings: [String]
        do { strings = try map({ try $0.string() }) } catch {
            throw MessageError("\(String(reflecting: self)) is not strings array\n\(String(reflecting: error))")
        }
        return strings
    }
    
    func nullableStrings() throws -> [String?] {
        let strings: [String?]
        do { strings = try map({ try $0.nullableString() }) } catch {
            throw MessageError("\(String(reflecting: self)) is not nullable strings array\n\(String(reflecting: error))")
        }
        return strings
    }
    
    mutating func insertString(_ newString: String, at i: Int) {
        insert(.string(newString), at: i)
    }
    
    mutating func insertNullableString(_ newString: String?, at i: Int) {
        if let newString = newString { insert(.string(newString), at: i) }
        else { insert(.null, at: i) }
    }
    
    mutating func appendString(_ string: String) {
        append(.string(string))
    }
    
    mutating func appendNullableString(_ string: String?) {
        if let string = string { append(.string(string)) }
        else { append(.null) }
    }
    
    // MARK: Numbers
    
    init(_ decimals: [Decimal]) {
        self = decimals.map({ .number($0) })
    }
    
    func numbers() throws -> [Decimal] {
        let numbers: [Decimal]
        do { numbers = try map({ try $0.number() }) } catch {
            throw MessageError("\(String(reflecting: self)) is not numbers array\n\(String(reflecting: error))")
        }
        return numbers
    }
    
    func nullableNumbers() throws -> [Decimal?] {
        let numbers: [Decimal?]
        do { numbers = try map({ try $0.nullableNumber() }) } catch {
            throw MessageError("\(String(reflecting: self)) is not nullable numbers array\n\(String(reflecting: error))")
        }
        return numbers
    }
    
    mutating func insertNumber(_ newNumber: Decimal, at i: Int) {
        insert(.number(newNumber), at: i)
    }
    
    mutating func insertNullableNumber(_ newNumber: Decimal?, at i: Int) {
        if let newNumber = newNumber { insert(.number(newNumber), at: i) }
        else { insert(.null, at: i) }
    }
    
    mutating func appendNumber(_ number: Decimal) {
        append(.number(number))
    }
    
    mutating func appendNullableNumber(_ number: Decimal?) {
        if let number = number { append(.number(number)) }
        else { append(.null) }
    }
    
    // MARK: Objects
    
    init(_ jsonObjects: [JsonObject]) {
        self = jsonObjects.map({ .object($0) })
    }
    
    func objects() throws -> [JsonObject] {
        let objects: [JsonObject]
        do { objects = try map({ try $0.object() }) } catch {
            throw MessageError("\(String(reflecting: self)) is not strings array\nError: \(String(reflecting: error))")
        }
        return objects
    }
    
    func nullableObjects() throws -> [JsonObject?] {
        let objects: [JsonObject?]
        do { objects = try map({ try $0.nullableObject() }) } catch {
            throw MessageError("\(String(reflecting: self)) is not nullable strings array\nError: \(String(reflecting: error))")
        }
        return objects
    }
    
    mutating func insertObject(_ newObject: JsonObject, at i: Int) {
        insert(.object(newObject), at: i)
    }
    
    mutating func insertNullableObject(_ newObject: JsonObject?, at i: Int) {
        if let newObject = newObject { insert(.object(newObject), at: i) }
        else { insert(.null, at: i) }
    }
    
    mutating func appendObject(_ object: JsonObject) {
        append(.object(object))
    }
    
    mutating func appendNullableObject(_ object: JsonObject?) {
        if let object = object { append(.object(object)) }
        else { append(.null) }
    }
    
    // MARK: Arrays
    
    init(_ jsonArrays: [JsonArray]) {
        self = jsonArrays.map({ .array($0) })
    }
    
    func arrays() throws -> [JsonArray] {
        let arrays: [JsonArray]
        do { arrays = try map({ try $0.array() }) } catch {
            throw MessageError("\(String(reflecting: self)) is not strings array\nError: \(String(reflecting: error))")
        }
        return arrays
    }
    
    func nullableArrays() throws -> [JsonArray?] {
        let arrays: [JsonArray?]
        do { arrays = try map({ try $0.nullableArray() }) } catch {
            throw MessageError("\(String(reflecting: self)) is not nullable strings array\nError: \(String(reflecting: error))")
        }
        return arrays
    }
    
    mutating func insertArray(_ newArray: JsonArray, at i: Int) {
        insert(.array(newArray), at: i)
    }
    
    mutating func insertNullableArray(_ newArray: JsonArray?, at i: Int) {
        if let newArray = newArray { insert(.array(newArray), at: i) }
        else { insert(.null, at: i) }
    }
    
    mutating func appendArray(_ array: JsonArray) {
        append(.array(array))
    }
    
    mutating func appendNullableArray(_ array: JsonArray?) {
        if let array = array { append(.array(array)) }
        else { append(.null) }
    }
    
    // MARK: Booleans
    
    init(_ bools: [Bool]) {
        self = bools.map({ .boolean($0) })
    }
    
    func booleans() throws -> [Bool] {
        let booleans: [Bool]
        do { booleans = try map({ try $0.boolean() }) } catch {
            throw MessageError("\(String(reflecting: self)) is not strings array\nError: \(String(reflecting: error))")
        }
        return booleans
    }
    
    func nullableBooleans() throws -> [Bool?] {
        let booleans: [Bool?]
        do { booleans = try map({ try $0.nullableBoolean() }) } catch {
            throw MessageError("\(String(reflecting: self)) is not nullable strings array\nError: \(String(reflecting: error))")
        }
        return booleans
    }
    
    mutating func insertBoolean(_ newBoolean: Bool, at i: Int) {
        insert(.boolean(newBoolean), at: i)
    }
    
    mutating func insertNullableBoolean(_ newBoolean: Bool?, at i: Int) {
        if let newBoolean = newBoolean { insert(.boolean(newBoolean), at: i) }
        else { insert(.null, at: i) }
    }
    
    mutating func appendBoolean(_ boolean: Bool) {
        append(.boolean(boolean))
    }
    
    mutating func appendNullableBoolean(_ boolean: Bool?) {
        if let boolean = boolean { append(.boolean(boolean)) }
        else { append(.null) }
    }
    
}
