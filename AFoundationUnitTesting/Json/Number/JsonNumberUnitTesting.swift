//
//  JsonNumberUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonNumberUnitTesting: XCTestCase {

    func testNumber() {
        let valueNumber = Decimal(1)
        let value: JsonValue = valueNumber
        
        do {
            let number = try value.number()
            
            XCTAssert(number == valueNumber, "Unexpected number \"\(String(describing: number))\" is found while number \"(\(String(describing: valueNumber))\" is expected")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNotNumber() {
        let valueString = "string"
        let value: JsonValue = valueString
        
        do {
            let string = try value.number()
            
            XCTFail("Unexpected number \"\(String(describing: string))\" is found while error \(JsonValueIsNotNumberError.self) has to be thrown")
        } catch _ as JsonValueIsNotNumberError {
        
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }

}
