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
    
    // MARK: Unknown Code
    
    func testInitUnknownCode() {
        let code = "UNKNOWNCODE"
        
        let currency: Currency
        do { currency = try Currency(code: code) } catch {
            let errorDebugDescription = String(reflecting: error)
            let expectedErrorDebugDescription = "AFoundation/Currency.swift:20 Cannot initialize AFoundation.Currency with code \"UNKNOWNCODE\""
            XCTAssertTrue(errorDebugDescription == expectedErrorDebugDescription, "Unexpected error debug description \"\(errorDebugDescription))\" is found while error debug description \"(\(expectedErrorDebugDescription))\" is expected")
            return
        }
        
        XCTFail("Unexpected currency \"\(currency))\" is found while error has to be thrown")
    }
    
}
