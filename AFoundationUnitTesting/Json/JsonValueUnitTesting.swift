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

class JsonValueUnitTesting: XCTestCase {
    
    // MARK: String
    
    func testInitString() {
        let string = "string"
        
        let jsonValue = JsonValue(string)
        
        let expectedJsonValue = JsonValue.string("string")
        XCTAssert(jsonValue == expectedJsonValue, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expectedJsonValue)) is expected")
    }
    
    func testString() {
        let jsonValue = JsonValue("string")
        
        do {
            let string = try jsonValue.string()
            
            let expectedString = "string"
            XCTAssert(string == expectedString, "Unexpected \(String(reflecting: string)) is returned, but \(String(reflecting: expectedString)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testStringError() {
        let jsonValue = JsonValue(true)
        
        do {
            let string = try jsonValue.string()
            
            XCTFail("Unexpected \(String(reflecting: string)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableString() {
        let jsonValue = JsonValue("string")
        
        do {
            let string = try jsonValue.nullableString()
            
            let expectedString = "string"
            XCTAssert(string == expectedString, "Unexpected \(String(reflecting: string)) is returned, but \(String(reflecting: expectedString)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableStringNull() {
        let jsonValue = JsonValue.null
        
        do {
            let string = try jsonValue.nullableString()
            
            let expectedString: String? = nil
            XCTAssert(string == expectedString, "Unexpected \(String(reflecting: string)) is returned, but \(String(reflecting: expectedString)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableStringError() {
        let jsonValue = JsonValue(true)
        
        do {
            let string = try jsonValue.nullableString()
            
            XCTFail("Unexpected \(String(reflecting: string)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    // MARK: Number
    
    func testInitNumber() {
        let number = Decimal(1)
        
        let jsonValue = JsonValue(number)
        
        let expectedJsonValue = JsonValue.number(number)
        XCTAssert(jsonValue == expectedJsonValue, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expectedJsonValue)) is expected")
    }
    
    func testNumber() {
        let jsonValue = JsonValue(Decimal(1))
        
        do {
            let number = try jsonValue.number()
            
            let expectedNumber = Decimal(1)
            XCTAssert(number == expectedNumber, "Unexpected \(String(reflecting: number)) is returned, but \(String(reflecting: expectedNumber)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNumberError() {
        let jsonValue = JsonValue(true)
        
        do {
            let number = try jsonValue.number()
            
            XCTFail("Unexpected \(String(reflecting: number)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableNumber() {
        let jsonValue = JsonValue(Decimal(1))
        
        do {
            let number = try jsonValue.nullableNumber()
            
            let expectedNumber = Decimal(1)
            XCTAssert(number == expectedNumber, "Unexpected \(String(reflecting: number)) is returned, but \(String(reflecting: expectedNumber)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableNumberNull() {
        let jsonValue = JsonValue.null
        
        do {
            let number = try jsonValue.nullableNumber()
            
            let expectedNumber: Decimal? = nil
            XCTAssert(number == expectedNumber, "Unexpected \(String(reflecting: number)) is returned, but \(String(reflecting: expectedNumber)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableNumberError() {
        let jsonValue = JsonValue(true)
        
        do {
            let number = try jsonValue.nullableNumber()
            
            XCTFail("Unexpected \(String(reflecting: number)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    // MARK: Object
    
    private let object = ["boolean": JsonValue(true), "string": JsonValue("string")]
    
    func testInitObject() {
        let jsonValue = JsonValue(object)
        
        let expectedJsonValue = JsonValue.object(object)
        XCTAssert(jsonValue == expectedJsonValue, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expectedJsonValue)) is expected")
    }
    
    func testObject() {
        let jsonValue = JsonValue(self.object)
        
        do {
            let object = try jsonValue.object()
            
            let expectedObject = self.object
            XCTAssert(object == expectedObject, "Unexpected \(String(reflecting: object)) is returned, but \(String(reflecting: expectedObject)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testObjectError() {
        let jsonValue = JsonValue(true)
        
        do {
            let object = try jsonValue.object()
            
            XCTFail("Unexpected \(String(reflecting: object)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableObject() {
        let jsonValue = JsonValue(self.object)
        
        do {
            let object = try jsonValue.nullableObject()
            
            let expectedObject = self.object
            XCTAssert(object == expectedObject, "Unexpected \(String(reflecting: object)) is returned, but \(String(reflecting: expectedObject)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableObjectNull() {
        let jsonValue = JsonValue.null
        
        do {
            let object = try jsonValue.nullableObject()
            
            let expectedObject: JsonObject? = nil
            XCTAssert(object == expectedObject, "Unexpected \(String(reflecting: object)) is returned, but \(String(reflecting: expectedObject)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableObjectError() {
        let jsonValue = JsonValue(true)
        
        do {
            let object = try jsonValue.nullableObject()
            
            XCTFail("Unexpected \(String(reflecting: object)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    // MARK: Array
    
    private let array = [JsonValue(true), JsonValue("string")]
    
    func testInitArray() {
        let jsonValue = JsonValue(array)
        
        let expectedJsonValue = JsonValue.array(array)
        XCTAssert(jsonValue == expectedJsonValue, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expectedJsonValue)) is expected")
    }
    
    func testArray() {
        let jsonValue = JsonValue(self.array)
        
        do {
            let array = try jsonValue.array()
            
            let expectedArray = self.array
            XCTAssert(array == expectedArray, "Unexpected \(String(reflecting: array)) is returned, but \(String(reflecting: expectedArray)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testArrayError() {
        let jsonValue = JsonValue(true)
        
        do {
            let array = try jsonValue.array()
            
            XCTFail("Unexpected \(String(reflecting: array)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableArray() {
        let jsonValue = JsonValue(self.array)
        
        do {
            let array = try jsonValue.nullableArray()
            
            let expectedArray = self.array
            XCTAssert(array == expectedArray, "Unexpected \(String(reflecting: array)) is returned, but \(String(reflecting: expectedArray)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableArrayNull() {
        let jsonValue = JsonValue.null
        
        do {
            let array = try jsonValue.nullableArray()
            
            let expectedArray: JsonArray? = nil
            XCTAssert(array == expectedArray, "Unexpected \(String(reflecting: array)) is returned, but \(String(reflecting: expectedArray)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableArrayError() {
        let jsonValue = JsonValue(true)
        
        do {
            let array = try jsonValue.nullableArray()
            
            XCTFail("Unexpected \(String(reflecting: array)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    // MARK: Boolean
    
    func testInitBoolean() {
        let boolean = true
        
        let jsonValue = JsonValue(boolean)
        
        let expectedJsonValue = JsonValue.boolean(boolean)
        XCTAssert(jsonValue == expectedJsonValue, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expectedJsonValue)) is expected")
    }
    
    func testBoolean() {
        let jsonValue = JsonValue(true)
        
        do {
            let boolean = try jsonValue.boolean()
            
            let expectedBoolean = true
            XCTAssert(boolean == expectedBoolean, "Unexpected \(String(reflecting: boolean)) is returned, but \(String(reflecting: expectedBoolean)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testBooleanError() {
        let jsonValue = JsonValue("string")
        
        do {
            let boolean = try jsonValue.boolean()
            
            XCTFail("Unexpected \(String(reflecting: boolean)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableBoolean() {
        let jsonValue = JsonValue(true)
        
        do {
            let boolean = try jsonValue.nullableBoolean()
            
            let expectedBoolean = true
            XCTAssert(boolean == expectedBoolean, "Unexpected \(String(reflecting: boolean)) is returned, but \(String(reflecting: expectedBoolean)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableBooleanNull() {
        let jsonValue = JsonValue.null
        
        do {
            let boolean = try jsonValue.nullableBoolean()
            
            let expectedBoolean: Bool? = nil
            XCTAssert(boolean == expectedBoolean, "Unexpected \(String(reflecting: boolean)) is returned, but \(String(reflecting: expectedBoolean)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableBooleanError() {
        let jsonValue = JsonValue("string")
        
        do {
            let boolean = try jsonValue.nullableBoolean()
            
            XCTFail("Unexpected \(String(reflecting: boolean)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    // MARK: Equatable
    
    func testEquatableStringsEqual() {
        let jsonValue1 = JsonValue("string")
        let jsonValue2 = JsonValue("string")
        
        XCTAssert(jsonValue1 == jsonValue2, "\(String(reflecting: jsonValue1)) has to be equal to \(String(reflecting: jsonValue2))")
    }
    
    func testEquatableStringsNotEqual() {
        let jsonValue1 = JsonValue("string1")
        let jsonValue2 = JsonValue("string2")
        
        XCTAssert(jsonValue1 != jsonValue2, "\(String(reflecting: jsonValue1)) has not to be equal to \(String(reflecting: jsonValue2))")
    }
    
    func testEquatableNumbersEqual() {
        let jsonValue1 = JsonValue(Decimal(1))
        let jsonValue2 = JsonValue(Decimal(1))
        
        XCTAssert(jsonValue1 == jsonValue2, "\(String(reflecting: jsonValue1)) has to be equal to \(String(reflecting: jsonValue2))")
    }
    
    func testEquatableNumbersNotEqual() {
        let jsonValue1 = JsonValue(Decimal(1))
        let jsonValue2 = JsonValue(Decimal(2))
        
        XCTAssert(jsonValue1 != jsonValue2, "\(String(reflecting: jsonValue1)) has not to be equal to \(String(reflecting: jsonValue2))")
    }
    
    func testEquatableObjectsEqual() {
        let jsonValue1 = JsonValue(["boolean": JsonValue(true), "string": JsonValue("string")])
        let jsonValue2 = JsonValue(["boolean": JsonValue(true), "string": JsonValue("string")])
        
        XCTAssert(jsonValue1 == jsonValue2, "\(String(reflecting: jsonValue1)) has to be equal to \(String(reflecting: jsonValue2))")
    }
    
    func testEquatableObjectsNotEqual() {
        let jsonValue1 = JsonValue(["boolean": JsonValue(true), "string": JsonValue("string")])
        let jsonValue2 = JsonValue(["boolean": JsonValue(true), "number": JsonValue(Decimal(1))])
        
        XCTAssert(jsonValue1 != jsonValue2, "\(String(reflecting: jsonValue1)) has not to be equal to \(String(reflecting: jsonValue2))")
    }
    
    func testEquatableArraysEqual() {
        let jsonValue1 = JsonValue([JsonValue(true), JsonValue("string")])
        let jsonValue2 = JsonValue([JsonValue(true), JsonValue("string")])
        
        XCTAssert(jsonValue1 == jsonValue2, "\(String(reflecting: jsonValue1)) has to be equal to \(String(reflecting: jsonValue2))")
    }
    
    func testEquatableArraysNotEqual() {
        let jsonValue1 = JsonValue([JsonValue(true), JsonValue("string")])
        let jsonValue2 = JsonValue([JsonValue(true), JsonValue(Decimal(1))])
        
        XCTAssert(jsonValue1 != jsonValue2, "\(String(reflecting: jsonValue1)) has not to be equal to \(String(reflecting: jsonValue2))")
    }
    
    func testEquatableBooleansEqual() {
        let jsonValue1 = JsonValue(true)
        let jsonValue2 = JsonValue(true)
        
        XCTAssert(jsonValue1 == jsonValue2, "\(String(reflecting: jsonValue1)) has to be equal to \(String(reflecting: jsonValue2))")
    }
    
    func testEquatableBooleansNotEqual() {
        let jsonValue1 = JsonValue(true)
        let jsonValue2 = JsonValue(false)
        
        XCTAssert(jsonValue1 != jsonValue2, "\(String(reflecting: jsonValue1)) has not to be equal to \(String(reflecting: jsonValue2))")
    }
    
    func testEquatableNullsEqual() {
        let jsonValue1 = JsonValue.null
        let jsonValue2 = JsonValue.null
        
        XCTAssert(jsonValue1 == jsonValue2, "\(String(reflecting: jsonValue1)) has to be equal to \(String(reflecting: jsonValue2))")
    }
    
    func testEquatableStringNumbrt() {
        let jsonValue1 = JsonValue("string")
        let jsonValue2 = JsonValue(Decimal(1))
        
        XCTAssert(jsonValue1 != jsonValue2, "\(String(reflecting: jsonValue1)) has to be equal to \(String(reflecting: jsonValue2))")
    }
    
    // MARK: CustomDebugStringConvertible
    
    func testDebugDescriptionString() {
        let jsonValue = JsonValue.string("someString")
        
        let debugDescription = String(reflecting: jsonValue)
        
        let expectedDebugDescription = "AFoundation.JsonValue.string(\"someString\")"
        XCTAssert(debugDescription == expectedDebugDescription, "Unexpected \(String(reflecting: debugDescription)) is returned, but \(String(reflecting: expectedDebugDescription)) is expected")
    }
    
    func testDebugDescriptionNumber() {
        let jsonValue = JsonValue.number(Decimal(1))
        
        let debugDescription = String(reflecting: jsonValue)
        
        let expectedDebugDescription = "AFoundation.JsonValue.number(1)"
        XCTAssert(debugDescription == expectedDebugDescription, "Unexpected \(String(reflecting: debugDescription)) is returned, but \(String(reflecting: expectedDebugDescription)) is expected")
    }
    
    func testDebugDescriptionObject() {
        let jsonValue = JsonValue.object([:])
        
        let debugDescription = String(reflecting: jsonValue)
        
        let expectedDebugDescription = "AFoundation.JsonValue.object([:])"
        XCTAssert(debugDescription == expectedDebugDescription, "Unexpected \(String(reflecting: debugDescription)) is returned, but \(String(reflecting: expectedDebugDescription)) is expected")
    }
    
    func testDebugDescriptionArray() {
        let jsonValue = JsonValue.array([])
        
        let debugDescription = String(reflecting: jsonValue)
        
        let expectedDebugDescription = "AFoundation.JsonValue.array([])"
        XCTAssert(debugDescription == expectedDebugDescription, "Unexpected \(String(reflecting: debugDescription)) is returned, but \(String(reflecting: expectedDebugDescription)) is expected")
    }
    
    func testDebugDescriptionBoolean() {
        let jsonValue = JsonValue.boolean(true)
        
        let debugDescription = String(reflecting: jsonValue)
        
        let expectedDebugDescription = "AFoundation.JsonValue.boolean(true)"
        XCTAssert(debugDescription == expectedDebugDescription, "Unexpected \(String(reflecting: debugDescription)) is returned, but \(String(reflecting: expectedDebugDescription)) is expected")
    }
    
    func testDebugDescriptionNull() {
        let jsonValue = JsonValue.null
        
        let debugDescription = String(reflecting: jsonValue)
        
        let expectedDebugDescription = "AFoundation.JsonValue.null"
        XCTAssert(debugDescription == expectedDebugDescription, "Unexpected \(String(reflecting: debugDescription)) is returned, but \(String(reflecting: expectedDebugDescription)) is expected")
    }
    
    // MARK: Hashable

    func testHashValueString() {
        let jsonValue = JsonValue.string("someString")
        
        let hashValue = jsonValue.hashValue
        
        let expectedHashValue = "someString".hashValue
        XCTAssert(hashValue == expectedHashValue, "Unexpected \(String(reflecting: hashValue)) is returned, but \(String(reflecting: expectedHashValue)) is expected")
    }
    
    func testHashValueNumber() {
        let jsonValue = JsonValue.number(Decimal(1))
        
        let hashValue = jsonValue.hashValue
        
        let expectedHashValue = Decimal(1).hashValue
        XCTAssert(hashValue == expectedHashValue, "Unexpected \(String(reflecting: hashValue)) is returned, but \(String(reflecting: expectedHashValue)) is expected")
    }
    
    func testHashValueObject() {
        let jsonValue = JsonValue.object(object)
        
        let hashValue = jsonValue.hashValue
        
        let expectedHashValue = object.hashValue
        XCTAssert(hashValue == expectedHashValue, "Unexpected \(String(reflecting: hashValue)) is returned, but \(String(reflecting: expectedHashValue)) is expected")
    }
    
    func testHashValueArray() {
        let jsonValue = JsonValue.array(array)
        
        let hashValue = jsonValue.hashValue
        
        let expectedHashValue = array.hashValue
        XCTAssert(hashValue == expectedHashValue, "Unexpected \(String(reflecting: hashValue)) is returned, but \(String(reflecting: expectedHashValue)) is expected")
    }
    
    func testHashValueBoolean() {
        let jsonValue = JsonValue.boolean(true)
        
        let hashValue = jsonValue.hashValue
        
        let expectedHashValue = true.hashValue
        XCTAssert(hashValue == expectedHashValue, "Unexpected \(String(reflecting: hashValue)) is returned, but \(String(reflecting: expectedHashValue)) is expected")
    }
    
    func testHashValueNull() {
        let jsonValue = JsonValue.null
        
        let hashValue = jsonValue.hashValue
        
        let expectedHashValue = 0.hashValue
        XCTAssert(hashValue == expectedHashValue, "Unexpected \(String(reflecting: hashValue)) is returned, but \(String(reflecting: expectedHashValue)) is expected")
    }
    
}
