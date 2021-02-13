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
            let error = JsonValueIsNotNullError(value: self)
            throw error
        }
        return null
    }
    
}

public struct JsonValueIsNotNullError: LocalizedError {
    
    private let value: Any
    
    init(value: Any) {
        self.value = value
    }
    
}

public class JsonNull1: JsonValue1 {
    public let null: NSNull
    
    public init(null: NSNull) {
        self.null = null
        super.init()
    }
    
    public static func == (lhs: JsonNull1, rhs: JsonNull1) -> Bool {
        return lhs.null == rhs.null
    }
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(null)
    }
}
