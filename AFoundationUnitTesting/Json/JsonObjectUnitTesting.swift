import XCTest
import Foundation
@testable import AFoundation

class JsonObjectUnitTesting: XCTestCase {
    
    private var expectedObject: JsonObject {
        ["string": JsonValue("string"), "number": JsonValue(Decimal(1))]
    }
    private var expectedArray: JsonArray {
        [JsonValue("string"), JsonValue(Decimal(1))]
    }
    private var object: JsonObject {
        ["string": JsonValue("string"),
         "number": JsonValue(Decimal(1)),
         "object": JsonValue(expectedObject),
         "array": JsonValue(expectedArray),
         "boolean": JsonValue(true),
         "null": JsonValue.null]
    }
    
    // MARK: - Key
    
    func testHasKeyTrue() {
        let hasKey = object.hasKey("string")
        
        let expectedHasKey = true
        XCTAssert(hasKey == expectedHasKey, "Unexpected \(String(reflecting: hasKey)) is returned, but \(String(reflecting: expectedHasKey)) is expected")
    }
    
    func testHasKeyFalse() {
        let hasKey = object.hasKey("missedString")
        
        let expectedHasKey = false
        XCTAssert(hasKey == expectedHasKey, "Unexpected \(String(reflecting: hasKey)) is returned, but \(String(reflecting: expectedHasKey)) is expected")
    }
    
    // MARK: String

    func testString() {
        do {
            let string = try object.string("string")
            
            let expectedString = "string"
            XCTAssert(string == expectedString, "Unexpected \(String(reflecting: string)) is returned, but \(String(reflecting: expectedString)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testStringNull() {
        do {
            let string = try object.string("null")
            
            XCTFail("Unexpected \(String(reflecting: string)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testStringMissed() {
        do {
            let string = try object.string("missedString")
            
            XCTFail("Unexpected \(String(reflecting: string)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testStringNotString() {
        do {
            let string = try object.string("boolean")
            
            XCTFail("Unexpected \(String(reflecting: string)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableString() {
        do {
            let string = try object.nullableString("string")
            
            let expectedString = "string"
            XCTAssert(string == expectedString, "Unexpected \(String(reflecting: string)) is returned, but \(String(reflecting: expectedString)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableStringNull() {
        do {
            let string = try object.nullableString("null")
            
            let expectedString: String? = nil
            XCTAssert(string == expectedString, "Unexpected \(String(reflecting: string)) is returned, but \(String(reflecting: expectedString)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableStringMissed() {
        do {
            let string = try object.nullableString("missedString")
            
            XCTFail("Unexpected \(String(reflecting: string)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableStringNotString() {
        do {
            let string = try object.nullableString("boolean")
            
            XCTFail("Unexpected \(String(reflecting: string)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testMissableString() {
        do {
            let string = try object.missableString("string")
            
            let expectedString = "string"
            XCTAssert(string == expectedString, "Unexpected \(String(reflecting: string)) is returned, but \(String(reflecting: expectedString)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableStringNull() {
        do {
            let string = try object.missableString("null")
            
            XCTFail("Unexpected \(String(reflecting: string)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testMissableStringMissed() {
        do {
            let string = try object.missableString("missedString")
            
            let expectedString: String? = nil
            XCTAssert(string == expectedString, "Unexpected \(String(reflecting: string)) is returned, but \(String(reflecting: expectedString)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableStringNotString() {
        do {
            let string = try object.missableString("boolean")
            
            XCTFail("Unexpected \(String(reflecting: string)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testMissableNullableString() {
        do {
            let string = try object.missableNullableString("string")
            
            let expectedString = "string"
            XCTAssert(string == expectedString, "Unexpected \(String(reflecting: string)) is returned, but \(String(reflecting: expectedString)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableNullableStringNull() {
        do {
            let string = try object.missableNullableString("null")
            
            let expectedString: String? = nil
            XCTAssert(string == expectedString, "Unexpected \(String(reflecting: string)) is returned, but \(String(reflecting: expectedString)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableNullableStringMissed() {
        do {
            let string = try object.missableNullableString("missedString")
            
            let expectedString: String? = nil
            XCTAssert(string == expectedString, "Unexpected \(String(reflecting: string)) is returned, but \(String(reflecting: expectedString)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableNullableStringNotString() {
        do {
            let string = try object.missableNullableString("boolean")
            
            XCTFail("Unexpected \(String(reflecting: string)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testSetString() {
        var object = JsonObject()
        
        object.setString("string", for: "key")
        let jsonValue = object["key"]
        
        let expextedJsonObject = JsonValue("string")
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }
    
    func testSetNullableString() {
        var object = JsonObject()
        
        object.setNullableString("string", for: "key")
        let jsonValue = object["key"]
        
        let expextedJsonObject = JsonValue("string")
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }
    
    func testSetNullableStringNull() {
        var object = JsonObject()
        
        object.setNullableString(nil, for: "key")
        let jsonValue = object["key"]
        
        let expextedJsonObject = JsonValue.null
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }
    
    func testSetMissableString() {
        var object = JsonObject()
        
        object.setMissableString("string", for: "key")
        let jsonValue = object["key"]
        
        let expextedJsonObject = JsonValue("string")
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }
    
    func testSetMissableStringNull() {
        var object = JsonObject()
        
        object.setMissableString(nil, for: "key")
        let jsonValue = object["key"]
        
        let expextedJsonObject: JsonValue? = nil
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }

    // MARK: Number

    func testNumber() {
        do {
            let number = try object.number("number")
            
            let expectedNumber = Decimal(1)
            XCTAssert(number == expectedNumber, "Unexpected \(String(reflecting: number)) is returned, but \(String(reflecting: expectedNumber)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNumberNull() {
        do {
            let number = try object.number("null")
            
            XCTFail("Unexpected \(String(reflecting: number)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNumberMissed() {
        do {
            let number = try object.number("missedNumber")
            
            XCTFail("Unexpected \(String(reflecting: number)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNumberNotString() {
        do {
            let number = try object.number("boolean")
            
            XCTFail("Unexpected \(String(reflecting: number)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableNumber() {
        do {
            let number = try object.nullableNumber("number")
            
            let expectedNumber = Decimal(1)
            XCTAssert(number == expectedNumber, "Unexpected \(String(reflecting: number)) is returned, but \(String(reflecting: expectedNumber)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableNumberNull() {
        do {
            let number = try object.nullableNumber("null")
            
            let expectedNumber: Decimal? = nil
            XCTAssert(number == expectedNumber, "Unexpected \(String(reflecting: number)) is returned, but \(String(reflecting: expectedNumber)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableNumberMissed() {
        do {
            let number = try object.nullableNumber("missedNumber")
            
            XCTFail("Unexpected \(String(reflecting: number)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableNumberNotNumber() {
        do {
            let number = try object.nullableNumber("boolean")
            
            XCTFail("Unexpected \(String(reflecting: number)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testMissableNumber() {
        do {
            let number = try object.missableNumber("number")
            
            let expectedNumber = Decimal(1)
            XCTAssert(number == expectedNumber, "Unexpected \(String(reflecting: number)) is returned, but \(String(reflecting: expectedNumber)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableNumberNull() {
        do {
            let number = try object.missableNumber("null")
            
            XCTFail("Unexpected \(String(reflecting: number)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testMissableNumberMissed() {
        do {
            let number = try object.missableNumber("missedNumber")
            
            let expectedNumber: Decimal? = nil
            XCTAssert(number == expectedNumber, "Unexpected \(String(reflecting: number)) is returned, but \(String(reflecting: expectedNumber)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableNumberNotNumber() {
        do {
            let number = try object.missableNumber("boolean")
            
            XCTFail("Unexpected \(String(reflecting: number)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testMissableNullableNumber() {
        do {
            let number = try object.missableNullableNumber("number")
            
            let expectedNumber = Decimal(1)
            XCTAssert(number == expectedNumber, "Unexpected \(String(reflecting: number)) is returned, but \(String(reflecting: expectedNumber)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableNullableNumberNull() {
        do {
            let number = try object.missableNullableNumber("null")
            
            let expectedNumber: Decimal? = nil
            XCTAssert(number == expectedNumber, "Unexpected \(String(reflecting: number)) is returned, but \(String(reflecting: expectedNumber)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableNullableNumberMissed() {
        do {
            let string = try object.missableNullableNumber("missedNumber")
            
            let expectedString: Decimal? = nil
            XCTAssert(string == expectedString, "Unexpected \(String(reflecting: string)) is returned, but \(String(reflecting: expectedString)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableNullableNumberNotNumber() {
        do {
            let number = try object.missableNullableNumber("boolean")
            
            XCTFail("Unexpected \(String(reflecting: number)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testSetNumber() {
        var object = JsonObject()
        
        object.setNumber(Decimal(1), for: "key")
        let jsonValue = object["key"]
        
        let expextedJsonObject = JsonValue(Decimal(1))
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }
    
    func testSetNullableNumber() {
        var object = JsonObject()
        
        object.setNullableNumber(Decimal(1), for: "key")
        let jsonValue = object["key"]
        
        let expextedJsonObject = JsonValue(Decimal(1))
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }
    
    func testSetNullableNumberNull() {
        var object = JsonObject()
        
        object.setNullableNumber(nil, for: "key")
        let jsonValue = object["key"]
        
        let expextedJsonObject = JsonValue.null
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }
    
    // MARK: Boolean

    func testBoolean() {
        do {
            let boolean = try object.boolean("boolean")
            
            let expectedNumber = true
            XCTAssert(boolean == expectedNumber, "Unexpected \(String(reflecting: boolean)) is returned, but \(String(reflecting: expectedNumber)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testBooleanNull() {
        do {
            let boolean = try object.boolean("null")
            
            XCTFail("Unexpected \(String(reflecting: boolean)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testBooleanMissed() {
        do {
            let boolean = try object.boolean("missedNumber")
            
            XCTFail("Unexpected \(String(reflecting: boolean)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testBooleanNotBoolean() {
        do {
            let boolean = try object.boolean("string")
            
            XCTFail("Unexpected \(String(reflecting: boolean)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableBoolean() {
        do {
            let boolean = try object.nullableBoolean("boolean")
            
            let expectedBoolean = true
            XCTAssert(boolean == expectedBoolean, "Unexpected \(String(reflecting: boolean)) is returned, but \(String(reflecting: expectedBoolean)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableBooleanNull() {
        do {
            let boolean = try object.nullableBoolean("null")
            
            let expectedBoolean: Bool? = nil
            XCTAssert(boolean == expectedBoolean, "Unexpected \(String(reflecting: boolean)) is returned, but \(String(reflecting: expectedBoolean)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableBooleanMissed() {
        do {
            let boolean = try object.nullableBoolean("missedNumber")
            
            XCTFail("Unexpected \(String(reflecting: boolean)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableBooleanNotNumber() {
        do {
            let boolean = try object.nullableBoolean("string")
            
            XCTFail("Unexpected \(String(reflecting: boolean)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testMissableBoolean() {
        do {
            let boolean = try object.missableBoolean("boolean")
            
            let expectedBoolean = true
            XCTAssert(boolean == expectedBoolean, "Unexpected \(String(reflecting: boolean)) is returned, but \(String(reflecting: expectedBoolean)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableBooleanNull() {
        do {
            let boolean = try object.missableBoolean("null")
            
            XCTFail("Unexpected \(String(reflecting: boolean)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testMissableBooleanMissed() {
        do {
            let boolean = try object.missableBoolean("missedBoolean")
            
            let expectedBoolean: Bool? = nil
            XCTAssert(boolean == expectedBoolean, "Unexpected \(String(reflecting: boolean)) is returned, but \(String(reflecting: expectedBoolean)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableBooleanNotBoolean() {
        do {
            let boolean = try object.missableBoolean("string")
            
            XCTFail("Unexpected \(String(reflecting: boolean)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testMissableNullableBoolean() {
        do {
            let boolean = try object.missableNullableBoolean("boolean")
            
            let expectedBoolean = true
            XCTAssert(boolean == expectedBoolean, "Unexpected \(String(reflecting: boolean)) is returned, but \(String(reflecting: expectedBoolean)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableNullableBooleanNull() {
        do {
            let boolean = try object.missableNullableBoolean("null")
            
            let expectedBoolean: Bool? = nil
            XCTAssert(boolean == expectedBoolean, "Unexpected \(String(reflecting: boolean)) is returned, but \(String(reflecting: expectedBoolean)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableNullableBooleanMissed() {
        do {
            let boolean = try object.missableNullableBoolean("missedBoolean")
            
            let expectedBoolean: Bool? = nil
            XCTAssert(boolean == expectedBoolean, "Unexpected \(String(reflecting: boolean)) is returned, but \(String(reflecting: expectedBoolean)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testMissableNullableBooleanNotBoolean() {
        do {
            let boolean = try object.missableNullableBoolean("string")
            
            XCTFail("Unexpected \(String(reflecting: boolean)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testSetBoolean() {
        var object = JsonObject()
        
        object.setBoolean(true, for: "key")
        let jsonValue = object["key"]
        
        let expextedJsonObject = JsonValue(true)
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }
    
    func testSetNullableBoolean() {
        var object = JsonObject()
        
        object.setNullableBoolean(true, for: "key")
        let jsonValue = object["key"]
        
        let expextedJsonObject = JsonValue(true)
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }
    
    func testSetNullableBooleanNull() {
        var object = JsonObject()
        
        object.setNullableBoolean(nil, for: "key")
        let jsonValue = object["key"]
        
        let expextedJsonObject = JsonValue.null
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }
    
    // MARK: Object

    func testObject() {
        do {
            let object = try object.object("object")
            
            XCTAssert(object == expectedObject, "Unexpected \(String(reflecting: object)) is returned, but \(String(reflecting: expectedObject)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testObjectNull() {
        do {
            let object = try object.object("null")

            XCTFail("Unexpected \(String(reflecting: object)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }

    func testObjectMissed() {
        do {
            let object = try object.object("missedObject")

            XCTFail("Unexpected \(String(reflecting: object)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testObjectNotObject() {
        do {
            let object = try object.object("string")
            
            XCTFail("Unexpected \(String(reflecting: object)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableObject() {
        do {
            let object = try object.nullableObject("object")
            
            XCTAssert(object == expectedObject, "Unexpected \(String(reflecting: object)) is returned, but \(String(reflecting: expectedObject)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableObjectNull() {
        do {
            let object = try object.nullableObject("null")
            
            XCTAssert(object == nil, "Unexpected \(String(reflecting: object)) is returned, but \(String(reflecting: expectedObject)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableObjcetMissed() {
        do {
            let object = try object.nullableObject("missedObject")

            XCTFail("Unexpected \(String(reflecting: object)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }

    func testNullableObjectNotObject() {
        do {
            let object = try object.nullableObject("string")

            XCTFail("Unexpected \(String(reflecting: object)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testMissableObject() {
        do {
            let object = try object.missableObject("object")

            XCTAssert(object == expectedObject, "Unexpected \(String(reflecting: object)) is returned, but \(String(reflecting: expectedObject)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }

    func testMissableObjectNull() {
        do {
            let object = try object.missableObject("null")

            XCTFail("Unexpected \(String(reflecting: object)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }

    func testMissableObjectMissed() {
        do {
            let object = try object.missableObject("missedObject")

            let expectedObject: JsonObject? = nil
            XCTAssert(object == expectedObject, "Unexpected \(String(reflecting: object)) is returned, but \(String(reflecting: expectedObject)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }

    func testMissableObjectNotObject() {
        do {
            let object = try object.missableObject("string")

            XCTFail("Unexpected \(String(reflecting: object)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }

    func testMissableNullableObject() {
        do {
            let object = try object.missableNullableObject("object")

            XCTAssert(object == expectedObject, "Unexpected \(String(reflecting: object)) is returned, but \(String(reflecting: expectedObject)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }

    func testMissableNullableObjectNull() {
        do {
            let object = try object.missableNullableObject("null")

            let expectedObject: JsonObject? = nil
            XCTAssert(object == expectedObject, "Unexpected \(String(reflecting: object)) is returned, but \(String(reflecting: expectedObject)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }

    func testMissableNullableObjectMissed() {
        do {
            let object = try object.missableNullableObject("missedObject")

            let expectedObject: JsonObject? = nil
            XCTAssert(object == expectedObject, "Unexpected \(String(reflecting: object)) is returned, but \(String(reflecting: expectedObject)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }

    func testMissableNullableObjectNotObject() {
        do {
            let object = try object.missableNullableObject("string")

            XCTFail("Unexpected \(String(reflecting: object)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }

    func testSetObject() {
        var object = JsonObject()

        object.setObject(expectedObject, for: "key")
        let jsonValue = object["key"]

        let expextedJsonObject = JsonValue(expectedObject)
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }

    func testSetNullableObject() {
        var object = JsonObject()

        object.setNullableObject(expectedObject, for: "key")
        let jsonValue = object["key"]

        let expextedJsonObject = JsonValue(expectedObject)
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }

    func testSetNullableObjectNull() {
        var object = JsonObject()

        object.setNullableObject(nil, for: "key")
        let jsonValue = object["key"]

        let expextedJsonObject = JsonValue.null
        XCTAssert(jsonValue == expextedJsonObject, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonObject)) is expected")
    }
    
    // MARK: Array

    func testArray() {
        do {
            let array = try object.array("array")
            
            XCTAssert(array == expectedArray, "Unexpected \(String(reflecting: array)) is returned, but \(String(reflecting: expectedArray)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testArrayNull() {
        do {
            let array = try object.array("null")

            XCTFail("Unexpected \(String(reflecting: array)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }

    func testArrayMissed() {
        do {
            let array = try object.array("missedArray")

            XCTFail("Unexpected \(String(reflecting: array)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testArrayNotArray() {
        do {
            let array = try object.array("string")
            
            XCTFail("Unexpected \(String(reflecting: array)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testNullableArray() {
        do {
            let array = try object.nullableArray("array")
            
            XCTAssert(array == expectedArray, "Unexpected \(String(reflecting: array)) is returned, but \(String(reflecting: expectedArray)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableArrayNull() {
        do {
            let array = try object.nullableArray("null")
            
            XCTAssert(array == nil, "Unexpected \(String(reflecting: array)) is returned, but \(String(reflecting: expectedArray)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }
    
    func testNullableArrayMissed() {
        do {
            let array = try object.nullableArray("missedArray")

            XCTFail("Unexpected \(String(reflecting: array)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }

    func testNullableArrayNotArray() {
        do {
            let array = try object.nullableArray("string")

            XCTFail("Unexpected \(String(reflecting: array)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testMissableArray() {
        do {
            let array = try object.missableArray("array")

            XCTAssert(array == expectedArray, "Unexpected \(String(reflecting: array)) is returned, but \(String(reflecting: expectedArray)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }

    func testMissableArrayNull() {
        do {
            let array = try object.missableArray("null")

            XCTFail("Unexpected \(String(reflecting: array)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }

    func testMissableArrayMissed() {
        do {
            let array = try object.missableArray("missedArray")

            let expectedArray: JsonArray? = nil
            XCTAssert(array == expectedArray, "Unexpected \(String(reflecting: array)) is returned, but \(String(reflecting: expectedArray)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }

    func testMissableArrayNotArray() {
        do {
            let array = try object.missableArray("string")

            XCTFail("Unexpected \(String(reflecting: array)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }

    func testMissableNullableArray() {
        do {
            let array = try object.missableNullableArray("array")

            XCTAssert(array == expectedArray, "Unexpected \(String(reflecting: array)) is returned, but \(String(reflecting: expectedArray)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }

    func testMissableNullableArrayNull() {
        do {
            let array = try object.missableNullableArray("null")

            let expectedArray: JsonArray? = nil
            XCTAssert(array == expectedArray, "Unexpected \(String(reflecting: array)) is returned, but \(String(reflecting: expectedArray)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }

    func testMissableNullableArrayMissed() {
        do {
            let array = try object.missableNullableArray("missedArray")

            let expectedArray: JsonArray? = nil
            XCTAssert(array == expectedArray, "Unexpected \(String(reflecting: array)) is returned, but \(String(reflecting: expectedArray)) is expected")
        } catch {
            XCTFail("Unexpected error \(String(reflecting: error)) is thrown")
        }
    }

    func testMissableNullableArrayNotArray() {
        do {
            let array = try object.missableNullableArray("string")

            XCTFail("Unexpected \(String(reflecting: array)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }

    func testSetArray() {
        var object = JsonObject()

        object.setArray(expectedArray, for: "key")
        let jsonValue = object["key"]

        let expextedJsonArray = JsonValue(expectedArray)
        XCTAssert(jsonValue == expextedJsonArray, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonArray)) is expected")
    }

    func testSetNullableArray() {
        var object = JsonObject()

        object.setNullableArray(expectedArray, for: "key")
        let jsonValue = object["key"]

        let expextedJsonArray = JsonValue(expectedArray)
        XCTAssert(jsonValue == expextedJsonArray, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonArray)) is expected")
    }

    func testSetNullableArrayNull() {
        var object = JsonObject()

        object.setNullableArray(nil, for: "key")
        let jsonValue = object["key"]

        let expextedJsonArray = JsonValue.null
        XCTAssert(jsonValue == expextedJsonArray, "Unexpected \(String(reflecting: jsonValue)) is returned, but \(String(reflecting: expextedJsonArray)) is expected")
    }
    
}
