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

    func testObjectData() {
        let data = Data([0x7b, 0x22, 0x6e, 0x75, 0x6d, 0x62, 0x65, 0x72, 0x22, 0x3a, 0x38, 0x7d])

        do {
            let object = try JsonSerialization.jsonValue(data).object()
            
            var expectedObject = JsonObject()
            expectedObject.setNumber(Decimal(8), for: "number")
            XCTAssert(object == expectedObject, "Object returned unexpected object \"\(String(describing: object))\" while object \"(\(String(describing: expectedObject))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testArrayData() {
//        let data = Data([0x5b, 0x22, 0x73, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x31, 0x22, 0x2c, 0x20, 0x22, 0x73, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x32, 0x22, 0x5d])
//
//        do {
//            let array = try JsonSerialization.jsonValue(data: data).array()
//            
//            let StringsArray: [JsonValue] = [String(string: "string1"), String(string: "string2")]
//            var expectedArray: JsonArray = StringsArray
//            XCTAssert(array == expectedArray, "Object returned unexpected array \"\(String(describing: array))\" while array \"(\(String(describing: expectedArray))\" is expected)")
//        } catch {
//            XCTFail("Unexpected error \(error) is thrown")
//        }
    }
    
    func testStringData() {
        let data = Data([0x22, 0x73, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x22])

        do {
            let string = try JsonSerialization.jsonValue(data).string()
            
            let expectedString = "string"
            XCTAssert(string == expectedString, "Object returned unexpected string \"\(String(describing: string))\" while string \"(\(String(describing: expectedString))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testNumberData() {
        let data = Data([0x37])

        do {
            let number = try JsonSerialization.jsonValue(data).number()
            
            let expectedNumber: Decimal = 7
            XCTAssert(number == expectedNumber, "Object returned unexpected number \"\(String(describing: number))\" while number \"(\(String(describing: expectedNumber))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testBooleanData() {
        let data = Data([0x74, 0x72, 0x75, 0x65])

        do {
            let boolean = try JsonSerialization.jsonValue(data).boolean()
            
            let expectedBoolean = true
            XCTAssert(boolean == expectedBoolean, "Object returned unexpected boolean \"\(String(describing: boolean))\" while boolean \"(\(String(describing: expectedBoolean))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
//    func testEmptyData() {
//        let data = Data()
//
//        do {
//            let boolean = try JSONSerialization.json(data: data).boolean()
//            
//            let expectedBoolean = true
//            XCTAssert(boolean == expectedBoolean, "Object returned unexpected boolean \"\(String(describing: boolean))\" while boolean \"(\(String(describing: expectedBoolean))\" is expected)")
//        } catch {
//            XCTFail("Unexpected error \(error) is thrown")
//        }
//    }
    
//    func testDataString() {
//        let string: String = "string"
//
//        do {
//            let data = try JSONSerialization.data(jsonValue: string)
//
//            let expectedData = Data([0x22, 0x73, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x22])
//            XCTAssert(data == expectedData, "Unexpected data \"\(String(describing: data))\" is returned while data \"(\(String(describing: expectedData))\" is expected)")
//        } catch {
//            XCTFail("Unexpected error \(error) is thrown")
//        }
//    }
//
//    func testDataNumber() {
//        let number: Decimal = 7
//
//        do {
//            let data = try JSONSerialization.data(jsonValue: number)
//
//            let expectedData = Data([0x37])
//            XCTAssert(data == expectedData, "Unexpected data \"\(String(describing: data))\" is returned while data \"(\(String(describing: expectedData))\" is expected)")
//        } catch {
//            XCTFail("Unexpected error \(error) is thrown")
//        }
//    }
//
//    func testDataNull() {
//        let null: NSNull = NSNull()
//
//        do {
//            let data = try JSONSerialization.data(jsonValue: null)
//
//            let expectedData = Data([0x6e, 0x75, 0x6c, 0x6c])
//            XCTAssert(data == expectedData, "Unexpected data \"\(String(describing: data))\" is returned while data \"(\(String(describing: expectedData))\" is expected)")
//        } catch {
//            XCTFail("Unexpected error \(error) is thrown")
//        }
//    }
    
}
