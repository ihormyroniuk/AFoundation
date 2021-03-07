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
            let error = NotUIntConvertibleError(decimal: self)
            throw error
        }
        return (self as NSDecimalNumber).uintValue
    }
    private struct NotUIntConvertibleError: Error, LocalizedError {
        let decimal: Decimal
        
        var errorDescription: String? {
            return "Could not convert \(Decimal.self) \(decimal) to \(UInt.self)"
        }
    }
    
}
