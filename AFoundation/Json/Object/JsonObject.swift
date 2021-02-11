//
//  JsonObject.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonObject = [JsonString: JsonValue]
extension JsonObject: JsonValue { }

public func ==(lhs: JsonObject, rhs: JsonObject) -> Bool {
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}

public func ==(lhs: JsonObject?, rhs: JsonObject) -> Bool {
    guard let lhs = lhs else { return false }
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}

public extension JsonValue {
    
    func object() throws -> JsonObject {
        guard let object = self as? JsonObject else {
            let error = JsonValueIsNotObjectError(value: self)
            throw error
        }
        return object
    }
    
}

public struct JsonValueIsNotObjectError: LocalizedError {
    
    private let value: JsonValue
    
    init(value: JsonValue) {
        self.value = value
    }
    
}

