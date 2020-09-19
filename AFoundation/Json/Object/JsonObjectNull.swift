//
//  JsonObjectNull.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JsonObject {
    
    func null(_ key: JsonString) throws -> JsonNull {
        let value = self[key]
        guard let null = value as? NSNull else {
            if self[key] == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotNull(object: self, key: key, value: value!)
                throw error
            }
        }
        return null
    }
    
    func optionalNull(_ key: JsonString) throws -> JsonNull? {
        let value = self[key]
        guard let null = value as? NSNull else {
            if self[key] == nil {
                return nil
            } else {
                let error = JsonErrorValueNotNull(object: self, key: key, value: value!)
                throw error
            }
        }
        return null
    }
    
}

public struct JsonErrorValueNotNull: LocalizedError {
    
    private let object: JsonObject
    private let key: String
    private let value: Any
    
    init(object: JsonObject, key: String, value: Any) {
        self.object = object
        self.key = key
        self.value = value
    }
    
}
