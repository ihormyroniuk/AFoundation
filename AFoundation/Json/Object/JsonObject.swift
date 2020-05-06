//
//  JsonObject.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonObject = [String: Any]

public extension JsonObject {

    func objectForKey(_ key: String) throws -> JsonObject {
        let value = self[key]
        guard let object = value as? JsonObject else {
            if self[key] == nil {
                let error = JsonParsingErrorObjectKeyIsMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonParsingErrorObjectValueForKeyIsNotObject(object: self, key: key, value: value!)
                throw error
            }
        }
        return object
    }
    
}
