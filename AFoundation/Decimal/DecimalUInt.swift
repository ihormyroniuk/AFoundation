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
        guard self >= Decimal.uintMin && self <= Decimal.uintMax else {
            let error = DecimalIsNotUIntConvertibleError(decimal: self)
            throw error
        }
        return (self as NSDecimalNumber).uintValue
    }
  
}

public struct DecimalIsNotUIntConvertibleError: Error, CustomStringConvertible {
    
    public let decimal: Decimal
    
    public init(decimal: Decimal) {
        self.decimal = decimal
    }
    
    public var description: String {
        return "Decimal \(decimal) is not \(UInt.self) convertible"
    }
    
}
