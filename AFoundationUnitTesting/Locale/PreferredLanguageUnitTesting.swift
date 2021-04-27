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
