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
        struct NotDoubleConvertibleError: Error, LocalizedError {
            let decimal: Decimal
            
            var errorDescription: String? {
                return "Could not convert \(Decimal.self) \(decimal) to \(Double.self)"
            }
        }
        guard self >= Decimal.doubleMin && self <= Decimal.doubleMax else {
            let error = NotDoubleConvertibleError(decimal: self)
            throw error
        }
        return (self as NSDecimalNumber).doubleValue
    }
  
}
