//
//  JsonBoolean.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonBoolean = Bool
extension JsonBoolean: JsonValue { }

public extension JsonValue {
    
    func boolean() throws -> JsonBoolean {
        guard let boolean = self as? JsonBoolean else {
            let error = JsonErrorValueNotBoolean(value: self)
            throw error
        }
        return boolean
    }

}

public struct JsonErrorValueNotBoolean: LocalizedError {
    
    private let value: Any
    
    init(value: Any) {
        self.value = value
    }
    
}
