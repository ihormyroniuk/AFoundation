//
//  JsonObjectNullUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 19.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonObjectNullUnitTesting: XCTestCase {

    func testNullValue() {
        let key = "key"
        let value = NSNull()
        var object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.null(key)
            
            XCTAssert(actualValue == value, "Object returned unexpected null \"\(String(describing: actualValue))\" while null \"(\(String(describing: value))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNotNullValue() {
        let key = "key"
        let value = "string"
        var object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.null(key)
            
            XCTFail("Error \(JsonErrorValueNotNull.self) has to be thrown, but null \"\(String(describing: actualValue))\" is returned")
        } catch _ as JsonErrorValueNotNull {
            
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
        }
    }
    
    func testMissingNullValue() {
        let key = "key"
        let value = NSNumber(0)
        var object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.null("anotherKey")
            
            XCTFail("Error \(JsonErrorValueMissing.self) has to be thrown, but null \"\(String(describing: actualValue))\" is returned")
        } catch _ as JsonErrorValueMissing {
            
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
        }
    }
    
}
