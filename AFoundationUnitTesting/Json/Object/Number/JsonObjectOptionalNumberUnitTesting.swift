//
//  JsonObjectOptionalNumberUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonObjectOptionalNumberUnitTesting: XCTestCase {

//    func testNumberValue() {
//        let key: String = "key"
//        let value: Decimal = 0
//        let object = JsonObject()
//        object[key] = value;
//
//        do {
//            let actualValue = try object.optionalNumber(key)
//
//            XCTAssert(actualValue == value, "Object returned unexpected number \"\(String(describing: actualValue))\" while number \"(\(String(describing: value))\" is expected)")
//        } catch {
//            XCTFail("Unexpected error \(error) is thrown")
//        }
//    }
    
//    func testNullValue() {
//        let key: String = "key"
//        let value = JsonNull(null: NSNull())
//        let object = JsonObject()
//        object[key] = value;
//        
//        do {
//            let actualValue = try object.optionalNumber(key)
//            
//            XCTAssertTrue(actualValue == nil, "Object returned unexpected number \"\(String(describing: actualValue))\" while number \"(\(String(describing: value))\" is expected)")
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
    
//    func testNotNumberValue() {
//        let key: String = "key"
//        let value: String = "string"
//        let object = JsonObject()
//        object[key] = value;
//
//        do {
//            let actualValue = try object.optionalNumber(key)
//
//            XCTFail("Error \(JsonAnyValueIsNotNumberError.self) has to be thrown, but number \"\(String(describing: actualValue))\" is returned")
//        } catch _ as JsonAnyValueIsNotNumberError {
//
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
    
//    func testMissingNumberValue() {
//        let key: String = "key"
//        let value: Decimal = 0
//        let object = JsonObject()
//        object[key] = value;
//        
//        do {
//            let actualValue = try object.optionalNumber("anotherKey")
//            
//            XCTFail("Error \(JsonObjectValueIsMissingError.self) has to be thrown, but number \"\(String(describing: actualValue))\" is returned")
//        } catch _ as JsonObjectValueIsMissingError {
//            
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
    
}
