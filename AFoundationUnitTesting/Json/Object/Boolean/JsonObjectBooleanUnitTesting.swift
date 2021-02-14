//
//  JsonObjectBooleanUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 19.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonObjectBooleanUnitTesting: XCTestCase {

    func testBooleanValue() {
        let key: String = "key"
        let value: JsonBoolean = JsonBoolean(bool: true)
        let object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.boolean(key)
            
            XCTAssert(actualValue == value, "Object returned unexpected boolean \"\(String(describing: actualValue))\" while boolean \"(\(String(describing: value))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNotBooleanValue() {
        let key: String = "key"
        let value: String = "string"
        let object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.boolean(key)
            
            XCTFail("Error \(JsonValueIsNotBooleanError.self) has to be thrown, but boolean \"\(String(describing: actualValue))\" is returned")
        } catch _ as JsonValueIsNotBooleanError {
            
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
        }
    }
    
    func testMissingBooleanValue() {
        let key: String = "key"
        let value: JsonBoolean = JsonBoolean(bool: false)
        let object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.boolean("anotherKey")
            
            XCTFail("Error \(JsonErrorValueMissing.self) has to be thrown, but boolean \"\(String(describing: actualValue))\" is returned")
        } catch _ as JsonErrorValueMissing {
            
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
        }
    }
    
}
