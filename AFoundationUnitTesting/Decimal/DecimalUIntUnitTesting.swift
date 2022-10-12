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

    func testUInt() {
        let uint = UInt(1234567890)
        let decimal = Decimal(uint)
        
        let decimalUInt: UInt
        do { decimalUInt = try decimal.uint() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        XCTAssertTrue(decimalUInt == uint, "Unexpected \(decimalUInt)) is found, but \(uint) is expected")
    }
    
    func testUIntZero() {
        let int = UInt(0)
        let decimal = Decimal(int)
        
        let decimalInt: UInt
        do { decimalInt = try decimal.uint() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        XCTAssertTrue(decimalInt == int, "Unexpected int \(decimalInt)) is found, but int \(int) is expected")
    }
    
    func testUIntGreaterThanUIntMax() {
        let decimal = Decimal.uintMax + Decimal.uintMax
        
        let decimalUInt: UInt
        do { decimalUInt = try decimal.uint() } catch {
            return
        }
        
        XCTFail("Unexpected \(decimalUInt) is returned, but error has to be thrown")
    }
    
    func testUIntDecimalLessThanIntMin() {
        let decimal = Decimal(-523)
        
        let decimalUInt: UInt
        do { decimalUInt = try decimal.uint() } catch {
            return
        }
        
        XCTFail("Unexpected \(decimalUInt) is returned, but error has to be thrown")
    }
    
    func testDoubleWithFraction() {
        let double = Double(123.456)
        let decimal = Decimal(double)
        
        let decimalUInt: UInt
        do { decimalUInt = try decimal.uint() } catch {
            return
        }
        
        XCTFail("Unexpected \(decimalUInt) is returned, but error has to be thrown")
    }
    
    func testDoubleWithoutFraction() {
        let double = Double(1234567890.0000)
        let decimal = Decimal(double)
        
        let decimalUInt: UInt
        do { decimalUInt = try decimal.uint() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        XCTAssertTrue(decimalUInt == Int(double), "Unexpected \(decimalUInt)) is found, but \(double) is expected")
    }
    
    func testDoubleZero() {
        let double = Double(0)
        let decimal = Decimal(double)
        
        let decimalInt: UInt
        do { decimalInt = try decimal.uint() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        XCTAssertTrue(decimalInt == Int(double), "Unexpected int \(decimalInt)) is found, but int \(double) is expected")
    }
    
    func testDoubleSubtractionZero() {
        let double = Double(1.6700000)
        let decimal = Decimal(double) - Decimal(double)
        
        let decimalInt: UInt
        do { decimalInt = try decimal.uint() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        let zeroInt = UInt.zero
        XCTAssertTrue(decimalInt == zeroInt, "Unexpected int \(decimalInt)) is found, but int \(zeroInt) is expected")
    }
    
}
