//
//  PreferredLanguageUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 30.01.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class PreferredLanguageUnitTesting: XCTestCase {
    
    // MARK: English
    
    private let englishCode = "en"

    func testInitEnglishCode() {
        let code = englishCode
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .english, "Unexpected language \"\(language))\" is found while language \"(\(PreferredLanguage.english))\" is expected")
    }
    
    func testEnglishCode() {
        let language = PreferredLanguage.english
        
        let code = language.code
        
        XCTAssertTrue(code == englishCode, "Unexpected code \"\(code))\" is found while code \"(\(englishCode))\" is expected")
    }
    
    // MARK: English Australia
    
    private let englishAustraliaCode = "en-AU"

    func testInitEnglishAustraliaCode() {
        let code = englishAustraliaCode
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishAustralia, "Unexpected language \"\(language))\" is found while language \"(\(PreferredLanguage.englishAustralia))\" is expected")
    }
    
    func testEnglishAustraliaCode() {
        let language = PreferredLanguage.englishAustralia
        
        let code = language.code
        
        XCTAssertTrue(code == englishAustraliaCode, "Unexpected code \"\(code))\" is found while code \"(\(englishAustraliaCode))\" is expected")
    }
    
    // MARK: English Canada
    
    private let englishCanadaCode = "en-CA"

    func testInitEnglishCanadaCode() {
        let code = englishCanadaCode
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishCanada, "Unexpected language \"\(language))\" is found while language \"(\(PreferredLanguage.englishCanada))\" is expected")
    }
    
    func testEnglishCanadaCode() {
        let language = PreferredLanguage.englishCanada
        
        let code = language.code
        
        XCTAssertTrue(code == englishCanadaCode, "Unexpected code \"\(code))\" is found while code \"(\(englishCanadaCode))\" is expected")
    }
    
    // MARK: English India
    
    private let englishIndiaCode = "en-IN"

    func testInitEnglishIndiaCode() {
        let code = englishIndiaCode
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishIndia, "Unexpected language \"\(language))\" is found while language \"(\(PreferredLanguage.englishIndia))\" is expected")
    }
    
    func testEnglishIndiaCode() {
        let language = PreferredLanguage.englishIndia
        
        let code = language.code
        
        XCTAssertTrue(code == englishIndiaCode, "Unexpected code \"\(code))\" is found while code \"(\(englishIndiaCode))\" is expected")
    }
    
    // MARK: English Ireland
    
    private let englishIrelandCode = "en-IE"

    func testInitEnglishIrelandCode() {
        let code = englishIrelandCode
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishIreland, "Unexpected language \"\(language))\" is found while language \"(\(PreferredLanguage.englishIreland))\" is expected")
    }
    
    func testEnglishIrelandCode() {
        let language = PreferredLanguage.englishIreland
        
        let code = language.code
        
        XCTAssertTrue(code == englishIrelandCode, "Unexpected code \"\(code))\" is found while code \"(\(englishIrelandCode))\" is expected")
    }
    
    // MARK: English New Zealand
    
    private let englishNewZealandCode = "en-NZ"

    func testInitEnglishNewZealandCode() {
        let code = englishNewZealandCode
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishNewZealand, "Unexpected language \"\(language))\" is found while language \"(\(PreferredLanguage.englishNewZealand))\" is expected")
    }
    
    func testEnglishNewZealandCode() {
        let language = PreferredLanguage.englishNewZealand
        
        let code = language.code
        
        XCTAssertTrue(code == englishNewZealandCode, "Unexpected code \"\(code))\" is found while code \"(\(englishNewZealandCode))\" is expected")
    }
    
    // MARK: English Singapore
    
    private let englishSingaporeCode = "en-SG"

    func testInitEnglishSingaporeCode() {
        let code = englishSingaporeCode
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishSingapore, "Unexpected language \"\(language))\" is found while language \"(\(PreferredLanguage.englishSingapore))\" is expected")
    }
    
    func testEnglishSingaporeCode() {
        let language = PreferredLanguage.englishSingapore
        
        let code = language.code
        
        XCTAssertTrue(code == englishSingaporeCode, "Unexpected code \"\(code))\" is found while code \"(\(englishSingaporeCode))\" is expected")
    }
    
    // MARK: English Singapore
    
    private let englishSouthAfricaCode = "en-ZA"

    func testInitEnglishSouthAfricaCode() {
        let code = englishSouthAfricaCode
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishSouthAfrica, "Unexpected language \"\(language))\" is found while language \"(\(PreferredLanguage.englishSouthAfrica))\" is expected")
    }
    
    func testEnglishSouthAfricaCode() {
        let language = PreferredLanguage.englishSouthAfrica
        
        let code = language.code
        
        XCTAssertTrue(code == englishSouthAfricaCode, "Unexpected code \"\(code))\" is found while code \"(\(englishSouthAfricaCode))\" is expected")
    }
    
    // MARK: English UK
    
    private let englishUKCode = "en-GB"

    func testInitEnglishUKCode() {
        let code = englishUKCode
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishUK, "Unexpected language \"\(language))\" is found while language \"(\(PreferredLanguage.englishUK))\" is expected")
    }
    
    func testEnglishUKCode() {
        let language = PreferredLanguage.englishUK
        
        let code = language.code
        
        XCTAssertTrue(code == englishUKCode, "Unexpected code \"\(code))\" is found while code \"(\(englishUKCode))\" is expected")
    }
    
    // MARK: English US
    
    private let englishUSCode = "en-US"

    func testInitEnglishUSCode() {
        let code = englishUSCode
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishUS, "Unexpected language \"\(language))\" is found while language \"(\(PreferredLanguage.englishUS))\" is expected")
    }
    
    func testEnglishUSCode() {
        let language = PreferredLanguage.englishUS
        
        let code = language.code
        
        XCTAssertTrue(code == englishUSCode, "Unexpected code \"\(code))\" is found while code \"(\(englishUSCode))\" is expected")
    }
    
    // MARK: Russian
    
    private let russianCode = "ru"

    func testInitRussianCode() {
        let code = russianCode
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .russian, "Unexpected language \"\(language))\" is found while language \"(\(PreferredLanguage.russian))\" is expected")
    }
    
    func testRussianCode() {
        let language = PreferredLanguage.russian
        
        let code = language.code
        
        XCTAssertTrue(code == russianCode, "Unexpected code \"\(code))\" is found while code \"(\(russianCode))\" is expected")
    }
    
    // MARK: Ukrainian
    
    private let ukrainianCode = "uk"

    func testInitUkrainianCode() {
        let code = ukrainianCode
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .ukrainian, "Unexpected language \"\(language))\" is found while language \"(\(PreferredLanguage.ukrainian))\" is expected")
    }
    
    func testUkrainianCode() {
        let language = PreferredLanguage.ukrainian
        
        let code = language.code
        
        XCTAssertTrue(code == ukrainianCode, "Unexpected code \"\(code))\" is found while code \"(\(ukrainianCode))\" is expected")
    }
    
    // MARK: Unknown Code
    
    func testInitUnknownCode() {
        let code = "UNKNOWNCODE"
        
        let language: PreferredLanguage
        do { language = try PreferredLanguage(code: code) } catch {
            return
        }
        
        XCTFail("Unexpected language \"\(language))\" is found while error has to be thrown")
    }
    
}
