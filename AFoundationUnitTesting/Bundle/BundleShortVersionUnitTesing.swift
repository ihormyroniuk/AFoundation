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
    
    func testSchemeHost() {
        let bundle = Bundle.main
        
        let shortVersion = bundle.shortVersion
        
        let expectedShortVersion = "13.1"
        XCTAssertTrue(shortVersion == expectedShortVersion, "Unexpected short version \(String(describing: shortVersion))) is returned, but short version \(String(describing: expectedShortVersion)) is expected")
    }
    
}
