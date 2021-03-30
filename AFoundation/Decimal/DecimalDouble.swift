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
            throw NotDoubleConvertibleError(decimal: self)
        }
        return (self as NSDecimalNumber).doubleValue
    }
    struct NotDoubleConvertibleError: Error, CustomDebugStringConvertible {
        let decimal: Decimal
        public var debugDescription: String {
            return "\(String(reflecting: self))\nCannot convert \(String(reflecting: Decimal.self))(\(String(reflecting: decimal)) to \(String(reflecting: Double.self))"
        }
    }
    
}
