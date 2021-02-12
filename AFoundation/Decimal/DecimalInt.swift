//
//  DecimalInt.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 03.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension Decimal {
    
    static let intMax = Decimal(Int.max)
    static let intMin = Decimal(Int.min)
  
    func int() throws -> Int {
        guard self >= Decimal.intMin && self <= Decimal.intMax else {
            let error = DecimalIsNotIntConvertibleError(decimal: self)
            throw error
        }
        return (self as NSDecimalNumber).intValue
    }
  
}

public struct DecimalIsNotIntConvertibleError: Error, CustomStringConvertible {
    
    public let decimal: Decimal
    
    init(decimal: Decimal) {
        self.decimal = decimal
    }
    
    public var description: String {
        return "Could not convert \(Decimal.self) \(decimal) to \(Int.self)"
    }
    
}
