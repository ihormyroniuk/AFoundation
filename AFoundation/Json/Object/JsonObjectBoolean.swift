//
//  JsonObjectBoolean.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JsonObject {

    func boolean(_ key: JsonString) throws -> Bool {
        let value = self[key]
        guard let boolean = value as? Bool else {
            if value == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotBoolean(object: self, key: key, value: value!)
                throw error
            }
        }
        return boolean
    }

    func optionalBoolean(_ key: JsonString) throws -> Bool? {
        let value = self[key]
        if let boolean = value as? JsonBoolean {
            return boolean
        } else if value is JsonNull {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        } else {
            let error = JsonErrorValueNotBoolean(object: self, key: key, value: value!)
            throw error
        }
    }
    
}

public struct JsonErrorValueNotBoolean: LocalizedError {
    
    private let object: JsonObject
    private let key: String
    private let value: Any
    
    init(object: JsonObject, key: String, value: Any) {
        self.object = object
        self.key = key
        self.value = value
    }
    
}
