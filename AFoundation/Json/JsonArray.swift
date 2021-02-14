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
        return try map({ try $0.string() })
    }
    
    func numbers() throws -> [Decimal] {
        return try map({ try $0.number() })
    }
    
}

