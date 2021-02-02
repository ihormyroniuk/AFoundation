//
//  JsonArrayUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 31.01.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class JsonArrayUnitTesting: XCTestCase {

    func testArray() {
        let valueNumber: JsonArray = [Decimal(0), Decimal(1), Decimal(2)]
        let value: JsonValue = valueNumber
        
        do {
            let number = try value.array()
            
            XCTAssert(number == valueNumber, "Unexpected number \"\(String(describing: number))\" is found while number \"(\(String(describing: valueNumber))\" is expected")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNotArray() {
        let valueString = "string"
        let value: JsonValue = valueString
        
        do {
            let string = try value.array()
            
            XCTFail("Unexpected number \"\(String(describing: string))\" is found while error \(JsonValueIsNotNumberError.self) has to be thrown")
        } catch _ as JsonValueIsNotArrayError {
        
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }

}
