//
//  ScriptUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 31.01.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class ScriptUnitTesting: XCTestCase {
    
    // MARK: English
    
    private let arabicCode = "Arab"

    func testInitArabicCode() {
        let code = arabicCode
        
        let script: Script
        do { script = try Script(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(script == .arabic, "Unexpected script \"\(script))\" is found while script \"(\(Script.arabic))\" is expected")
    }
    
    func testArabicCode() {
        let script = Script.arabic
        
        let code = script.code
        
        XCTAssertTrue(code == arabicCode, "Unexpected code \"\(code))\" is found while code \"(\(arabicCode))\" is expected")
    }

    // MARK: Unknown Code
    
    func testInitUnknownCode() {
        let code = "UNKNOWNCODE"
        
        let script: Script
        do { script = try Script(code: code) } catch {
            if error is ScriptUnknownCodeError {
                return
            } else {
                XCTFail("Unexpected error \(error.self) is thrown")
                return
            }
        }
        
        XCTFail("Unexpected script \"\(script))\" is found while error \(ScriptUnknownCodeError.self) has to be thrown")
    }
    
    // MARK: RegionUnknownCodeError
    
    func testLanguageUnknownCodeErrorDescriptionString() {
        let code = "UNKNOWNCODE"
        let error = ScriptUnknownCodeError(code: code)
        
        let errorDescriptionString = "\(error)"
        
        let descriptionString = "Code \"\(code)\" is unknown to \(Script.self)"
        XCTAssertTrue(errorDescriptionString == descriptionString, "Unexpected description \(errorDescriptionString)) is found but description \(descriptionString) is expected")
    }
    
}
