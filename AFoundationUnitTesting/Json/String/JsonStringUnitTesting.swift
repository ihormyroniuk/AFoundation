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
        let value: JsonValue = valueString
        
        do {
            let string = try value.string()
            
            XCTAssert(string == valueString, "Unexpected string \"\(String(describing: string))\" is found while string \"(\(String(describing: valueString))\" is expected")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNotString() {
        let valueNumber = Decimal(1)
        let value: JsonValue = valueNumber
        
        do {
            let string = try value.string()
            
            XCTFail("Unexpected string \"\(String(describing: string))\" is found while error \(JsonErrorValueNotString.self) has to be thrown")
        } catch _ as JsonErrorValueNotString {
        
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }

}
