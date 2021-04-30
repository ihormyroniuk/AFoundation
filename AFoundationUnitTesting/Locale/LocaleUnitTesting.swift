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
    
    func testInitLanguage() {
        let language = Language.english
        let region: Region? = nil
        let script: Script? = nil
        
        let locale = Locale(language: language, script: script, region: region)

        let localeLanguage: Language?
        do { localeLanguage = try locale.language() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        let localeRegion: Region?
        do { localeRegion = try locale.region() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        let localeScript: Script?
        do { localeScript = try locale.script() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        let localeCurrency: Currency?
        do { localeCurrency = try locale.currency() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(localeLanguage == language, "Unexpected language \"\(String(reflecting: localeLanguage)))\" is found while language \"(\(language))\" is expected")
        XCTAssertTrue(localeScript == script, "Unexpected script \"\(String(reflecting: localeScript)))\" is found while script \"(\(String(reflecting: script)))\" is expected")
        XCTAssertTrue(localeRegion == region, "Unexpected region \"\(String(reflecting: localeRegion)))\" is found while region \"(\(String(reflecting: region)))\" is expected")
        XCTAssertTrue(localeCurrency == nil, "Unexpected currency \"\(String(describing: localeCurrency)))\" is found while nil is expected")
    }
    
    func testInitLanguageRegion() {
        let language = Language.english
        let region = Region.ukraine
        let script = Script.arabic
        
        let locale = Locale(language: language, script: script, region: region)

        let localeLanguage: Language?
        do { localeLanguage = try locale.language() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        let localeRegion: Region?
        do { localeRegion = try locale.region() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        let localeScript: Script?
        do { localeScript = try locale.script() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        let localeCurrency: Currency?
        do { localeCurrency = try locale.currency() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(localeLanguage == language, "Unexpected language \"\(String(describing: localeLanguage)))\" is found while language \"(\(language))\" is expected")
        XCTAssertTrue(localeScript == script, "Unexpected script \"\(String(describing: localeScript)))\" is found while script \"(\(script))\" is expected")
        XCTAssertTrue(localeRegion == region, "Unexpected region \"\(String(describing: localeRegion)))\" is found while region \"(\(region))\" is expected")
        XCTAssertTrue(localeCurrency == Currency.ukrainianHryvnia, "Unexpected currency \"\(String(describing: localeCurrency)))\" is found while currency \"(\(Currency.ukrainianHryvnia))\" is expected")
    }
    
    func testPreferredLanguages() {
        do {  _ = try Locale.preferredLanguages() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
    }

}
