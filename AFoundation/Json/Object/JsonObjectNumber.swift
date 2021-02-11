//
//  JsonObjectNumber.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JsonObject {

    func number(_ key: JsonString) throws -> JsonNumber {
        let value = self[key]
        guard let number = value as? JsonNumber else {
            if value == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotNumberError(value: value!)
                throw error
            }
        }
        return number
    }

    func optionalNumber(_ key: JsonString) throws -> JsonNumber? {
        let value = self[key]
        if let number = value as? JsonNumber {
            return number
        } else if value is JsonNull {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotNumberError(value: value!)
        throw error
    }
    
}
