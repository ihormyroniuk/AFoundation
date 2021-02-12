//
//  Decimal+Double.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 10/1/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension Decimal {
    
    static let doubleMax = Decimal(Double.greatestFiniteMagnitude)
    static let doubleMin = Decimal(-Double.greatestFiniteMagnitude)
  
    func double() throws -> Double {
        guard self >= Decimal.doubleMin && self <= Decimal.doubleMax else {
            let error = DecimalIsNotDoubleConvertibleError(decimal: self)
            throw error
        }
        return (self as NSDecimalNumber).doubleValue
    }
  
}

public struct DecimalIsNotDoubleConvertibleError: Error, CustomStringConvertible {
    
    public let decimal: Decimal
    
    init(decimal: Decimal) {
        self.decimal = decimal
    }
    
    public var description: String {
        return "Could not convert \(Decimal.self) \(decimal) to \(Double.self)"
    }
    
}
