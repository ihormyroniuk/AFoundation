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
            let error = NotDoubleConvertibleError(decimal: self)
            throw error
        }
        return (self as NSDecimalNumber).doubleValue
    }
    struct NotDoubleConvertibleError: Error, LocalizedError, CustomDebugStringConvertible {
        let decimal: Decimal
        public var debugDescription: String {
            return
                """
                \(String(reflecting: Self.self))
                decimal =
                \(String(reflecting: decimal))
                """
        }
        public var errorDescription: String? {
            return
                """
                \(String(reflecting: self))
                Cannot convert \(String(reflecting: Decimal.self))(\(String(reflecting: decimal)) to \(String(reflecting: Double.self))
                """
        }
    }
}
