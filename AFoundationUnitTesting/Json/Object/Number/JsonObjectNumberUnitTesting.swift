//
//  JsonObjectNumberUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonObjectNumberUnitTesting: XCTestCase {

    func testNumberValue() {
        let key: String = "key"
        let value: Decimal = 0
        var object = JsonObject()
        object.setNumber(value, for: key)
        
        do {
            let actualValue = try object.number(key)
            
            XCTAssert(actualValue == value, "Object returned unexpected number \"\(String(describing: actualValue))\" while number \"(\(String(describing: value))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
//    func testNotNumberValue() {
//        let key: String = "key"
//        let value: String = "string"
//        var object = JsonObject()
//        object.setString(value, for: key)
//        
//        do {
//            let actualValue = try object.number(key)
//            
//            XCTFail("Error \(JsonAnyValueIsNotNumberError.self) has to be thrown, but number \"\(String(describing: actualValue))\" is returned")
//        } catch _ as JsonAnyValueIsNotNumberError {
//            
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
//    
//    func testMissingNumberValue() {
//        let key: String = "key"
//        let value: Decimal = 0
//        var object = JsonObject()
//        object.setNumber(value, for: key)
//        
//        do {
//            let actualValue = try object.number("anotherKey")
//            
//            XCTFail("Error \(JsonObjectValueIsMissingError.self) has to be thrown, but number \"\(String(describing: actualValue))\" is returned")
//        } catch _ as JsonObjectValueIsMissingError {
//            
//        } catch {
//            XCTFail("Unexpected error \(error.self) is thrown")
//        }
//    }
//    
}
