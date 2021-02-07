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
            if error is DecimalIsNotUIntConvertibleError {
                return
            } else {
                XCTFail("Unexpected error \(error.self) is thrown")
                return
            }
        }
        
        XCTFail("Unexpected int \(decimalUInt) is returned, but error \(DecimalIsNotUIntConvertibleError.self) has to be thrown")
    }
    
    func testDecimalLessThanUIntMin() {
        let decimal = Decimal(-123343)
        
        let decimalUInt: UInt
        do { decimalUInt = try decimal.uint() } catch {
            if error is DecimalIsNotUIntConvertibleError {
                return
            } else {
                XCTFail("Unexpected error \(error.self) is thrown")
                return
            }
        }
        
        XCTFail("Unexpected int \(decimalUInt) is returned, but error \(DecimalIsNotUIntConvertibleError.self) has to be thrown")
    }
    
    // MARK: DecimalIsNotIntConvertibleError
    
    func testDecimalIsNotUIntConvertibleErrorDescription() {
        let decimal = Decimal(1234567890)
        let error = DecimalIsNotUIntConvertibleError(decimal: decimal)
        
        let errorDescriptionString = "\(error)"
        
        let descriptionString = "Decimal \(decimal) is not \(UInt.self) convertible"
        XCTAssertTrue(errorDescriptionString == descriptionString, "Unexpected description \(errorDescriptionString)) is found but description \(descriptionString) is expected")
    }
    
}
