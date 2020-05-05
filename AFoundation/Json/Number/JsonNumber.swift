//
//  JsonNumber.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JsonObject {

    func numberForKey(_ key: String) throws -> NSNumber {
        let value = self[key]
        guard let number = value as? NSNumber else {
            if self[key] == nil {
                let error = JsonParsingErrorObjectKeyIsMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonParsingErrorObjectValueForKeyIsNotNumber(object: self, key: key, value: value!)
                throw error
            }
        }
        return number
    }
    
}
