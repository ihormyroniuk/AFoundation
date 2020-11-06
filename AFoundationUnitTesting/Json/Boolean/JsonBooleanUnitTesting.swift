//
//  JsonBooleanUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonBooleanUnitTesting: XCTestCase {

    func testBoolean() {
        let valueBoolean = false
        let value: JsonValue = valueBoolean
        
        do {
            let string = try value.boolean()
            
            XCTAssert(string == valueBoolean, "Unexpected boolean \"\(String(describing: string))\" is found while boolean \"(\(String(describing: valueBoolean))\" is expected")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNotBoolean() {
        let valueString = "string"
        let value: JsonValue = valueString
        
        do {
            let string = try value.boolean()
            
            XCTFail("Unexpected boolean \"\(String(describing: string))\" is found while error \(JsonErrorValueNotBoolean.self) has to be thrown")
        } catch _ as JsonErrorValueNotBoolean {
        
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }

}
