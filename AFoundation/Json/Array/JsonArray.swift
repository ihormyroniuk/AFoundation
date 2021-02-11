//
//  JsonArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonArray = [JsonValue]
extension JsonArray: JsonValue { }

public func ==(lhs: JsonArray, rhs: JsonArray) -> Bool {
    return NSArray(array: lhs).isEqual(to: rhs)
}

public func ==(lhs: JsonArray?, rhs: JsonArray) -> Bool {
    guard let lhs = lhs else { return false }
    return NSArray(array: lhs).isEqual(to: rhs)
}

public extension JsonValue {
    
    func array() throws -> JsonArray {
        guard let array = self as? JsonArray else {
            let error = JsonValueIsNotArrayError(value: self)
            throw error
        }
        return array
    }
    
}

public struct JsonValueIsNotArrayError: LocalizedError {
    
    private let value: Any
    
    init(value: Any) {
        self.value = value
    }
    
}
