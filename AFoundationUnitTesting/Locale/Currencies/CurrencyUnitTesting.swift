//
//  HardcodedCurrenciesCodesUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class CurrencyUnitTesting: XCTestCase {

    func testUnitedStatesDollarCode() {
        let code = "USD"
        
        let currency = Currency.byCode(code)
        
        XCTAssertTrue(currency == .unitedStatesDollar, "Unexpected code to currency \"\(String(describing: currency))\" is found while currency \"(\(String(describing: Currency.unitedStatesDollar))\" is expected")
    }
    
    func testUnitedStatesDollarCurrency() {
        let currency = Currency.unitedStatesDollar
        
        let code = Currency.codeOfCurrency(currency)
        
        XCTAssertTrue(code == "USD", "Unexpected currency to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "USD"))\" is expected")
    }
    
    func testUkrainianHryvniaCode() {
        let code = "UAH"
        
        let currency = Currency.byCode(code)
        
        XCTAssertTrue(currency == .ukrainianHryvnia, "Unexpected code to currency \"\(String(describing: currency))\" is found while currency \"(\(String(describing: Currency.ukrainianHryvnia))\" is expected")
    }
    
    func testUkrainianHryvniaCurrency() {
        let currency = Currency.ukrainianHryvnia
        
        let code = Currency.codeOfCurrency(currency)
        
        XCTAssertTrue(code == "UAH", "Unexpected currency to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "UAH"))\" is expected")
    }
    
    func testRussianRubleCode() {
        let code = "RUB"
        
        let currency = Currency.byCode(code)
        
        XCTAssertTrue(currency == .russianRuble, "Unexpected code to currency \"\(String(describing: currency))\" is found while currency \"(\(String(describing: Currency.russianRuble))\" is expected")
    }
    
    func testRussianRubleCurrency() {
        let currency = Currency.russianRuble
        
        let code = Currency.codeOfCurrency(currency)
        
        XCTAssertTrue(code == "RUB", "Unexpected currency to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "RUB"))\" is expected")
    }
    
}
