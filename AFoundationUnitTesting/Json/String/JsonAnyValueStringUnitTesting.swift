//
//  StringUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonAnyValueStringUnitTesting: XCTestCase {

    func testString() {
        let string = "string"
        let jsonAnyValue = JsonAnyValue(string)
        
        do {
            let jsonAnyValueString = try jsonAnyValue.string()
            
            XCTAssert(string == jsonAnyValueString, "Unexpected string \"\(string)\" is found while string \"(\(jsonAnyValueString)\" is expected")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNullableString() {
        let string = "string"
        let jsonAnyValue = JsonAnyValue(string)
        
        do {
            let jsonAnyValueString = try jsonAnyValue.nullableString()
            
            XCTAssert(string == jsonAnyValueString, "Unexpected string \"\(string)\" is found while string \"(\(String(describing: jsonAnyValueString))\" is expected")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNullableNull() {
        let jsonAnyValue = JsonAnyValue()
        
        do {
            let jsonAnyValueString = try jsonAnyValue.nullableString()
            
            XCTAssert(nil == jsonAnyValueString, "Unexpected string \"\" is found while string \"(\(String(describing: jsonAnyValueString))\" is expected")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNumber() {
        let number = Decimal(26)
        let jsonAnyValue = JsonAnyValue(number)
        
        do {
            let jsonAnyValueString = try jsonAnyValue.string()
            
            XCTFail("Unexpected string \"\(jsonAnyValueString)\" is found while error \(JsonAnyValue.NotStringError.self) has to be thrown")
        } catch let error as JsonAnyValue.NotStringError {
            print(error)
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }

}
