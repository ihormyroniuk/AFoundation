//
//  DecimalDoubleUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 02.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class DecimalDoubleUnitTesting: XCTestCase {

    func testDoubleDecimal() {
        let double = Double(1234567890) + Double(66886)
        let decimal = Decimal(double)
        
        let decimalDouble: Double
        do { decimalDouble = try decimal.double() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(decimalDouble == double, "Unexpected double \(double)) is found, but double \(decimalDouble) is expected")
    }
    
    func testDecimalGreaterThanDoubleMax() {
        let double = Double.greatestFiniteMagnitude
        let decimal = Decimal(double) + Decimal(double)
        
        let decimalDouble: Double
        do { decimalDouble = try decimal.double() } catch {
            if error is DecimalIsNotDoubleConvertibleError {
                return
            } else {
                XCTFail("Unexpected error \(error.self) is thrown")
                return
            }
        }
        
        XCTFail("Unexpected double \(decimalDouble) is returned, but error \(DecimalIsNotDoubleConvertibleError.self) has to be thrown")
    }
    
    func testDecimalLessThanDoubleMin() {
        let double = -Double.greatestFiniteMagnitude
        let decimal = Decimal(double) + Decimal(double)
        
        let decimalDouble: Double
        do { decimalDouble = try decimal.double() } catch {
            if error is DecimalIsNotDoubleConvertibleError {
                return
            } else {
                XCTFail("Unexpected error \(error.self) is thrown")
                return
            }
        }
        
        XCTFail("Unexpected double \(decimalDouble) is returned, but error \(DecimalIsNotDoubleConvertibleError.self) has to be thrown")
    }
    
    // MARK: DecimalIsNotDoubleConvertibleError
    
    func testDecimalIsNotDoubleConvertibleErrorDescription() {
        let decimal = Decimal(1234567890.656557607686)
        let error = DecimalIsNotDoubleConvertibleError(decimal: decimal)
        
        let errorDescription = "\(error)"
        
        let expectedDescription = "Could not convert \(Decimal.self) \(decimal) to \(Double.self)"
        XCTAssertTrue(errorDescription == expectedDescription, "Unexpected description \(errorDescription)) is found but description \(expectedDescription) is expected")
    }
    
}
