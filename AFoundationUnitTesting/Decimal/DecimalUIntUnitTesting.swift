//
//  DecimalUIntUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 07.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class DecimalUIntUnitTesting: XCTestCase {

    func testUIntDecimal() {
        let uint = UInt(1234567890)
        let decimal = Decimal(uint)
        
        let decimalUInt: UInt
        do { decimalUInt = try decimal.uint() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(decimalUInt == uint, "Unexpected int \(uint)) is found, but int \(decimalUInt) is expected")
    }
    
    func testDecimalGreaterThanUIntMax() {
        let uint = UInt.max
        let decimal = Decimal(uint) + Decimal(uint)
        
        let decimalUInt: UInt
        do { decimalUInt = try decimal.uint() } catch {
            let errorLocalizedString = error.localizedDescription
            let descriptionString = "Could not convert \(Decimal.self) \(decimal) to \(UInt.self)"
            XCTAssertTrue(errorLocalizedString == descriptionString, "Unexpected description \(errorLocalizedString)) is found but description \(descriptionString) is expected")
            return
        }
        
        XCTFail("Unexpected int \(decimalUInt) is returned, but error has to be thrown")
    }
    
    func testDecimalLessThanUIntMin() {
        let decimal = Decimal(-123343)
        
        let decimalUInt: UInt
        do { decimalUInt = try decimal.uint() } catch {
            let errorLocalizedString = error.localizedDescription
            let descriptionString = "Could not convert \(Decimal.self) \(decimal) to \(UInt.self)"
            XCTAssertTrue(errorLocalizedString == descriptionString, "Unexpected description \(errorLocalizedString)) is found but description \(descriptionString) is expected")
            return
        }
        
        XCTFail("Unexpected int \(decimalUInt) is returned, but error has to be thrown")
    }
}
