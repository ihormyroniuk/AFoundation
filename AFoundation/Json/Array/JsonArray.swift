//
//  JsonArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonArray = [Any]
public typealias JsonObjectsArray = [JsonObject]
public typealias JsonStringsArray = [String]

public extension JsonObject {
    
    func stringsArrayForKey(_ key: String) throws -> JsonStringsArray {
        let value = self[key]
        guard let stringsArray = value as? JsonStringsArray else {
            if self[key] == nil {
                let error = JsonParsingErrorObjectKeyIsMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonParsingErrorObjectValueForKeyIsNotStringsArray(object: self, key: key, value: value!)
                throw error
            }
        }
        return stringsArray
    }
    
}

public struct JsonParsingErrorObjectValueForKeyIsNotStringsArray: JsonParsingError {
    
    private let object: JsonObject
    private let key: String
    private let value: Any
    
    init(object: JsonObject, key: String, value: Any) {
        self.object = object
        self.key = key
        self.value = value
    }
    
}
