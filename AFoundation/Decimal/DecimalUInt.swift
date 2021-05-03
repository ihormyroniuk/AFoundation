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
            throw MessageError("Cannot convert \(String(reflecting: Decimal.self))(\(String(reflecting: self))) to \(String(reflecting: UInt.self))")
        }
        return (self as NSDecimalNumber).uintValue
    }
    
}
