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
            throw AFoundationError("Cannot convert \(String(reflecting: Decimal.self))(\(String(reflecting: self))) to \(String(reflecting: Double.self))")
        }
        return (self as NSDecimalNumber).doubleValue
    }
    
}
