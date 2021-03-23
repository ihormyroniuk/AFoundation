//
//  DecimalUInt.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension Decimal {
    static let uintMax = Decimal(UInt.max)
    static let uintMin = Decimal(UInt.min)
  
    func uint() throws -> UInt {
        guard exponent >= 0 && self >= Decimal.uintMin && self <= Decimal.uintMax else {
            throw NotUIntConvertibleError(decimal: self)
        }
        return (self as NSDecimalNumber).uintValue
    }
    private struct NotUIntConvertibleError: Error, CustomDebugStringConvertible {
        let decimal: Decimal
        var debugDescription: String {
            return "Could not convert \(Decimal.self) \(decimal) to \(UInt.self)"
        }
    }
    
}
