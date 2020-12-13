//
//  HardcodedLanguagesCodesUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class LanguageUnitTesting: XCTestCase {
    
    // MARK: English
    
    private let englishCode = "en"

    func testInitEnglishCode() {
        let code = englishCode
        
        let language: Language
        do {
            language = try Language(code: code)
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .english, "Unexpected language \"\(language))\" is found while language \"(\(Language.english))\" is expected")
    }
    
    func testEnglishCode() {
        let language = Language.english
        
        let code = language.code
        
        XCTAssertTrue(code == englishCode, "Unexpected code \"\(code))\" is found while code \"(\(englishCode))\" is expected")
    }
    
    // MARK: English Australia
    
    private let englishAustraliaCode = "en-AU"

    func testInitEnglishAustraliaCode() {
        let code = englishAustraliaCode
        
        let language: Language
        do {
            language = try Language(code: code)
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishAustralia, "Unexpected language \"\(language))\" is found while language \"(\(Language.englishAustralia))\" is expected")
    }
    
    func testEnglishAustraliaCode() {
        let language = Language.englishAustralia
        
        let code = language.code
        
        XCTAssertTrue(code == englishAustraliaCode, "Unexpected code \"\(code))\" is found while code \"(\(englishAustraliaCode))\" is expected")
    }
    
    // MARK: English Canada
    
    private let englishCanadaCode = "en-CA"

    func testInitEnglishCanadaCode() {
        let code = englishCanadaCode
        
        let language: Language
        do {
            language = try Language(code: code)
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishCanada, "Unexpected language \"\(language))\" is found while language \"(\(Language.englishCanada))\" is expected")
    }
    
    func testEnglishCanadaCode() {
        let language = Language.englishCanada
        
        let code = language.code
        
        XCTAssertTrue(code == englishCanadaCode, "Unexpected code \"\(code))\" is found while code \"(\(englishCanadaCode))\" is expected")
    }
    
    // MARK: English India
    
    private let englishIndiaCode = "en-IN"

    func testInitEnglishIndiaCode() {
        let code = englishIndiaCode
        
        let language: Language
        do {
            language = try Language(code: code)
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishIndia, "Unexpected language \"\(language))\" is found while language \"(\(Language.englishIndia))\" is expected")
    }
    
    func testEnglishIndiaCode() {
        let language = Language.englishIndia
        
        let code = language.code
        
        XCTAssertTrue(code == englishIndiaCode, "Unexpected code \"\(code))\" is found while code \"(\(englishIndiaCode))\" is expected")
    }
    
    // MARK: English Ireland
    
    private let englishIrelandCode = "en-IE"

    func testInitEnglishIrelandCode() {
        let code = englishIrelandCode
        
        let language: Language
        do {
            language = try Language(code: code)
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishIreland, "Unexpected language \"\(language))\" is found while language \"(\(Language.englishIreland))\" is expected")
    }
    
    func testEnglishIrelandCode() {
        let language = Language.englishIreland
        
        let code = language.code
        
        XCTAssertTrue(code == englishIrelandCode, "Unexpected code \"\(code))\" is found while code \"(\(englishIrelandCode))\" is expected")
    }
    
    // MARK: English New Zealand
    
    private let englishNewZealandCode = "en-NZ"

    func testInitEnglishNewZealandCode() {
        let code = englishNewZealandCode
        
        let language: Language
        do {
            language = try Language(code: code)
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishNewZealand, "Unexpected language \"\(language))\" is found while language \"(\(Language.englishNewZealand))\" is expected")
    }
    
    func testEnglishNewZealandCode() {
        let language = Language.englishNewZealand
        
        let code = language.code
        
        XCTAssertTrue(code == englishNewZealandCode, "Unexpected code \"\(code))\" is found while code \"(\(englishNewZealandCode))\" is expected")
    }
    
    // MARK: English Singapore
    
    private let englishSingaporeCode = "en-SG"

    func testInitEnglishSingaporeCode() {
        let code = englishSingaporeCode
        
        let language: Language
        do {
            language = try Language(code: code)
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishSingapore, "Unexpected language \"\(language))\" is found while language \"(\(Language.englishSingapore))\" is expected")
    }
    
    func testEnglishSingaporeCode() {
        let language = Language.englishSingapore
        
        let code = language.code
        
        XCTAssertTrue(code == englishSingaporeCode, "Unexpected code \"\(code))\" is found while code \"(\(englishSingaporeCode))\" is expected")
    }
    
    // MARK: English South Africa
    
    private let englishSouthAfricaCode = "en-ZA"

    func testInitEnglishSouthAfricaCode() {
        let code = englishSouthAfricaCode
        
        let language: Language
        do {
            language = try Language(code: code)
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishSouthAfrica, "Unexpected language \"\(language))\" is found while language \"(\(Language.englishSouthAfrica))\" is expected")
    }
    
    func testEnglishSouthAfricaCode() {
        let language = Language.englishSouthAfrica
        
        let code = language.code
        
        XCTAssertTrue(code == englishSouthAfricaCode, "Unexpected code \"\(code))\" is found while code \"(\(englishSouthAfricaCode))\" is expected")
    }
    
    // MARK: English UK
    
    private let englishUKCode = "en-GB"

    func testInitEnglishUKCode() {
        let code = englishUKCode
        
        let language: Language
        do {
            language = try Language(code: code)
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishUK, "Unexpected language \"\(language))\" is found while language \"(\(Language.englishUK))\" is expected")
    }
    
    func testEnglishUKCode() {
        let language = Language.englishUK
        
        let code = language.code
        
        XCTAssertTrue(code == englishUKCode, "Unexpected code \"\(code))\" is found while code \"(\(englishUKCode))\" is expected")
    }
    
    // MARK: English UK
    
    private let englishUSCode = "en-US"

    func testInitEnglishUSCode() {
        let code = englishUSCode
        
        let language: Language
        do {
            language = try Language(code: code)
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .englishUS, "Unexpected language \"\(language))\" is found while language \"(\(Language.englishUS))\" is expected")
    }
    
    func testEnglishUSCode() {
        let language = Language.englishUS
        
        let code = language.code
        
        XCTAssertTrue(code == englishUSCode, "Unexpected code \"\(code))\" is found while code \"(\(englishUSCode))\" is expected")
    }
    
    // MARK: Russian
    
    private let russianCode = "ru"

    func testInitRussianCode() {
        let code = russianCode
        
        let language: Language
        do {
            language = try Language(code: code)
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .russian, "Unexpected language \"\(language))\" is found while language \"(\(Language.russian))\" is expected")
    }
    
    func testRussianCode() {
        let language = Language.russian
        
        let code = language.code
        
        XCTAssertTrue(code == russianCode, "Unexpected code \"\(code))\" is found while code \"(\(russianCode))\" is expected")
    }
    
    // MARK: Ukrainian
    
    private let ukrainianCode = "uk"

    func testInitUkrainianCode() {
        let code = ukrainianCode
        
        let language: Language
        do {
            language = try Language(code: code)
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .ukrainian, "Unexpected language \"\(language))\" is found while language \"(\(Language.ukrainian))\" is expected")
    }
    
    func testUkrainianCode() {
        let language = Language.ukrainian
        
        let code = language.code
        
        XCTAssertTrue(code == ukrainianCode, "Unexpected code \"\(code))\" is found while code \"(\(ukrainianCode))\" is expected")
    }
    
}
