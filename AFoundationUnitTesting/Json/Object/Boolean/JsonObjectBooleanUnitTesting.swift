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
        let key = "key"
        let value = true
        var object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.boolean(key)
            
            XCTAssert(actualValue == value, "Object returned unexpected boolean \"\(String(describing: actualValue))\" while boolean \"(\(String(describing: value))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNotBooleanValue() {
        let key = "key"
        let value = "string"
        var object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.boolean(key)
            
            XCTFail("Error \(JsonErrorValueNotBoolean.self) has to be thrown, but boolean \"\(String(describing: actualValue))\" is returned")
        } catch _ as JsonErrorValueNotBoolean {
            
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
        }
    }
    
    func testMissingBooleanValue() {
        let key = "key"
        let value = NSNumber(0)
        var object = JsonObject()
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
