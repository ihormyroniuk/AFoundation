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
    
    func jsonArrayStrings() throws -> JsonArrayStrings {
        guard let arrayStrings = self as? JsonArrayStrings else {
            let error = JsonErrorNotArrayStrings(array: self)
            throw error
        }
        return arrayStrings
    }
    
    func jsonArrayNumbers() throws -> JsonArrayNumbers {
        guard let arrayNumbers = self as? JsonArrayNumbers else {
            let error = JsonErrorNotArrayNumbers(array: self)
            throw error
        }
        return arrayNumbers
    }
    
    func jsonArrayObjects() throws -> JsonArrayObjects {
        guard let arrayObjects = self as? JsonArrayObjects else {
            let error = JsonErrorNotArrayObjects(array: self)
            throw error
        }
        return arrayObjects
    }
    
    func jsonArrayArrays() throws -> JsonArrayArrays {
        guard let arrayArrays = self as? JsonArrayArrays else {
            let error = JsonErrorNotArrayArrays(array: self)
            throw error
        }
        return arrayArrays
    }
    
    func jsonArrayBooleans() throws -> JsonArrayBooleans {
        guard let arrayBooleans = self as? JsonArrayBooleans else {
            let error = JsonErrorNotArrayBooleans(array: self)
            throw error
        }
        return arrayBooleans
    }
    
}
