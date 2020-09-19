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
            if self[key] == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotArray(object: self, key: key, value: value!)
                throw error
            }
        }
        return array
    }

    func optionalArray(_ key: JsonString) throws -> JsonArray? {
        let value = self[key]
        guard let array = value as? JsonArray else {
            if self[key] == nil {
                return nil
            } else {
                let error = JsonErrorValueNotArray(object: self, key: key, value: value!)
                throw error
            }
        }
        return array
    }
    
}

public struct JsonErrorValueNotArray: LocalizedError {
    
    private let object: JsonObject
    private let key: String
    private let value: Any
    
    init(object: JsonObject, key: String, value: Any) {
        self.object = object
        self.key = key
        self.value = value
    }
    
}
