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
        let key = "key"
        let value = NSNumber(0)
        var object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.number(key)
            
            XCTAssert(actualValue == value, "Object returned unexpected number \"\(String(describing: actualValue))\" while number \"(\(String(describing: value))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNotNumberValue() {
        let key = "key"
        let value = "string"
        var object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.number(key)
            
            XCTFail("Error \(JsonErrorValueNotNumber.self) has to be thrown, but number \"\(String(describing: actualValue))\" is returned")
        } catch _ as JsonErrorValueNotNumber {
            
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
        }
    }
    
    func testMissingNumberValue() {
        let key = "key"
        let value = NSNumber(0)
        var object = JsonObject()
        object[key] = value;
        
        do {
            let actualValue = try object.number("anotherKey")
            
            XCTFail("Error \(JsonErrorValueMissing.self) has to be thrown, but number \"\(String(describing: actualValue))\" is returned")
        } catch _ as JsonErrorValueMissing {
            
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
        }
    }
    
}
