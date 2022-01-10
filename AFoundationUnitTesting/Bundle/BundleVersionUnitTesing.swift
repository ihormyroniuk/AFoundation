//
//  BundleVersionUnitTesing.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 09.01.2022.
//  Copyright © 2022 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class BundleVersionUnitTesing: XCTestCase {
    
    func testSchemeHost() {
        let bundle = Bundle.main
        
        let version = bundle.version
        
        let expectedVersion = "19455"
        XCTAssertTrue(version == expectedVersion, "Unexpected version \(String(describing: version))) is returned, but version \(String(describing: expectedVersion)) is expected")
    }
    
}
