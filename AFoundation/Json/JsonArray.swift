//
//  JsonArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonArray =  [JsonAnyValue]

public extension JsonArray {
    
    func strings() throws -> [String] {
        return try map({ try $0.string() })
    }
    
    func numbers() throws -> [Decimal] {
        return try map({ try $0.number() })
    }
    
    func objects() throws -> [JsonObject] {
        return try map({ try $0.object() })
    }
    
    func arrays() throws -> [JsonArray] {
        return try map({ try $0.array() })
    }
    
    func booleans() throws -> [Bool] {
        return try map({ try $0.boolean() })
    }
    
}

