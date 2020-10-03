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

class HardcodedLanguagesCodesUnitTesting: XCTestCase {

    func testEnglishCode() {
        let languagesCodes = HardcodedLanguagesCodes()
        let code = "en"
        
        let language = languagesCodes.languageByCode(code)
        
        XCTAssertTrue(language == .english, "Unexpected code to language \"\(String(describing: language))\" is found while language \"(\(String(describing: Language.english))\" is expected")
    }
    
    func testEnglishLanguage() {
        let languagesCodes = HardcodedLanguagesCodes()
        let language = Language.english
        
        let code = languagesCodes.codeOfLanguage(language)
        
        XCTAssertTrue(code == "en", "Unexpected language to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "en"))\" is expected")
    }
    
    func testEnglishAustraliaCode() {
        let languagesCodes = HardcodedLanguagesCodes()
        let code = "en-AU"
        
        let language = languagesCodes.languageByCode(code)
        
        XCTAssertTrue(language == .englishAustralia, "Unexpected code to language \"\(String(describing: language))\" is found while language \"(\(String(describing: Language.englishAustralia))\" is expected")
    }
    
    func testEnglishAustraliaLanguage() {
        let languagesCodes = HardcodedLanguagesCodes()
        let language = Language.englishAustralia
        
        let code = languagesCodes.codeOfLanguage(language)
        
        XCTAssertTrue(code == "en-AU", "Unexpected language to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "en-AU"))\" is expected")
    }
    
    func testEnglishCanadaCode() {
        let languagesCodes = HardcodedLanguagesCodes()
        let code = "en-CA"
        
        let language = languagesCodes.languageByCode(code)
        
        XCTAssertTrue(language == .englishCanada, "Unexpected code to language \"\(String(describing: language))\" is found while language \"(\(String(describing: Language.englishCanada))\" is expected")
    }
    
    func testEnglishCanadaLanguage() {
        let languagesCodes = HardcodedLanguagesCodes()
        let language = Language.englishCanada
        
        let code = languagesCodes.codeOfLanguage(language)
        
        XCTAssertTrue(code == "en-CA", "Unexpected language to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "en-CA"))\" is expected")
    }
    
    func testEnglishIndiaCode() {
        let languagesCodes = HardcodedLanguagesCodes()
        let code = "en-IN"
        
        let language = languagesCodes.languageByCode(code)
        
        XCTAssertTrue(language == .englishIndia, "Unexpected code to language \"\(String(describing: language))\" is found while language \"(\(String(describing: Language.englishIndia))\" is expected")
    }
    
    func testEnglishIndiaLanguage() {
        let languagesCodes = HardcodedLanguagesCodes()
        let language = Language.englishIndia
        
        let code = languagesCodes.codeOfLanguage(language)
        
        XCTAssertTrue(code == "en-IN", "Unexpected language to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "en-IN"))\" is expected")
    }
    
    func testEnglishIrelandCode() {
        let languagesCodes = HardcodedLanguagesCodes()
        let code = "en-IE"
        
        let language = languagesCodes.languageByCode(code)
        
        XCTAssertTrue(language == .englishIreland, "Unexpected code to language \"\(String(describing: language))\" is found while language \"(\(String(describing: Language.englishIreland))\" is expected")
    }
    
    func testEnglishIrelandLanguage() {
        let languagesCodes = HardcodedLanguagesCodes()
        let language = Language.englishIreland
        
        let code = languagesCodes.codeOfLanguage(language)
        
        XCTAssertTrue(code == "en-IE", "Unexpected language to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "en-IE"))\" is expected")
    }
    
    func testEnglishNewZealandCode() {
        let languagesCodes = HardcodedLanguagesCodes()
        let code = "en-NZ"
        
        let language = languagesCodes.languageByCode(code)
        
        XCTAssertTrue(language == .englishNewZealand, "Unexpected code to language \"\(String(describing: language))\" is found while language \"(\(String(describing: Language.englishNewZealand))\" is expected")
    }
    
    func testEnglishNewZealandLanguage() {
        let languagesCodes = HardcodedLanguagesCodes()
        let language = Language.englishNewZealand
        
        let code = languagesCodes.codeOfLanguage(language)
        
        XCTAssertTrue(code == "en-NZ", "Unexpected language to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "en-NZ"))\" is expected")
    }
    
    func testEnglishSingaporeCode() {
        let languagesCodes = HardcodedLanguagesCodes()
        let code = "en-SG"
        
        let language = languagesCodes.languageByCode(code)
        
        XCTAssertTrue(language == .englishSingapore, "Unexpected code to language \"\(String(describing: language))\" is found while language \"(\(String(describing: Language.englishSingapore))\" is expected")
    }
    
    func testEnglishSingaporeLanguage() {
        let languagesCodes = HardcodedLanguagesCodes()
        let language = Language.englishSingapore
        
        let code = languagesCodes.codeOfLanguage(language)
        
        XCTAssertTrue(code == "en-SG", "Unexpected language to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "en-SG"))\" is expected")
    }
    
    func testEnglishSouthAfricaCode() {
        let languagesCodes = HardcodedLanguagesCodes()
        let code = "en-ZA"
        
        let language = languagesCodes.languageByCode(code)
        
        XCTAssertTrue(language == .englishSouthAfrica, "Unexpected code to language \"\(String(describing: language))\" is found while language \"(\(String(describing: Language.englishSouthAfrica))\" is expected")
    }
    
    func testEnglishSouthAfricaLanguage() {
        let languagesCodes = HardcodedLanguagesCodes()
        let language = Language.englishSouthAfrica
        
        let code = languagesCodes.codeOfLanguage(language)
        
        XCTAssertTrue(code == "en-ZA", "Unexpected language to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "en-ZA"))\" is expected")
    }

    func testEnglishUKCode() {
        let languagesCodes = HardcodedLanguagesCodes()
        let code = "en-GB"
        
        let language = languagesCodes.languageByCode(code)
        
        XCTAssertTrue(language == .englishUK, "Unexpected code to language \"\(String(describing: language))\" is found while language \"(\(String(describing: Language.englishUK))\" is expected")
    }
    
    func testEnglishUKLanguage() {
        let languagesCodes = HardcodedLanguagesCodes()
        let language = Language.englishUK
        
        let code = languagesCodes.codeOfLanguage(language)
        
        XCTAssertTrue(code == "en-GB", "Unexpected language to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "en-GB"))\" is expected")
    }
    
    func testEnglishUSCode() {
        let languagesCodes = HardcodedLanguagesCodes()
        let code = "en-US"
        
        let language = languagesCodes.languageByCode(code)
        
        XCTAssertTrue(language == .englishUS, "Unexpected code to language \"\(String(describing: language))\" is found while language \"(\(String(describing: Language.englishUS))\" is expected")
    }
    
    func testEnglishUSLanguage() {
        let languagesCodes = HardcodedLanguagesCodes()
        let language = Language.englishUS
        
        let code = languagesCodes.codeOfLanguage(language)
        
        XCTAssertTrue(code == "en-US", "Unexpected language to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "en-US"))\" is expected")
    }
    
    func testRussianCode() {
        let languagesCodes = HardcodedLanguagesCodes()
        let code = "ru"
        
        let language = languagesCodes.languageByCode(code)
        
        XCTAssertTrue(language == .russian, "Unexpected code to language \"\(String(describing: language))\" is found while language \"(\(String(describing: Language.russian))\" is expected")
    }
    
    func testRussianLanguage() {
        let languagesCodes = HardcodedLanguagesCodes()
        let language = Language.russian
        
        let code = languagesCodes.codeOfLanguage(language)
        
        XCTAssertTrue(code == "ru", "Unexpected language to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "ru"))\" is expected")
    }
    
    func testUkrainianCode() {
        let languagesCodes = HardcodedLanguagesCodes()
        let code = "uk"
        
        let language = languagesCodes.languageByCode(code)
        
        XCTAssertTrue(language == .ukrainian, "Unexpected code to language \"\(String(describing: language))\" is found while language \"(\(String(describing: Language.ukrainian))\" is expected")
    }
    
    func testUkrainianLanguage() {
        let languagesCodes = HardcodedLanguagesCodes()
        let language = Language.ukrainian
        
        let code = languagesCodes.codeOfLanguage(language)
        
        XCTAssertTrue(code == "uk", "Unexpected language to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "uk"))\" is expected")
    }

}
