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
            if self[key] == nil {
                let error = JsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonErrorValueNotString(object: self, key: key, value: value!)
                throw error
            }
        }
        return string
    }

    func optionalString(_ key: JsonString) throws -> JsonString? {
        let value = self[key]
        guard let string = value as? JsonString else {
            if self[key] == nil {
                return nil
            } else {
                let error = JsonErrorValueNotString(object: self, key: key, value: value!)
                throw error
            }
        }
        return string
    }
    
}

public struct JsonErrorValueNotString: LocalizedError {
    
    private let object: JsonObject
    private let key: String
    private let value: Any
    
    init(object: JsonObject, key: String, value: Any) {
        self.object = object
        self.key = key
        self.value = value
    }
    
}
