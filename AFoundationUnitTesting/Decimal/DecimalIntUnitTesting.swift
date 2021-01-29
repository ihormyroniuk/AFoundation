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
            if error is DecimalIsNotIntConvertibleError {
                return
            } else {
                XCTFail("Unexpected error \(error.self) is thrown")
                return
            }
        }
        
        XCTFail("Unexpected int \(decimalInt) is returned, but error \(DecimalIsNotIntConvertibleError.self) has to be thrown")
    }
    
    func testDecimalLessThanIntMin() {
        let int = Int.min
        let decimal = Decimal(int) + Decimal(int)
        
        let decimalInt: Int
        do { decimalInt = try decimal.int() } catch {
            if error is DecimalIsNotIntConvertibleError {
                return
            } else {
                XCTFail("Unexpected error \(error.self) is thrown")
                return
            }
        }
        
        XCTFail("Unexpected int \(decimalInt) is returned, but error \(DecimalIsNotIntConvertibleError.self) has to be thrown")
    }
    
    // MARK: DecimalIsNotIntConvertibleError
    
    func testDecimalIsNotIntConvertibleErrorDescription() {
        let decimal = Decimal(1234567890)
        let error = DecimalIsNotIntConvertibleError(decimal: decimal)
        
        let errorDescriptionString = "\(error)"
        
        let descriptionString = "Decimal \(decimal) is not \(Int.self) convertible"
        XCTAssertTrue(errorDescriptionString == descriptionString, "Unexpected description \(errorDescriptionString)) is found but description \(descriptionString) is expected")
    }
    
}
