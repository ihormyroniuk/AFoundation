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
    }
    
}
