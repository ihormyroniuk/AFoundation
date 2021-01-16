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
        
        let decimalInt: Int
        do { decimalInt = try decimal.int() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        XCTAssertTrue(decimalInt == int, "Unexpected decimal to int \"\(String(describing: int))\" is found while int \"(\(String(describing: decimalInt))\" is expected")
    }
    
}
