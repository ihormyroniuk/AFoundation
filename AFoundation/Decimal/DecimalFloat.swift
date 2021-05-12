//
//  DecimalFloat.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 03.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension Decimal {
    
    static let floatMax = Decimal(Float.greatestFiniteMagnitude)
    static let floatMin = Decimal(-Float.greatestFiniteMagnitude)
    
    init(_ float: Float) {
        self.init(Double(float))
    }
  
    func float() throws -> Float {
        guard self >= Decimal.floatMin && self <= Decimal.floatMax else {
            throw MessageError("Cannot get \(String(reflecting: Float.self)) for \(String(reflecting: Decimal.self))(\(String(reflecting: self)))")
        }
        return (self as NSDecimalNumber).floatValue
    }
  
}
