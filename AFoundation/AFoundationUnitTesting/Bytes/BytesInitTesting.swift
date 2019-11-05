//
//  BytesInitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 10/25/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import AFoundation
import XCTest

class BytesInitTesting: XCTestCase {
    
    func testExample() {
        var actualBytes: Bytes = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]
        actualBytes += [0x08, 0x09]
        let expectedBytes: Bytes = [0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09]
        XCTAssert(actualBytes == expectedBytes)
    }
    
}
