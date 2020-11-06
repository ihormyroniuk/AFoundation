//
//  JsonObjectString.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JsonObject {

    func string(_ key: JsonString) throws -> JsonString {
        let value = self[key]
        guard let string = value as? JsonString else {
            if value == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotString(value: value!)
                throw error
            }
        }
        return string
    }

    func optionalString(_ key: JsonString) throws -> JsonString? {
        let value = self[key]
        if let string = value as? JsonString {
            return string
        } else if value is JsonNull {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        let error = JsonErrorValueNotString(value: value!)
        throw error
    }
    
}
