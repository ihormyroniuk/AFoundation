//
//  JsonObjectOptionalArrayUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 19.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonObjectOptionalArrayUnitTesting: XCTestCase {
//
//    func testArrayValue() {
//        let key = "key"
//        let value = JsonArray()
//        var object = JsonObject()
//        object[key] = value;
//        
//        do {
//            let actualValue = try object.optionalArray(key)
//            
//            XCTAssert(actualValue == value, "Object returned unexpected array \"\(String(describing: actualValue))\" while array \"(\(String(describing: value))\" is expected)")
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
//            let actualValue = try object.optionalArray(key)
//            
//            XCTAssertTrue(actualValue == nil, "Object returned unexpected array \"\(String(describing: actualValue))\" while array \"(\(String(describing: value))\" is expected)")
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
//    
//    func testNotArrayValue() {
//        let key = "key"
//        let value = "string"
//        var object = JsonObject()
//        object[key] = value;
//        
//        do {
//            let actualValue = try object.optionalArray(key)
//            
//            XCTFail("Error \(JsonValueIsNotArrayError.self) has to be thrown, but array \"\(String(describing: actualValue))\" is returned")
//        } catch _ as JsonValueIsNotArrayError {
//            
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
//    
//    func testMissingArrayValue() {
//        let key = "key"
//        let value = JsonArray()
//        var object = JsonObject()
//        object[key] = value;
//        
//        do {
//            let actualValue = try object.optionalArray("anotherKey")
//            
//            XCTFail("Error \(JsonErrorValueMissing.self) has to be thrown, but array \"\(String(describing: actualValue))\" is returned")
//        } catch _ as JsonErrorValueMissing {
//            
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
//    
}

