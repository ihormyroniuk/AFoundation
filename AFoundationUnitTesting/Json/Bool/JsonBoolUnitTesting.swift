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
        let object: JsonObject = [objectKey: objectValue]
        
        do {
            let value = try object.boolForKey("key")
            
            XCTAssert(value == objectValue, "Value \(String(describing: value)) is not equal to object value \(String(describing: objectValue))")
        } catch {
            XCTFail("Error \(error) is throwed")
        }
    }
    
    func testBoolForKeyFalse() {
        let objectKey = "key"
        let objectValue = false
        let object: JsonObject = [objectKey: objectValue]
        
        do {
            let value = try object.boolForKey("key")
            
            XCTAssert(value == objectValue, "Value \(String(describing: value)) is not equal to object value \(String(describing: objectValue))")
        } catch {
            XCTFail("Error \(error) is throwed")
        }
    }
    
    func testBoolForKeyKeyIsMissing() {
        let objectKey = "key"
        let objectValue = false
        let object: JsonObject = [objectKey: objectValue]
        
        do {
            let value = try object.boolForKey("anotherKey")
            
            XCTFail("Value is equal to \(value). But error \(JsonParsingErrorObjectValueForKeyIsNotBool.self) must be throwed.")
        } catch let error as JsonParsingErrorObjectKeyIsMissing {
            
        } catch {
            XCTFail("Error \(error) is throwed")
        }
    }

}
