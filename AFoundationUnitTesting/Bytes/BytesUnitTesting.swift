//
//  BytesUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 3/3/20.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class BytesUnitTesting: XCTestCase {

    private var testBytes: Bytes {
        let bytes: Bytes = [0x55, 0x01, 0x03, 0x73, 0x99]
        return bytes
    }

    func testAdditionAssignmentOperatorBytes() {
        var bytes = testBytes

        bytes += [0x53, 0x41]

        let expectedBytes: Bytes = [0x55, 0x01, 0x03, 0x73, 0x99, 0x53, 0x41]
        assert(bytes == expectedBytes, "Actual bytes [\(bytes)] is not equal to [\(expectedBytes)]")
    }

    func testAdditionAssignmentOperatorByte() {
        var bytes = testBytes

        bytes += 0x53

        let expectedBytes: Bytes = [0x55, 0x01, 0x03, 0x73, 0x99, 0x53]
        assert(bytes == expectedBytes, "Actual bytes [\(bytes)] is not equal to [\(expectedBytes)]")
    }

}
