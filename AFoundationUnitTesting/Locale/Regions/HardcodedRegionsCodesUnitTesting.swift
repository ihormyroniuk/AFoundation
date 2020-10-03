//
//  HardcodedCountriesCodesUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class HardcodedRegionsCodesUnitTesting: XCTestCase {

    func testArmeniaCode() {
        let regionsCodes = HardcodedRegionsCodes()
        let code = "AM"
        
        let region = regionsCodes.regionByCode(code)
        
        XCTAssertTrue(region == .armenia, "Unexpected code to region \"\(String(describing: region))\" is found while region \"(\(String(describing: Region.armenia))\" is expected")
    }
    
    func testArmeniaRegion() {
        let regionsCodes = HardcodedRegionsCodes()
        let country = Region.armenia
        
        let code = regionsCodes.codeOfRegion(country)
        
        XCTAssertTrue(code == "AM", "Unexpected region to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "AM"))\" is expected")
    }
    
    func testRussiaCode() {
        let regionsCodes = HardcodedRegionsCodes()
        let code = "RU"
        
        let region = regionsCodes.regionByCode(code)
        
        XCTAssertTrue(region == .russia, "Unexpected code to region \"\(String(describing: region))\" is found while region \"(\(String(describing: Region.russia))\" is expected")
    }
    
    func testRussiaRegion() {
        let regionsCodes = HardcodedRegionsCodes()
        let country = Region.russia
        
        let code = regionsCodes.codeOfRegion(country)
        
        XCTAssertTrue(code == "RU", "Unexpected region to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "RU"))\" is expected")
    }
    
    func testUkraineCode() {
        let regionsCodes = HardcodedRegionsCodes()
        let code = "UA"
        
        let region = regionsCodes.regionByCode(code)
        
        XCTAssertTrue(region == .ukraine, "Unexpected code to region \"\(String(describing: region))\" is found while region \"(\(String(describing: Region.ukraine))\" is expected")
    }
    
    func testUkraineRegion() {
        let regionsCodes = HardcodedRegionsCodes()
        let country = Region.ukraine
        
        let code = regionsCodes.codeOfRegion(country)
        
        XCTAssertTrue(code == "UA", "Unexpected region to code \"\(String(describing: code))\" is found while code \"(\(String(describing: "UA"))\" is expected")
    }

}
