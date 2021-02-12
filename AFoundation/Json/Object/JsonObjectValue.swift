//
//  JsonObjectValue.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 12.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JsonObject {

    func value(_ key: JsonString) throws -> JsonValue {
        let optionalValue = self[key]
        guard let value = optionalValue else {
            let error = JsonErrorValueMissing(object: self, key: key)
            throw error
        }
        return value
    }
    
}
