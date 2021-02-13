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
            let error = JsonValueIsNotBooleanError(value: self)
            throw error
        }
        return boolean
    }

}

public struct JsonValueIsNotBooleanError: LocalizedError {
    
    private let value: Any
    
    init(value: Any) {
        self.value = value
    }
    
}

public class JsonBoolean1: JsonValue1 {
    public let bool: Bool
    
    public init(bool: Bool) {
        self.bool = bool
        super.init()
    }
    
    public static func == (lhs: JsonBoolean1, rhs: JsonBoolean1) -> Bool {
        return lhs.bool == rhs.bool
    }
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(bool)
    }
}
