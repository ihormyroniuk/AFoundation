//
//  JsonObjectOptionalStringUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonObjectOptionalStringUnitTesting: XCTestCase {

    func testStringValue() {
        let key = "key"
        let value = "string"
        var object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.optionalString(key)
            
            XCTAssert(actualValue == value, "Object returned unexpected string \"\(String(describing: actualValue))\" while string \"(\(String(describing: value))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testMissingStringValue() {
        let key = "key"
        let value: JsonValue? = nil
        var object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.optionalString(key)
            
            XCTAssertTrue(actualValue == nil, "Object returned unexpected string \"\(String(describing: actualValue))\" while string \"(\(String(describing: value))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
        }
    }
    
    func testNotStringValue() {
        let key = "key"
        let value = true
        var object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.optionalString(key)
            
            XCTFail("Error \(JsonErrorValueNotString.self) has to be thrown, but string \"\(String(describing: actualValue))\" is returned")
        } catch _ as JsonErrorValueNotString {
            
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
        }
    }
    
}
