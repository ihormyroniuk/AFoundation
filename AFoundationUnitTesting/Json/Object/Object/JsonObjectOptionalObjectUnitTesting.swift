//
//  JsonObjectOptionalObjectUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonObjectOptionalObjectUnitTesting: XCTestCase {
//
//    func testObjectValue() {
//        let key = "key"
//        let value = JsonObject()
//        var object = JsonObject()
//        object[key] = value;
//        
//        do {
//            let actualValue = try object.optionalObject(key)
//            
//            XCTAssert(actualValue == value, "Object returned unexpected object \"\(String(describing: actualValue))\" while object \"(\(String(describing: value))\" is expected)")
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
//            let actualValue = try object.optionalObject(key)
//            
//            XCTAssertTrue(actualValue == nil, "Object returned unexpected object \"\(String(describing: actualValue))\" while object \"(\(String(describing: value))\" is expected)")
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
//    
//    func testNotObjectValue() {
//        let key = "key"
//        let value = "string"
//        var object = JsonObject()
//        object[key] = value;
//        
//        do {
//            let actualValue = try object.optionalObject(key)
//            
//            XCTFail("Error \(JsonValueIsNotObjectError.self) has to be thrown, but object \"\(String(describing: actualValue))\" is returned")
//        } catch _ as JsonValueIsNotObjectError {
//            
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
//    
//    func testMissingObjectValue() {
//        let key = "key"
//        let value = JsonObject()
//        var object = JsonObject()
//        object[key] = value;
//        
//        do {
//            let actualValue = try object.optionalObject("anotherKey")
//            
//            XCTFail("Error \(JsonObjectValueIsMissingError.self) has to be thrown, but object \"\(String(describing: actualValue))\" is returned")
//        } catch _ as JsonObjectValueIsMissingError {
//            
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
//    
}
