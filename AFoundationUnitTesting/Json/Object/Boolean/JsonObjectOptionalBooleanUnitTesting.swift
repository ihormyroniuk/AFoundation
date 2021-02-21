//
//  JsonObjectOptionalBooleanUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 19.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonObjectOptionalBooleanUnitTesting: XCTestCase {
//
//    func testBooleanValue() {
//        let key = "key"
//        let value = true
//        var object = JsonObject()
//        object[key] = value;
//        
//        do {
//            let actualValue = try object.optionalBoolean(key)
//            
//            XCTAssert(actualValue == value, "Object returned unexpected boolean \"\(String(describing: actualValue))\" while boolean \"(\(String(describing: value))\" is expected)")
//        } catch {
//            XCTFail("Unexpected error \(error) is thrown")
//        }
//    }
//    
//    func testNullValue() {
//        let key = "key"
//        let value = JsonNull()
//        var object = JsonObject()
//        object[key] = value;
//        
//        do {
//            let actualValue = try object.optionalBoolean(key)
//            
//            XCTAssertTrue(actualValue == nil, "Object returned unexpected boolean \"\(String(describing: actualValue))\" while boolean \"(\(String(describing: value))\" is expected)")
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
//    
//    func testNotBooleanValue() {
//        let key = "key"
//        let value = "string"
//        var object = JsonObject()
//        object[key] = value;
//        
//        do {
//            let actualValue = try object.optionalBoolean(key)
//            
//            XCTFail("Error \(JsonValueIsNotBooleanError.self) has to be thrown, but boolean \"\(String(describing: actualValue))\" is returned")
//        } catch _ as JsonValueIsNotBooleanError {
//            
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
//    
//    func testMissingBooleanValue() {
//        let key = "key"
//        let value = false
//        var object = JsonObject()
//        object[key] = value;
//        
//        do {
//            let actualValue = try object.optionalBoolean("anotherKey")
//            
//            XCTFail("Error \(JsonObjectValueIsMissingError.self) has to be thrown, but boolean \"\(String(describing: actualValue))\" is returned")
//        } catch _ as JsonObjectValueIsMissingError {
//            
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
//    
}
