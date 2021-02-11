//
//  JsonNumber.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonNumber = Decimal
extension JsonNumber: JsonValue { }

public extension JsonValue {
    
    func number() throws -> JsonNumber {
        guard let number = self as? JsonNumber else {
            let error = JsonValueIsNotNumberError(value: self)
            throw error
        }
        return number
    }

}

public struct JsonValueIsNotNumberError: LocalizedError {
    
    private let value: JsonValue
    
    init(value: JsonValue) {
        self.value = value
    }
    
}
