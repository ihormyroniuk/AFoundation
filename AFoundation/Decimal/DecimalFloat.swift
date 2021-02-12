//
//  DecimalFloat.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 03.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension Decimal {
    
    static let floatMax = Decimal(Double(Float.greatestFiniteMagnitude))
    static let floatMin = Decimal(Double(-Float.greatestFiniteMagnitude))
    
    init(_ float: Float) {
        self.init(Double(float))
    }
  
    func float() throws -> Float {
        guard self >= Decimal.floatMin && self <= Decimal.floatMax else {
            let error = DecimalIsNotFloatConvertibleError(decimal: self)
            throw error
        }
        return (self as NSDecimalNumber).floatValue
    }
  
}

public struct DecimalIsNotFloatConvertibleError: Error, CustomStringConvertible {
    
    public let decimal: Decimal
    
    init(decimal: Decimal) {
        self.decimal = decimal
    }
    
    public var description: String {
        return "Could not convert \(Decimal.self) \(decimal) to \(Float.self)"
    }
    
}

