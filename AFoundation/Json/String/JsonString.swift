//
//  JsonString.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JsonObject {

    func stringForKey(_ key: String) throws -> String {
        let value = self[key]
        guard let string = value as? String else {
            if self[key] == nil {
                let error = JsonParsingErrorObjectKeyIsMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonParsingErrorObjectValueForKeyIsNotString(object: self, key: key, value: value!)
                throw error
            }
        }
        return string
    }
    
}
