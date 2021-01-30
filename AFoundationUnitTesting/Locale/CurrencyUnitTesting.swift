//
//  HardcodedCurrenciesCodesUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class CurrencyUnitTesting: XCTestCase {
    
    // MARK: United States Dollar
    
    private let unitedStatesDollarCode = "USD"

    func testInitUnitedStatesDollarCode() {
        let code = unitedStatesDollarCode
        
        let currency: Currency
        do { currency = try Currency(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(currency == .unitedStatesDollar, "Unexpected currency \"\(currency))\" is found while currency \"(\(Currency.unitedStatesDollar))\" is expected")
    }
    
    func testUnitedStatesDollarCode() {
        let currency = Currency.unitedStatesDollar
        
        let code = currency.code
        
        XCTAssertTrue(code == unitedStatesDollarCode, "Unexpected code \"\(code))\" is found while code \"(\(unitedStatesDollarCode))\" is expected")
    }
    
    // MARK: Ukrainian Hryvnia
    
    private let ukrainianHryvniaCode = "UAH"
    
    func testInitUkrainianHryvniaCode() {
        let code = ukrainianHryvniaCode

        let currency: Currency
        do { currency = try Currency(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(currency == .ukrainianHryvnia, "Unexpected currency \"\(currency))\" is found while currency \"(\(Currency.ukrainianHryvnia))\" is expected")
    }
    
    func testUkrainianHryvniaCode() {
        let currency = Currency.ukrainianHryvnia
        
        let code = currency.code
        
        XCTAssertTrue(code == ukrainianHryvniaCode, "Unexpected code \"\(code))\" is found while code \"(\(ukrainianHryvniaCode))\" is expected")
    }
    
    // MARK: Russian Ruble
    
    private let russianRubbleCode = "RUB"
    
    func testInitRussianRubleCode() {
        let code = russianRubbleCode
        
        let currency: Currency
        do { currency = try Currency(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(currency == .russianRuble, "Unexpected currency \"\(currency))\" is found while currency \"(\(Currency.russianRuble))\" is expected")
    }
    
    func testRussianRubleCode() {
        let currency = Currency.russianRuble
        
        let code = currency.code
        
        XCTAssertTrue(code == russianRubbleCode, "Unexpected code \"\(code))\" is found while code \"(\(russianRubbleCode))\" is expected")
    }
    
    // MARK: Unknown Code
    
    func testInitUnknownCode() {
        let code = "UNKNOWNCODE"
        
        let currency: Currency
        do { currency = try Currency(code: code) } catch {
            if error is CurrencyUnknownCodeError {
                return
            } else {
                XCTFail("Unexpected error \(error.self) is thrown")
                return
            }
        }
        
        XCTFail("Unexpected currency \"\(currency))\" is found while error \(LanguageUnknownCodeError.self) has to be thrown")
    }
    
    // MARK: CurrencyUnknownCodeError
    
    func testCurrencyUnknownCodeErrorDescriptionString() {
        let code = "UNKNOWNCODE"
        let error = CurrencyUnknownCodeError(code: code)
        
        let errorDescriptionString = "\(error)"
        
        let descriptionString = "Code \"\(code)\" is unknown to \(Currency.self)"
        XCTAssertTrue(errorDescriptionString == descriptionString, "Unexpected description string \(errorDescriptionString)) is found but description string \(descriptionString) is expected")
    }
    
}
