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
            if self[key] == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotObject(object: self, key: key, value: value!)
                throw error
            }
        }
        return object
    }

    func optionalObject(_ key: JsonString) throws -> JsonObject? {
        let value = self[key]
        guard let object = value as? JsonObject else {
            if self[key] == nil {
                return nil
            } else {
                let error = JsonErrorValueNotObject(object: self, key: key, value: value!)
                throw error
            }
        }
        return object
    }
    
}

public struct JsonErrorValueNotObject: LocalizedError {
    
    private let object: JsonObject
    private let key: String
    private let value: Any
    
    init(object: JsonObject, key: String, value: Any) {
        self.object = object
        self.key = key
        self.value = value
    }
    
}
