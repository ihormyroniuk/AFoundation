//
//  JsonStringUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonStringUnitTesting: XCTestCase {

    func testString() {
        let valueString = "string"
        let value: JsonString = JsonString(string: valueString)
        
        do {
            let string = try value.string().string
            
            XCTAssert(string == valueString, "Unexpected string \"\(String(describing: string))\" is found while string \"(\(String(describing: valueString))\" is expected")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNotString() {
        let valueNumber = Decimal(1)
        let value: JsonNumber = JsonNumber(decimal: valueNumber)
        
        do {
            let string = try value.string()
            
            XCTFail("Unexpected string \"\(String(describing: string))\" is found while error \(JsonValueIsNotStringError.self) has to be thrown")
        } catch _ as JsonValueIsNotStringError {
        
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }

}
