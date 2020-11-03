//
//  DecimalIntUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class DecimalIntUnitTesting: XCTestCase {

    func testDoubleDecimal() {
        let int = Int(1)
        let decimal = Decimal(int)
        
        let decimalInt = decimal.int
        
        XCTAssertTrue(decimalInt == int, "Unexpected decimal to int \"\(String(describing: int))\" is found while int \"(\(String(describing: decimalInt))\" is expected")
    }
    
}
