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

public class JsonNumber1: JsonValue1, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public required init(floatLiteral value: Double) {
        self.decimal = Decimal(value)
        super.init()
    }
    
    public typealias IntegerLiteralType = Int
    public typealias FloatLiteralType = Double
    
    public let decimal: Decimal
    
    public required init(decimal: Decimal) {
        self.decimal = decimal
        super.init()
    }
    
    public required init(integerLiteral value: Int) {
        self.decimal = Decimal(value)
        super.init()
    }
    
    public static func == (lhs: JsonNumber1, rhs: JsonNumber1) -> Bool {
        return lhs.decimal == rhs.decimal
    }
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(decimal)
    }
}
