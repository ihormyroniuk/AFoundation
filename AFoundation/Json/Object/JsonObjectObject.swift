//
//  JsonObjectObject.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JsonObject {

    func object(_ key: JsonString) throws -> JsonObject {
        let value = self[key]
        guard let object = value as? JsonObject else {
            if value == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotObjectError(value: value!)
                throw error
            }
        }
        return object
    }

    func optionalObject(_ key: JsonString) throws -> JsonObject? {
        let value = self[key]
        if let object = value as? JsonObject {
            return object
        } else if value is JsonNull {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotObjectError(value: value!)
        throw error
    }
    
}
