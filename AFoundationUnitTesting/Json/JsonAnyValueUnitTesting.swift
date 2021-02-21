//
//  JsonAnyValueUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 22.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonAnyValueUnitTesting: XCTestCase {
    
    // MARK: String

    func testString_String() {
        let string = "string"
        let jsonAnyValue = JsonAnyValue(string)
        
        let jsonAnyValueString: String
        do { jsonAnyValueString = try jsonAnyValue.string() }
        catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        XCTAssert(jsonAnyValueString == string, "Unexpected string \(jsonAnyValueString) is found while string \(string) is expected")
    }
    
    func testString_Number() {
        let decimal = Decimal(8)
        let jsonAnyValue = JsonAnyValue(decimal)
        
        let jsonAnyValueString: String
        do { jsonAnyValueString = try jsonAnyValue.string()
        } catch let error as JsonAnyValue.NotStringError {
            print(error)
            return
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        XCTFail("Unexpected string \"\(String(reflecting: jsonAnyValueString))\" is found while error \(String(reflecting: JsonAnyValue.NotStringError.self)) has to be thrown")
    }
    
    func testNullableString_String() {
        let string = "string"
        let jsonAnyValue = JsonAnyValue(string)
        
        let jsonAnyValueString: String?
        do { jsonAnyValueString = try jsonAnyValue.nullableString() }
        catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        XCTAssert(jsonAnyValueString == string, "Unexpected string \(String(reflecting: jsonAnyValueString)) is found while string \(string) is expected")
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
