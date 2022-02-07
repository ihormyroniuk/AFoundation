//
//  BundleShortVersionUnitTesing.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 09.01.2022.
//  Copyright © 2022 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class BundleShortVersionUnitTesing: XCTestCase {
    
    func testNotNil() {
        let bundle = MockBundle()
        bundle.mockInfoDictionary = ["CFBundleShortVersionString" : "1.0.0"]
        
        let shortVersion = bundle.shortVersion
        
        XCTAssertTrue(shortVersion == "1.0.0", "Unexpected short version \(String(describing: shortVersion))) is returned, but 1.0.0 is expected")
    }
    
    func testNil() {
        let bundle = MockBundle()
        bundle.mockInfoDictionary = nil
        
        let shortVersion = bundle.shortVersion
        
        XCTAssertNil(shortVersion, "Unexpected short version \(String(describing: shortVersion))) is returned, but nil is expected")
    }
    
}

private class MockBundle: Bundle {
    
    var mockInfoDictionary: [String : Any]?
    override var infoDictionary: [String : Any]? {
        return mockInfoDictionary
    }
    
}
