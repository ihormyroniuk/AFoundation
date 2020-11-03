//
//  DecimalFloatUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class DecimalFloatUnitTesting: XCTestCase {

    func testDoubleDecimal() {
        let float = Float(1)
        let double = Double(float)
        let decimal = Decimal(double)
        
        let decimalFloat = decimal.float
        
        XCTAssertTrue(decimalFloat == float, "Unexpected decimal to float \"\(String(describing: float))\" is found while float \"(\(String(describing: decimalFloat))\" is expected")
    }
    
}
