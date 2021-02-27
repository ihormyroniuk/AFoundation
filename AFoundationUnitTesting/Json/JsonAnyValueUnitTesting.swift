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
    
//    // MARK: String
//
//    func testString_String() {
//        let string = "string"
//        let jsonAnyValue = JsonAnyValue(string)
//        
//        let jsonAnyValueString: String
//        do { jsonAnyValueString = try jsonAnyValue.string() }
//        catch {
//            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
//            return
//        }
//        XCTAssert(jsonAnyValueString == string, "Unexpected string \(String(reflecting: jsonAnyValueString)) is found, while string \(String(reflecting: string)) is expected")
//    }
//    
//    func testString_Number() {
//        let decimal = Decimal(8)
//        let jsonAnyValue = JsonAnyValue(decimal)
//        
//        let jsonAnyValueString: String
//        do { jsonAnyValueString = try jsonAnyValue.string()
//        } catch _ as JsonAnyValue.NotStringError {
//            return
//        } catch {
//            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
//            return
//        }
//        XCTFail("Unexpected string \"\(String(reflecting: jsonAnyValueString))\" is found, while error \(String(reflecting: JsonAnyValue.NotStringError.self)) has to be thrown")
//    }
//    
//    func testNullableString_String() {
//        let string = "string"
//        let jsonAnyValue = JsonAnyValue(string)
//        
//        let jsonAnyValueString: String?
//        do { jsonAnyValueString = try jsonAnyValue.nullableString() }
//        catch {
//            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
//            return
//        }
//        XCTAssert(jsonAnyValueString == string, "Unexpected string \(String(reflecting: jsonAnyValueString)) is found, while string \(string) is expected")
//    }
//    
//    func testNullableString_Null() {
//        let jsonAnyValue = JsonAnyValue()
//        
//        do {
//            let jsonAnyValueString = try jsonAnyValue.nullableString()
//            
//            XCTAssert(nil == jsonAnyValueString, "Unexpected string \"\" is found, while string \"(\(String(describing: jsonAnyValueString))\" is expected")
//        } catch {
//            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
//        }
//    }
//    
//    func testNullableString_Boolean() {
//        let boolean = true
//        let jsonAnyValue = JsonAnyValue(boolean)
//        
//        do {
//            let jsonAnyValueString = try jsonAnyValue.nullableString()
//            
//            XCTFail("Unexpected string \"\(String(reflecting: jsonAnyValueString))\" is found, while error \(JsonAnyValue.NotNullableStringError.self) has to be thrown")
//        } catch let error as JsonAnyValue.NotNullableStringError {
//            print(error)
//        } catch {
//            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
//        }
//    }

}
