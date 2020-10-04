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
        guard let number = value as? NSNumber else {
            if value == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotNumber(object: self, key: key, value: value!)
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
        let error = JsonErrorValueNotNumber(object: self, key: key, value: value!)
        throw error
    }
    
}

public struct JsonErrorValueNotNumber: LocalizedError {
    
    private let object: JsonObject
    private let key: String
    private let value: Any
    
    init(object: JsonObject, key: String, value: Any) {
        self.object = object
        self.key = key
        self.value = value
    }
    
}
