//
//  DecimalDoubleUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 02.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class DecimalDoubleUnitTesting: XCTestCase {

    func testDoubleDecimal() {
        let double = Double(1)
        let decimal = Decimal(double)
        
        let decimalDouble = decimal.double
        
        XCTAssertTrue(decimalDouble == double, "Unexpected decimal to double \"\(String(describing: double))\" is found while double \"(\(String(describing: decimalDouble))\" is expected")
    }
    
}
