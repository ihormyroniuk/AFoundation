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
            let error = NotIntConvertibleError(decimal: self)
            throw error
        }
        return (self as NSDecimalNumber).intValue
    }
    private struct NotIntConvertibleError: Error, LocalizedError {
        let decimal: Decimal
        var errorDescription: String? {
            return "Could not convert \(Decimal.self) \(decimal) to \(Int.self)"
        }
    }
}
