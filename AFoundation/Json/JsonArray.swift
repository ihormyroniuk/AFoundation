//
//  JsonArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonArray =  [JsonValue]

public extension Array where Element == JsonValue {
    
    func strings() throws -> [String] {
        var strings: [String] = []
        for value in self {
            guard case .string(let string) = value else {
                let error = JsonValueIsNotStringError(value: value)
                throw error
            }
            strings.append(string)
        }
        return strings
    }
    
    func numbers() throws -> [Decimal] {
        var numbers: [Decimal] = []
        for value in self {
            guard case .number(let number) = value else {
                let error = JsonValueIsNotNumberError(value: value)
                throw error
            }
            numbers.append(number)
        }
        return numbers
    }
    
}

