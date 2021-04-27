//
//  DecimalFloatUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class DecimalFloatUnitTesting: XCTestCase {

    func testFloatDecimal() {
        let float = Float(1234567890.87) + Float(66886.8665850087008)
        let decimal = Decimal(float)
        
        let decimalFloat: Float
        do { decimalFloat = try decimal.float() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(decimalFloat == float, "Unexpected float \(float)) is found, but float \(decimalFloat) is expected")
    }
    
    func testDecimalGreaterThanFloatMax() {
        let float = Float.greatestFiniteMagnitude
        let decimal = Decimal(float) + Decimal(float)
        
        let decimalFloat: Float
        do { decimalFloat = try decimal.float() } catch {
            return
        }
        
        XCTFail("Unexpected float \(decimalFloat) is returned, but error has to be thrown")
    }
    
    func testDecimalLessThanFloatMin() {
        let float = -Float.greatestFiniteMagnitude
        let decimal = Decimal(float) + Decimal(float)
        
        let decimalFloat: Float
        do { decimalFloat = try decimal.float() } catch {
            return
        }
        
        XCTFail("Unexpected float \(decimalFloat) is returned, but error has to be thrown")
    }
}
