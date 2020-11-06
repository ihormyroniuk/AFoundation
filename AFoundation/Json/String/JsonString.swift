//
//  JsonString.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonString = String
extension JsonString: JsonValue { }

public extension JsonValue {
    
    func string() throws -> JsonString {
        guard let string = self as? JsonString else {
            let error = JsonErrorValueNotString(value: self)
            throw error
        }
        return string
    }

}

public struct JsonErrorValueNotString: LocalizedError {
    
    private let value: Any
    
    init(value: Any) {
        self.value = value
    }
    
}
