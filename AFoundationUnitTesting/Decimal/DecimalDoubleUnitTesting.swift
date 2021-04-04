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
//        let double = Double(1234567890) + Double(66886)
//        let decimal = Decimal(double)
//        
//        let decimalDouble: Double
//        do { decimalDouble = try decimal.double() } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//            return
//        }
//        
//        XCTAssertTrue(decimalDouble == double, "Unexpected double \(double)) is found, but double \(decimalDouble) is expected")
//        
//        print("!!!!!!!!")
//        print(Decimal.pi)
//        print(Double.pi)
//        print(Float.Exponent.max)
//        print("!!!!!!!!")
        
        do {
            let locale = Locale(identifier: "fr")
            let language = try locale.language()
        } catch {
            print(error)
        }
    }
    
//    func testDecimalGreaterThanDoubleMax() {
//        let double = Double.greatestFiniteMagnitude
//        let decimal = Decimal(double) + Decimal(double)
//        
//        let decimalDouble: Double
//        do { decimalDouble = try decimal.double() } catch {
//            let errorLocalizedString = error.localizedDescription
//            let descriptionString = "Could not convert \(Decimal.self) \(decimal) to \(Double.self)"
//            XCTAssertTrue(errorLocalizedString == descriptionString, "Unexpected description \(errorLocalizedString)) is found but description \(descriptionString) is expected")
//            return
//        }
//        
//        XCTFail("Unexpected double \(decimalDouble) is returned, but error has to be thrown")
//    }
//    
//    func testDecimalLessThanDoubleMin() {
//        let double = -Double.greatestFiniteMagnitude
//        let decimal = Decimal(double) + Decimal(double)
//        
//        let decimalDouble: Double
//        do { decimalDouble = try decimal.double() } catch {
//            let errorLocalizedString = error.localizedDescription
//            let descriptionString = "Could not convert \(Decimal.self) \(decimal) to \(Double.self)"
//            XCTAssertTrue(errorLocalizedString == descriptionString, "Unexpected description \(errorLocalizedString)) is found but description \(descriptionString) is expected")
//            return
//        }
//        
//        XCTFail("Unexpected double \(decimalDouble) is returned, but error has to be thrown")
//    }
}
