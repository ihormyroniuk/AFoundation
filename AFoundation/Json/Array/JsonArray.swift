//
//  JsonArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonArrayStrings = [JsonString]
public typealias JsonArrayNumbers = [JsonNumber]
public typealias JsonArrayObjects = [JsonObject]
public typealias JsonArrayArrays = [JsonArray]
public typealias JsonArrayBooleans = [JsonBoolean]

public extension JsonArray {
    
    func arrayStrings() throws -> JsonArrayStrings {
        guard let arrayStrings = self as? JsonArrayStrings else {
            let error = JsonErrorNotArrayStrings(array: self)
            throw error
        }
        return arrayStrings
    }
    
}

public struct JsonErrorNotArrayStrings: LocalizedError {
    
    private let array: JsonArray
    
    init(array: JsonArray) {
        self.array = array
    }
    
}

public extension JsonArray {
    
    func arrayNumbers() throws -> JsonArrayNumbers {
        guard let arrayNumbers = self as? JsonArrayNumbers else {
            let error = JsonErrorNotArrayNumbers(array: self)
            throw error
        }
        return arrayNumbers
    }
    
}

public struct JsonErrorNotArrayNumbers: LocalizedError {
    
    private let array: JsonArray
    
    init(array: JsonArray) {
        self.array = array
    }
    
}

public extension JsonArray {
    
    func arrayObjects() throws -> JsonArrayObjects {
        guard let arrayObjects = self as? JsonArrayObjects else {
            let error = JsonErrorNotArrayObjects(array: self)
            throw error
        }
        return arrayObjects
    }
    
}

public struct JsonErrorNotArrayObjects: LocalizedError {
    
    private let array: JsonArray
    
    init(array: JsonArray) {
        self.array = array
    }
    
}


public extension JsonArray {
    
    func arrayArrays() throws -> JsonArrayArrays {
        guard let arrayArrays = self as? JsonArrayArrays else {
            let error = JsonErrorNotArrayArrays(array: self)
            throw error
        }
        return arrayArrays
    }
    
}

public struct JsonErrorNotArrayArrays: LocalizedError {
    
    private let array: JsonArray
    
    init(array: JsonArray) {
        self.array = array
    }
    
}

public extension JsonArray {
    
    func arrayBooleans() throws -> JsonArrayBooleans {
        guard let arrayBooleans = self as? JsonArrayBooleans else {
            let error = JsonErrorNotArrayBooleans(array: self)
            throw error
        }
        return arrayBooleans
    }
    
}

public struct JsonErrorNotArrayBooleans: LocalizedError {
    
    private let array: JsonArray
    
    init(array: JsonArray) {
        self.array = array
    }
    
}
