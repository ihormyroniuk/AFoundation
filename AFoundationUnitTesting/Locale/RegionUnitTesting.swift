//
//  HardcodedCountriesCodesUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class RegionUnitTesting: XCTestCase {
    
    // MARK: Armenia
    
    private let armeniaCode = "AM"

    func testInitArmeniaCode() {
        let code = armeniaCode
        
        let region: Region
        do { region = try Region(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(region == .armenia, "Unexpected region \"\(region))\" is found while region \"(\(Region.armenia))\" is expected")
    }
    
    func testArmeniaCode() {
        let region = Region.armenia
        
        let code = region.code
        
        XCTAssertTrue(code == armeniaCode, "Unexpected code \"\(code))\" is found while code \"(\(armeniaCode))\" is expected")
    }
    
    // MARK: Ukraine
    
    private let ukraineCode = "UA"

    func testInitUkraineCode() {
        let code = ukraineCode
        
        let region: Region
        do { region = try Region(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(region == .ukraine, "Unexpected region \"\(region))\" is found while region \"(\(Region.armenia))\" is expected")
    }
    
    func testUkraineCode() {
        let region = Region.ukraine
        
        let code = region.code
        
        XCTAssertTrue(code == ukraineCode, "Unexpected code \"\(code))\" is found while code \"(\(ukraineCode))\" is expected")
    }
    
    // MARK: Russian
    
    private let russiaCode = "RU"

    func testInitRussiaCode() {
        let code = russiaCode
        
        let region: Region
        do { region = try Region(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(region == .russia, "Unexpected region \"\(region))\" is found while region \"(\(Region.russia))\" is expected")
    }
    
    func testRussiaCode() {
        let region = Region.russia
        
        let code = region.code
        
        XCTAssertTrue(code == russiaCode, "Unexpected code \"\(code))\" is found while code \"(\(russiaCode))\" is expected")
    }
    
    // MARK: Unknown Code
    
    func testInitUnknownCode() {
        let code = "UNKNOWNCODE"
        
        let region: Region
        do { region = try Region(code: code) } catch {
            if error is Region.UnknownCodeError {
                return
            } else {
                XCTFail("Unexpected error \(error.self) is thrown")
                return
            }
        }
        
        XCTFail("Unexpected currency \"\(region))\" is found while error \(Region.UnknownCodeError.self) has to be thrown")
    }
    
    // MARK: RegionUnknownCodeError
    
    func testRegionUnknownCodeErrorDescriptionString() {
        let code = "UNKNOWNCODE"
        let error = Region.UnknownCodeError(code: code)
        
        let errorDescriptionString = "\(error)"
        
        let descriptionString = "Could not initialize \(Region.self) with code \(String.self) \"\(code)\""
        XCTAssertTrue(errorDescriptionString == descriptionString, "Unexpected description string \(errorDescriptionString)) is found but description string \(descriptionString) is expected")
    }
}
