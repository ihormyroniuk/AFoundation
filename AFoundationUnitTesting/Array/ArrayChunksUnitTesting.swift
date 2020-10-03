//
//  ArrayChunksUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class ArrayChunksUnitTesting: XCTestCase {

    func testEmpty() {
        let array: [Int] = []
        
        let chunks = array.chunks(size: 3)
        
        let expectedChunks: [[Int]] = []
        XCTAssertTrue(chunks == expectedChunks, "Unexpected chunks \"\(String(describing: expectedChunks))\" are found while chunks \"(\(String(describing: chunks))\" are expected")
    }
    
    func testOneEqualChunk() {
        let array: [Int] = [1, 2, 3]
        
        let chunks = array.chunks(size: 3)
        
        let expectedChunks: [[Int]] = [[1, 2, 3]]
        XCTAssertTrue(chunks == expectedChunks, "Unexpected chunks \"\(String(describing: expectedChunks))\" are found while chunks \"(\(String(describing: chunks))\" are expected")
    }
    
    func testTwoEqualChunks() {
        let array: [Int] = [1, 2, 3, 4, 5, 6]
        
        let chunks = array.chunks(size: 3)
        
        let expectedChunks: [[Int]] = [[1, 2, 3], [4, 5, 6]]
        XCTAssertTrue(chunks == expectedChunks, "Unexpected chunks \"\(String(describing: expectedChunks))\" are found while chunks \"(\(String(describing: chunks))\" are expected")
    }
    
    func testThreeNotEqualChunks() {
        let array: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]
        
        let chunks = array.chunks(size: 3)
        
        let expectedChunks: [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8]]
        XCTAssertTrue(chunks == expectedChunks, "Unexpected chunks \"\(String(describing: expectedChunks))\" are found while chunks \"(\(String(describing: chunks))\" are expected")
    }
    
}
