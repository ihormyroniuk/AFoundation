//
//  JsonNullUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonNullUnitTesting: XCTestCase {

    func testNull() {
        let valueNull = JsonNull()
        let value: JsonValue = valueNull
        
        do {
            let null = try value.null()
            
            XCTAssert(null == valueNull, "Unexpected null \"\(String(describing: null))\" is found while null \"(\(String(describing: valueNull))\" is expected")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNotNull() {
        let valueString: JsonString = "string"
        let value: JsonValue = valueString
        
        do {
            let null = try value.null()
            
            XCTFail("Unexpected null \"\(String(describing: null))\" is found while error \(JsonValueIsNotNullError.self) has to be thrown")
        } catch _ as JsonValueIsNotNullError {
        
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }

}
