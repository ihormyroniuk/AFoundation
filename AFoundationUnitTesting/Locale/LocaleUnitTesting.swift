//
//  LocaleUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 30.01.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class LocaleUnitTesting: XCTestCase {
    
    // MARK: Init
    
    func testInitLanguage() {
        do {
            let language = Language.english
            
            let locale = Locale(language: .english, script: nil, region: nil)
            let localeLanguage = try locale.language()
            
            XCTAssertTrue(localeLanguage == language, "Unexpected \"\(String(reflecting: localeLanguage)))\" is found but \"(\(String(reflecting: language)))\" is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testInitLanguageScript() {
        do {
            let language = Language.english
            let script = Script.arabic
            
            let locale = Locale(language: .english, script: script, region: nil)
            let localeLanguage = try locale.language()
            let localeScript = try locale.script()
            
            XCTAssertTrue(localeLanguage == language, "Unexpected \"\(String(reflecting: localeLanguage)))\" is found but \"(\(String(reflecting: language)))\" is expected")
            XCTAssertTrue(localeScript == script, "Unexpected \"\(String(reflecting: localeScript)))\" is found but \"(\(String(reflecting: script)))\" is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testInitLanguageScriptRegion() {
        do {
            let language = Language.english
            let script = Script.arabic
            let region = Region.russia
            
            let locale = Locale(language: .english, script: script, region: region)
            let localeLanguage = try locale.language()
            let localeScript = try locale.script()
            let localeRegion = try locale.region()
            
            XCTAssertTrue(localeLanguage == language, "Unexpected \"\(String(reflecting: localeLanguage)))\" is found but \"(\(String(reflecting: language)))\" is expected")
            XCTAssertTrue(localeScript == script, "Unexpected \"\(String(reflecting: localeScript)))\" is found but \"(\(String(reflecting: script)))\" is expected")
            XCTAssertTrue(localeRegion == region, "Unexpected \"\(String(reflecting: localeRegion)))\" is found but \"(\(String(reflecting: region)))\" is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    // MARK: Language
    
    func testLanguage() {
        let locale = Locale(identifier: "en")

        let language: Language?
        do { language = try locale.language() } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
            return
        }
        
        let expectedLanguage = Language.english
        XCTAssertTrue(language == expectedLanguage, "Unexpected \"\(String(reflecting: language)))\" is found but \"(\(expectedLanguage))\" is expected")
    }
    
    func testLanguageError() {
        let locale = Locale(identifier: "UNKNOWN")

        let language: Language?
        do { language = try locale.language() } catch {
            return
        }
        
        XCTFail("Unexpected \(String(reflecting: language)) is found")
    }
    
    func testLanguageNil() {
        let locale = Locale(identifier: "")

        let language: Language?
        do { language = try locale.language() } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
            return
        }
        
        XCTAssertTrue(language == nil, "Unexpected \"\(String(reflecting: language)))\" is found but nil is expected")
    }
    
    // MARK: Script

    func testScript() {
        let locale = Locale(identifier: "en-Arab")

        let script: Script?
        do { script = try locale.script() } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
            return
        }
        
        let expectedScript = Script.arabic
        XCTAssertTrue(script == expectedScript, "Unexpected \"\(String(reflecting: script)))\" is found but \"(\(expectedScript))\" is expected")
    }
    
    func testScriptError() {
        let locale = Locale(identifier: "en-Hans")

        let script: Script?
        do { script = try locale.script() } catch {
            return
        }
        
        XCTFail("Unexpected \(String(reflecting: script)) is found")
    }
    
    func testScriptNil() {
        let locale = Locale(identifier: "")

        let script: Script?
        do { script = try locale.script() } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
            return
        }
        
        XCTAssertTrue(script == nil, "Unexpected \"\(String(reflecting: script)))\" is found but nil is expected")
    }
    
    // MARK: Region
    
    func testRegion() {
        let locale = Locale(identifier: "en_RU")

        let region: Region?
        do { region = try locale.region() } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
            return
        }
        
        let expectedRegion = Region.russia
        XCTAssertTrue(region == expectedRegion, "Unexpected \"\(String(reflecting: region)))\" is found but \"(\(expectedRegion))\" is expected")
    }
    
    func testRegionError() {
        let locale = Locale(identifier: "en_FR")

        let region: Region?
        do { region = try locale.region() } catch {
            return
        }
        
        XCTFail("Unexpected \(String(reflecting: region)) is found")
    }
    
    func testRegionNil() {
        let locale = Locale(identifier: "")

        let region: Region?
        do { region = try locale.region() } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
            return
        }
        
        XCTAssertTrue(region == nil, "Unexpected \"\(String(reflecting: region)))\" is found but nil is expected")
    }
    
    // MARK: Currency
    
    func testCurrency() {
        let locale = Locale(identifier: "en_RU")

        let currency: Currency?
        do { currency = try locale.currency() } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
            return
        }
        
        let expectedCurrency = Currency.russianRuble
        XCTAssertTrue(currency == expectedCurrency, "Unexpected \"\(String(reflecting: currency)))\" is found but \"(\(expectedCurrency))\" is expected")
    }
    
    func testCurrencyError() {
        let locale = Locale(identifier: "en_FR")

        let currency: Currency?
        do { currency = try locale.currency() } catch {
            return
        }
        
        XCTFail("Unexpected \(String(reflecting: currency)) is found")
    }
    
    func testCurrencyNil() {
        let locale = Locale(identifier: "")

        let currency: Currency?
        do { currency = try locale.currency() } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
            return
        }
        
        XCTAssertTrue(currency == nil, "Unexpected \"\(String(reflecting: currency)))\" is found but nil is expected")
    }
    
}
