//
//  JsonJSONSerrializationUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class JsonJSONSerrializationUnitTesting: XCTestCase {

    func testObject() {
        let strings = ["string1", "string2", "string3"]
        var array = JsonArray()
        for string in strings {
            array.append(string)
        }

        do {
            let arrayStrings = try array.arrayStrings()
            
            XCTAssert(arrayStrings == strings, "Object returned unexpected arraySrings \"\(String(describing: arrayStrings))\" while arraySrings \"(\(String(describing: strings))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
}
