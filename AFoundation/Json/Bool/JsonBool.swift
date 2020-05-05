//
//  JsonBool.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JsonObject {

    func boolForKey(_ key: String) throws -> Bool {
        let value = self[key]
        guard let bool = value as? Bool else {
            if self[key] == nil {
                let error = JsonParsingErrorObjectKeyIsMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonParsingErrorObjectValueForKeyIsNotBool(object: self, key: key, value: value!)
                throw error
            }
        }
        return bool
    }
    
}
