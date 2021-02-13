//
//  Json.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://www.json.org/json-en.html
 */
public class JsonValue: Equatable, Hashable {
    init() {
        
    }
    
    public static func == (lhs: JsonValue, rhs: JsonValue) -> Bool {
        if let lhsJsonString = lhs as? JsonString, let rhsJsonString = rhs as? JsonString {
            return lhsJsonString == rhsJsonString
        }
        if let lhsJsonNumber = lhs as? JsonNumber, let rhsJsonNumber = rhs as? JsonNumber {
            return lhsJsonNumber == rhsJsonNumber
        }
        if let lhsJsonObject = lhs as? JsonObject, let rhsJsonObject = rhs as? JsonObject {
            return lhsJsonObject == rhsJsonObject
        }
        if let lhsJsonArray = lhs as? JsonArray, let rhsJsonArray = rhs as? JsonArray {
            return lhsJsonArray == rhsJsonArray
        }
        if let lhsJsonBoolean = lhs as? JsonBoolean, let rhsJsonBoolean = rhs as? JsonBoolean {
            return lhsJsonBoolean == rhsJsonBoolean
        }
        if let lhsJsonNull = lhs as? JsonNull, let rhsJsonNull = rhs as? JsonNull {
            return lhsJsonNull == rhsJsonNull
        }
        return false
    }
    
    public func hash(into hasher: inout Hasher) { }
    
    static func toAny(_ jsonValue: JsonValue) -> Any {
        if let jsonsString = jsonValue as? JsonString {
            return jsonsString.string
        }
        if let jsonNumber = jsonValue as? JsonNumber {
            return jsonNumber.decimal
        }
        if let jsonObject = jsonValue as? JsonObject {
            var dictionaryStringAny: [String: Any] = [:]
            for (jsonString, jsonValue) in jsonObject.dictionary {
                dictionaryStringAny[jsonString.string] = toAny(jsonValue)
            }
            return dictionaryStringAny
        }
        if let jsonArray = jsonValue as? JsonArray {
            var arrayAny: [Any] = []
            for jsonValue in jsonArray.array {
                arrayAny.append(toAny(jsonValue))
            }
            return arrayAny
        }
        if let jsonBoolean = jsonValue as? JsonBoolean {
            return jsonBoolean.bool
        }
        if let jsonNull = jsonValue as? JsonNull {
            return jsonNull.null
        }
        fatalError()
    }
    
    static func from(_ any: Any) -> JsonValue? {
        if let string = any as? String {
            return JsonString(string)
        }
        if let nsString = any as? NSString {
            let string = nsString as String
            return JsonString(string)
        }
        if let decimal = any as? Decimal {
            return JsonNumber(decimal)
        }
        if let nsNumber = any as? NSNumber, nsNumber !== kCFBooleanTrue, nsNumber !== kCFBooleanFalse {
            let decimal = nsNumber.decimalValue
            return JsonNumber(decimal)
        }
        if let dictionaryStringAny = any as? [String: Any] {
            var dictionaryJsonStringJsonValue: [JsonString: JsonValue] = [:]
            for (string, any) in dictionaryStringAny {
                guard let jsonValue = from(any) else {
                    return nil
                }
                dictionaryJsonStringJsonValue[JsonString( string)] = jsonValue
            }
            return JsonObject(dictionary: dictionaryJsonStringJsonValue)
        }
        if let arrayAny = any as? [Any] {
            var arrayJsonValue: [JsonValue] = []
            for any in arrayAny {
                guard let jsonValue = from(any) else {
                    return nil
                }
                arrayJsonValue.append(jsonValue)
            }
            return JsonArray(array: arrayJsonValue)
        }
        if let bool = any as? Bool {
            return JsonBoolean(bool: bool)
        }
        if any is NSNull {
            return JsonNull()
        }
        return nil
    }
    
    public func string() throws -> JsonString {
        guard let string = self as? JsonString else {
            let error = JsonValueIsNotStringError(value: self)
            throw error
        }
        return string
    }
    
    public func number() throws -> JsonNumber {
        guard let number = self as? JsonNumber else {
            let error = JsonValueIsNotNumberError(value: self)
            throw error
        }
        return number
    }
    
    public func object() throws -> JsonObject {
        guard let object = self as? JsonObject else {
            let error = JsonValueIsNotObjectError(value: self)
            throw error
        }
        return object
    }
    
    public func array() throws -> JsonArray {
        guard let array = self as? JsonArray else {
            let error = JsonValueIsNotArrayError(value: self)
            throw error
        }
        return array
    }
    
    public func boolean() throws -> JsonBoolean {
        guard let boolean = self as? JsonBoolean else {
            let error = JsonValueIsNotBooleanError(value: self)
            throw error
        }
        return boolean
    }
    
    public func null() throws -> JsonNull {
        guard let null = self as? JsonNull else {
            let error = JsonValueIsNotNullError(value: self)
            throw error
        }
        return null
    }
}

public struct JsonValueIsNotStringError: Error {
    
    private let value: JsonValue
    
    init(value: JsonValue) {
        self.value = value
    }
    
}

public struct JsonValueIsNotNumberError: LocalizedError {
    
    private let value: JsonValue
    
    init(value: JsonValue) {
        self.value = value
    }
    
}

public struct JsonValueIsNotObjectError: LocalizedError {
    
    private let value: JsonValue
    
    init(value: JsonValue) {
        self.value = value
    }
    
}

public struct JsonValueIsNotArrayError: LocalizedError {
    
    private let value: JsonValue
    
    init(value: JsonValue) {
        self.value = value
    }
    
}

public struct JsonValueIsNotBooleanError: LocalizedError {
    
    private let value: JsonValue
    
    init(value: JsonValue) {
        self.value = value
    }
    
}

public struct JsonValueIsNotNullError: LocalizedError {
    
    private let value: JsonValue
    
    init(value: JsonValue) {
        self.value = value
    }
    
}
