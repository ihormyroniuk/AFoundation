//
//  NumberFormatterStringFromDecimalUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 28.05.2022.
//  Copyright © 2022 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class NumberFormatterStringUnitTesting: XCTestCase {
    
    func testNumber() {
        let number = NSNumber()
        let numberFormatter = NumberFormatter()
        
        _ = numberFormatter.string(number)
    }
    
    func testDecimal() {
        let decimal = Decimal()
        let numberFormatter = NumberFormatter()
        
        _ = numberFormatter.string(decimal)
    }
    
}
