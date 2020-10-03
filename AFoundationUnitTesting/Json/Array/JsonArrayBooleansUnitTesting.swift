//
//  JsonArrayBooleansUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonArrayBooleansUnitTesting: XCTestCase {

    func testArrayBooleans() {
        let booleans = [true, false, true]
        var array = JsonArray()
        for boolean in booleans {
            array.append(boolean)
        }
        
        do {
            let arrayBooleans = try array.arrayBooleans()
            
            XCTAssert(arrayBooleans == booleans, "Object returned unexpected arrayBooleans \"\(String(describing: arrayBooleans))\" while arrayBooleans \"(\(String(describing: booleans))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNotArrayBooleans() {
        let notBooleans: [JsonValue] = [true, "string2", false]
        var array = JsonArray()
        for notBoolean in notBooleans {
            array.append(notBoolean)
        }
        
        do {
            let arrayBooleans = try array.arrayBooleans()
            
            XCTFail("Error \(JsonErrorNotArrayBooleans.self) has to be thrown, but arrayBooleans \"\(String(describing: arrayBooleans))\" is returned")
        } catch _ as JsonErrorNotArrayBooleans {
            
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
        }
    }
    
}

