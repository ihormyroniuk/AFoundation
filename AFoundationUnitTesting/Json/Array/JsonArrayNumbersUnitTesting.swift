//
//  JsonArrayNumbersUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 02.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonArrayNumbersUnitTesting: XCTestCase {

    func testArrayNumbers() {
        let numbers = [NSNumber(1), NSNumber(2), NSNumber(3)]
        var array = JsonArray()
        for number in numbers {
            array.append(number)
        }
        
        do {
            let arrayNumbers = try array.arrayNumbers()
            
            XCTAssert(arrayNumbers == numbers, "Object returned unexpected arrayNumbers \"\(String(describing: arrayNumbers))\" while arrayNumbers \"(\(String(describing: numbers))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNotArrayNumbers() {
        let notNumbers: [JsonValue] = [NSNumber(1), "string2", NSNumber(3)]
        var array = JsonArray()
        for notNumber in notNumbers {
            array.append(notNumber)
        }
        
        do {
            let arrayNumbers = try array.arrayNumbers()
            
            XCTFail("Error \(JsonErrorNotArrayNumbers.self) has to be thrown, but arrayNumbers \"\(String(describing: arrayNumbers))\" is returned")
        } catch _ as JsonErrorNotArrayNumbers {
            
        } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
        }
    }
    
}

