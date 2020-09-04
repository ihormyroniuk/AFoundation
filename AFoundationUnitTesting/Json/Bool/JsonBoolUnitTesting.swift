//
//  JsonBoolUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

import XCTest
@testable import AFoundation

class JsonBoolUnitTesting: XCTestCase {
    
    func testBoolForKeyTrue() {
        let objectKey = "key"
        let objectValue = true
        let object: AJsonObject = [objectKey: objectValue]
        
        do {
            let value = try object.jsonBoolean("key")
            
            XCTAssert(value == objectValue, "Value \(String(describing: value)) is not equal to object value \(String(describing: objectValue))")
        } catch {
            XCTFail("Error \(error) is throwed")
        }
    }
    
    func testBoolForKeyFalse() {
        let objectKey = "key"
        let objectValue = false
        let object: AJsonObject = [objectKey: objectValue]
        
        do {
            let value = try object.jsonBoolean("key")
            
            XCTAssert(value == objectValue, "Value \(String(describing: value)) is not equal to object value \(String(describing: objectValue))")
        } catch {
            XCTFail("Error \(error) is throwed")
        }
    }
    
    func testBoolForKeyKeyIsMissing() {
        let objectKey = "key"
        let objectValue = false
        let object: AJsonObject = [objectKey: objectValue]
        
        do {
            let value = try object.jsonBoolean("anotherKey")
            
            XCTFail("Value is equal to \(value). But error \(AJsonErrorValueNotBoolean.self) must be throwed.")
        } catch _ as AJsonErrorValueMissing {
            
        } catch {
            XCTFail("Error \(error) is throwed")
        }
    }

}
