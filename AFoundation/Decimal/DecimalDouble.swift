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
            throw Error("Cannot get \(String(reflecting: Double.self)) for \(String(reflecting: Decimal.self))(\(String(reflecting: self)))")
        }
        return (self as NSDecimalNumber).doubleValue
    }
    
}
