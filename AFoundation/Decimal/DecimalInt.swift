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
        guard exponent >= 0 && self >= Decimal.intMin && self <= Decimal.intMax else {
            throw AFoundationError("Could not convert \(Decimal.self) \(self) to \(Int.self)")
        }
        return (self as NSDecimalNumber).intValue
    }
    
}
