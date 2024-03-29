import XCTest
import Foundation
@testable import AFoundation

class JsonSerrializationUnitTesting: XCTestCase {

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
        let data = Data([0x5b, 0x22, 0x73, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x31, 0x22, 0x2c, 0x20, 0x22, 0x73, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x32, 0x22, 0x5d])

        do {
            let array = try JsonSerialization.jsonValue(data).array()
            
            let stringsArray: [JsonValue] = [JsonValue("string1"), JsonValue("string2")]
            let expectedArray: JsonArray = stringsArray
            XCTAssert(array == expectedArray, "Object returned unexpected array \"\(String(describing: array))\" while array \"(\(String(describing: expectedArray))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
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
    
    func testNullData() {
        let data = Data([0x6e, 0x75, 0x6c, 0x6c])

        do {
            let boolean = try JsonSerialization.jsonValue(data).nullableBoolean()
            
            let expectedBoolean: Bool? = nil
            XCTAssert(boolean == expectedBoolean, "Object returned unexpected boolean \"\(String(describing: boolean))\" while boolean \"(\(String(describing: expectedBoolean))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testEmptyData() {
        let data = Data()

        do {
            let boolean = try JsonSerialization.jsonValue(data).boolean()
            
            XCTFail("\(boolean) Unexpected error has to be thrown")
        } catch {
            return
        }
    }
    
    func testDataObject() {
        var object = JsonObject()
        object.setNumber(Decimal(8), for: "number")

        do {
            let data = try JsonSerialization.data(object)

            let expectedData = Data([0x7b, 0x22, 0x6e, 0x75, 0x6d, 0x62, 0x65, 0x72, 0x22, 0x3a, 0x38, 0x7d])
            XCTAssert(data == expectedData, "Unexpected data \"\(String(describing: data))\" is returned while data \"(\(String(describing: expectedData))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testDataArray() {
        let stringsArray: [JsonValue] = [JsonValue("string1"), JsonValue("string2")]
        let array: JsonArray = stringsArray

        do {
            let data = try JsonSerialization.data(array)

            let expectedData = Data([0x5b, 0x22, 0x73, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x31, 0x22, 0x2c, 0x22, 0x73, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x32, 0x22, 0x5d])
            XCTAssert(data == expectedData, "Unexpected data \"\(String(describing: data))\" is returned while data \"(\(String(describing: expectedData))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testDataString() {
        let string: String = "string"

        do {
            let data = try JsonSerialization.data(string)

            let expectedData = Data([0x22, 0x73, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x22])
            XCTAssert(data == expectedData, "Unexpected data \"\(String(describing: data))\" is returned while data \"(\(String(describing: expectedData))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }

    func testDataNumber() {
        let number: Decimal = 7

        do {
            let data = try JsonSerialization.data(number)

            let expectedData = Data([0x37])
            XCTAssert(data == expectedData, "Unexpected data \"\(String(describing: data))\" is returned while data \"(\(String(describing: expectedData))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }

    func testDataNull() {
        do {
            let data = try JsonSerialization.dataNull()

            let expectedData = Data([0x6e, 0x75, 0x6c, 0x6c])
            XCTAssert(data == expectedData, "Unexpected data \"\(String(describing: data))\" is returned while data \"(\(String(describing: expectedData))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
    func testDataBoolean() {
        let boolean = true
        
        do {
            let data = try JsonSerialization.data(boolean)

            let expectedData = Data([0x74, 0x72, 0x75, 0x65])
            XCTAssert(data == expectedData, "Unexpected data \"\(String(describing: data))\" is returned while data \"(\(String(describing: expectedData))\" is expected)")
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
}
