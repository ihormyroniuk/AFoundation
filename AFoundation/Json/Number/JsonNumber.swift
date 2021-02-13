//
//  JsonNumber.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public final class JsonNumber: JsonValue, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    
    public let decimal: Decimal
    
    public required init(_ decimal: Decimal) {
        self.decimal = decimal
        super.init()
    }
    
    // MARK: ExpressibleByFloatLiteral
    
    public typealias FloatLiteralType = Double
    
    public required init(floatLiteral value: Double) {
        self.decimal = Decimal(value)
        super.init()
    }
    
    // MARK: ExpressibleByIntegerLiteral
    
    public typealias IntegerLiteralType = Int
    
    public required init(integerLiteral value: Int) {
        self.decimal = Decimal(value)
        super.init()
    }
    
    // MARK: Equatable
    
    public static func == (lhs: JsonNumber, rhs: JsonNumber) -> Bool {
        return lhs.decimal == rhs.decimal
    }
    
    // MARK: Hashable
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(decimal)
    }
}
