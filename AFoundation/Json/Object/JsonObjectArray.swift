//
//  JsonObjectArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JsonObject {

    func array(_ key: JsonString) throws -> JsonArray {
        let value = self[key]
        guard let array = value as? JsonArray else {
            if value == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotArray(value: value!)
                throw error
            }
        }
        return array
    }

    func optionalArray(_ key: JsonString) throws -> JsonArray? {
        let value = self[key]
        if let array = value as? JsonArray {
            return array
        } else if value is JsonNull {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        let error = JsonErrorValueNotArray(value: value!)
        throw error
    }
    
}
