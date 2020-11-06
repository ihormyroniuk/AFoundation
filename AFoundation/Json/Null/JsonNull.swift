//
//  JsonNull.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonNull = NSNull
extension JsonNull: JsonValue { }

public extension JsonValue {
    
    func null() throws -> JsonNull {
        guard let null = self as? JsonNull else {
            let error = JsonErrorValueNotNull(value: self)
            throw error
        }
        return null
    }
    
}

public struct JsonErrorValueNotNull: LocalizedError {
    
    private let value: Any
    
    init(value: Any) {
        self.value = value
    }
    
}
