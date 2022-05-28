//
//  NumberFormatterStringFromDecimal.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 28.05.2022.
//  Copyright © 2022 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension NumberFormatter {
    
    func string(_ number: NSNumber) -> String {
        let string  = self.string(from: number)
        return string ?? ""
    }
    
    func string(_ decimal: Decimal) -> String {
        let string  = self.string(decimal as NSNumber)
        return string
    }
    
}
