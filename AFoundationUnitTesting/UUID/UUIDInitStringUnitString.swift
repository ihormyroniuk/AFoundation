//
//  UUIDInitStringUnitString.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 28.11.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class UUIDInitStringUnitString: XCTestCase {
    
    func testUuidString() {
        let string = "123e4567-e89b-12d3-a456-426655440000"
        
        let uuid: UUID
        do { uuid = try UUID(string) } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        let expectedUuid = UUID(uuidString: "123e4567-e89b-12d3-a456-426655440000")
        XCTAssertTrue(uuid == expectedUuid, "Unexpected UUID \(uuid)) is returned, but UUID \(String(describing: expectedUuid)) is expected")
    }
    
    func testNotUuidString() {
        let string = ""
        
        let uuid: UUID
        do { uuid = try UUID(string) } catch {
            return
        }
        
        XCTFail("Unexpected URL \"\(String(describing: uuid))\" is returned while error has to be thrown")
    }
    
}
