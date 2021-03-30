//
//  DecimalFloat.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 03.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension Decimal {
    
    static let floatMax = Decimal(Double(Float.greatestFiniteMagnitude))
    static let floatMin = Decimal(Double(-Float.greatestFiniteMagnitude))
    
    init(_ float: Float) {
        self.init(Double(float))
    }
  
    func float() throws -> Float {
        guard self >= Decimal.floatMin && self <= Decimal.floatMax else {
            throw NotFloatConvertibleError(decimal: self)
        }
        return (self as NSDecimalNumber).floatValue
    }
    private struct NotFloatConvertibleError: Error, CustomDebugStringConvertible {
        let decimal: Decimal
        var debugDescription: String {
            return "Could not convert \(Decimal.self) \(decimal) to \(Float.self)"
        }
    }
  
}
