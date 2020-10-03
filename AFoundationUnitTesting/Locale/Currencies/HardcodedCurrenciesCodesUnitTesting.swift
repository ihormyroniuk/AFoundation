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

class HardcodedCurrenciesCodesUnitTesting: XCTestCase {

    func testUnitedStatesDollarCode() {
        let currenciesCodes = HardcodedCurrenciesCodes()
        let code = "USD"
        
        let currency = currenciesCodes.currencyByCode(code)
        
        XCTAssertTrue(currency == .unitedStatesDollar, "Unexpected code to currency \"\(String(describing: currency))\" is found while currency \"(\(String(describing: Currency.unitedStatesDollar))\" is expected")
    }
    
    func testUnitedStatesDollarCurrency() {
        let currenciesCodes = HardcodedCurrenciesCodes()
        let currency = Currency.unitedStatesDollar
        
        let code = currenciesCodes.codeOfCurrency(currency)
        
        XCTAssertTrue(code == "USD", "Unexpected currency to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "USD"))\" is expected")
    }
    
    func testUkrainianHryvniaCode() {
        let currenciesCodes = HardcodedCurrenciesCodes()
        let code = "UAH"
        
        let currency = currenciesCodes.currencyByCode(code)
        
        XCTAssertTrue(currency == .ukrainianHryvnia, "Unexpected code to currency \"\(String(describing: currency))\" is found while currency \"(\(String(describing: Currency.ukrainianHryvnia))\" is expected")
    }
    
    func testUkrainianHryvniaCurrency() {
        let currenciesCodes = HardcodedCurrenciesCodes()
        let currency = Currency.ukrainianHryvnia
        
        let code = currenciesCodes.codeOfCurrency(currency)
        
        XCTAssertTrue(code == "UAH", "Unexpected currency to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "UAH"))\" is expected")
    }
    
    func testRussianRubleCode() {
        let currenciesCodes = HardcodedCurrenciesCodes()
        let code = "RUB"
        
        let currency = currenciesCodes.currencyByCode(code)
        
        XCTAssertTrue(currency == .russianRuble, "Unexpected code to currency \"\(String(describing: currency))\" is found while currency \"(\(String(describing: Currency.russianRuble))\" is expected")
    }
    
    func testRussianRubleCurrency() {
        let currenciesCodes = HardcodedCurrenciesCodes()
        let currency = Currency.russianRuble
        
        let code = currenciesCodes.codeOfCurrency(currency)
        
        XCTAssertTrue(code == "RUB", "Unexpected currency to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "RUB"))\" is expected")
    }
    
}
