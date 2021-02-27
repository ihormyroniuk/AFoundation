//
//  DecimalIntUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class DecimalIntUnitTesting: XCTestCase {
    
    func testIntDecimal() {
        let int = Int(1234567890)
        let decimal = Decimal(int)
        
        let decimalInt: Int
        do { decimalInt = try decimal.int() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(decimalInt == int, "Unexpected int \(int)) is found, but int \(decimalInt) is expected")
    }
    
    func testDecimalGreaterThanIntMax() {
        let int = Int.max
        let decimal = Decimal(int) + Decimal(int)
        
        let decimalInt: Int
        do { decimalInt = try decimal.int() } catch {
            let errorLocalizedString = error.localizedDescription
            let descriptionString = "Could not convert \(Decimal.self) \(decimal) to \(Int.self)"
            XCTAssertTrue(errorLocalizedString == descriptionString, "Unexpected description \(errorLocalizedString)) is found but description \(descriptionString) is expected")
            return
        }
        
        XCTFail("Unexpected int \(decimalInt) is returned, but error has to be thrown")
    }
    
    func testDecimalLessThanIntMin() {
        let int = Int.min
        let decimal = Decimal(int) + Decimal(int)
        
        let decimalInt: Int
        do { decimalInt = try decimal.int() } catch {
            let errorLocalizedString = error.localizedDescription
            let descriptionString = "Could not convert \(Decimal.self) \(decimal) to \(Int.self)"
            XCTAssertTrue(errorLocalizedString == descriptionString, "Unexpected description \(errorLocalizedString)) is found but description \(descriptionString) is expected")
            return
        }
        
        XCTFail("Unexpected int \(decimalInt) is returned, but error has to be thrown")
    }
}
