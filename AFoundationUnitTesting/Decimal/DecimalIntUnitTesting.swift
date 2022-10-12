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
    
    func testInt() {
        let int = Int(1234567890)
        let decimal = Decimal(int)
        
        let decimalInt: Int
        do { decimalInt = try decimal.int() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        XCTAssertTrue(decimalInt == int, "Unexpected int \(decimalInt)) is found, but int \(int) is expected")
    }
    
    func testIntZero() {
        let int = Int(0)
        let decimal = Decimal(int)
        
        let decimalInt: Int
        do { decimalInt = try decimal.int() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        XCTAssertTrue(decimalInt == int, "Unexpected int \(decimalInt)) is found, but int \(int) is expected")
    }
    
    func testIntGreaterThanIntMax() {
        let decimal = Decimal.intMax + Decimal.intMax
        
        let decimalInt: Int
        do { decimalInt = try decimal.int() } catch {
            return
        }
        
        XCTFail("Unexpected int \(decimalInt) is returned, but error has to be thrown")
    }
    
    func testIntLessThanIntMin() {
        let decimal = Decimal.intMin + Decimal.intMin
        
        let decimalInt: Int
        do { decimalInt = try decimal.int() } catch {
            return
        }
        
        XCTFail("Unexpected int \(decimalInt) is returned, but error has to be thrown")
    }
    
    func testDoubleWithFraction() {
        let double = Double(-123.456)
        let decimal = Decimal(double)
        
        let decimalInt: Int
        do { decimalInt = try decimal.int() } catch {
            return
        }
        
        XCTFail("Unexpected int \(decimalInt) is returned, but error has to be thrown")
    }
    
    func testDoubleWithFractionZeroes() {
        let double = Double(1234567890.0000)
        let decimal = Decimal(double)
        
        let decimalInt: Int
        do { decimalInt = try decimal.int() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        XCTAssertTrue(decimalInt == Int(double), "Unexpected int \(decimalInt)) is found, but int \(double) is expected")
    }
    
    func testDoubleZero() {
        let double = Double(0)
        let decimal = Decimal(double)
        
        let decimalInt: Int
        do { decimalInt = try decimal.int() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        XCTAssertTrue(decimalInt == Int(double), "Unexpected int \(decimalInt)) is found, but int \(double) is expected")
    }
    
}
