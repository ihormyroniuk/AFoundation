//
//  Json.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol JsonValue { }

func JsonValueFrom(_ any: Any) -> JsonValue? {
    if let string = any as? String {
        return string
    }
    if let nsString = any as? NSString {
        return nsString as String
    }
    if let decimal = any as? Decimal {
        return decimal
    }
    if let nsNumber = any as? NSNumber, nsNumber !== kCFBooleanTrue, nsNumber !== kCFBooleanFalse {
        return nsNumber.decimalValue
    }
    if let dictionary = any as? [String: Any] {
        var jsonObject = JsonObject()
        for (key, value) in dictionary {
            guard let jsonValue = JsonValueFrom(value) else {
                return nil
            }
            jsonObject[key] = jsonValue
        }
        return jsonObject
    }
    if let array = any as? [Any] {
        var jsonArray = JsonArray()
        for value in array {
            guard let jsonValue = JsonValueFrom(value) else {
                return nil
            }
            jsonArray.append(jsonValue)
        }
        return jsonArray
    }
    if let bool = any as? Bool {
        return bool
    }
    if let nsNull = any as? NSNull {
        return nsNull
    }
    return nil
}

/**
    Implemented based on https://www.json.org/json-en.html
 */
public class JsonValue1: Equatable, Hashable {
    init() {
        
    }
    
    public static func == (lhs: JsonValue1, rhs: JsonValue1) -> Bool {
        if let lhsJsonString = lhs as? JsonString1, let rhsJsonString = rhs as? JsonString1 {
            return lhsJsonString == rhsJsonString
        }
        if let lhsJsonNumber = lhs as? JsonNumber1, let rhsJsonNumber = rhs as? JsonNumber1 {
            return lhsJsonNumber == rhsJsonNumber
        }
        if let lhsJsonObject = lhs as? JsonObject1, let rhsJsonObject = rhs as? JsonObject1 {
            return lhsJsonObject == rhsJsonObject
        }
        if let lhsJsonArray = lhs as? JsonArray1, let rhsJsonArray = rhs as? JsonArray1 {
            return lhsJsonArray == rhsJsonArray
        }
        if let lhsJsonBoolean = lhs as? JsonBoolean1, let rhsJsonBoolean = rhs as? JsonBoolean1 {
            return lhsJsonBoolean == rhsJsonBoolean
        }
        if let lhsJsonNull = lhs as? JsonNull1, let rhsJsonNull = rhs as? JsonNull1 {
            return lhsJsonNull == rhsJsonNull
        }
        return false
    }
    
    public func hash(into hasher: inout Hasher) { }
    
    static func from(_ any: Any) -> JsonValue1? {
        if let string = any as? String {
            return JsonString1(string: string)
        }
        if let nsString = any as? NSString {
            let string = nsString as String
            return JsonString1(string: string)
        }
        if let decimal = any as? Decimal {
            return JsonNumber1(decimal: decimal)
        }
        if let nsNumber = any as? NSNumber, nsNumber !== kCFBooleanTrue, nsNumber !== kCFBooleanFalse {
            let decimal = nsNumber.decimalValue
            return JsonNumber1(decimal: decimal)
        }
        if let dictionaryStringAny = any as? [String: Any] {
            var dictionaryJsonStringJsonValue: [JsonString1: JsonValue1] = [:]
            for (string, any) in dictionaryStringAny {
                guard let jsonValue = from(any) else {
                    return nil
                }
                dictionaryJsonStringJsonValue[JsonString1(string: string)] = jsonValue
            }
            return JsonObject1(dictionary: dictionaryJsonStringJsonValue)
        }
        if let arrayAny = any as? [Any] {
            var arrayJsonValue: [JsonValue1] = []
            for any in arrayAny {
                guard let jsonValue = from(any) else {
                    return nil
                }
                arrayJsonValue.append(jsonValue)
            }
            return JsonArray1(array: arrayJsonValue)
        }
        if let bool = any as? Bool {
            return JsonBoolean1(bool: bool)
        }
        if let null = any as? NSNull {
            return JsonNull1(null: null)
        }
        return nil
    }
    
    func string() throws -> JsonString1 {
        guard let string = self as? JsonString1 else {
            let error = JsonValueIsNotStringError1(value: self)
            throw error
        }
        return string
    }
    
    func number() throws -> JsonNumber1 {
        guard let number = self as? JsonNumber1 else {
            let error = JsonValueIsNotNumberError1(value: self)
            throw error
        }
        return number
    }
    
    func object() throws -> JsonObject1 {
        guard let object = self as? JsonObject1 else {
            let error = JsonValueIsNotObjectError1(value: self)
            throw error
        }
        return object
    }
    
    func array() throws -> JsonArray1 {
        guard let array = self as? JsonArray1 else {
            let error = JsonValueIsNotArrayError1(value: self)
            throw error
        }
        return array
    }
    
    func boolean() throws -> JsonBoolean1 {
        guard let boolean = self as? JsonBoolean1 else {
            let error = JsonValueIsNotBooleanError1(value: self)
            throw error
        }
        return boolean
    }
    
    func null() throws -> JsonNull1 {
        guard let null = self as? JsonNull1 else {
            let error = JsonValueIsNotNullError1(value: self)
            throw error
        }
        return null
    }
}

public struct JsonValueIsNotStringError1: Error {
    
    private let value: JsonValue1
    
    init(value: JsonValue1) {
        self.value = value
    }
    
}

public struct JsonValueIsNotNumberError1: LocalizedError {
    
    private let value: JsonValue1
    
    init(value: JsonValue1) {
        self.value = value
    }
    
}

public struct JsonValueIsNotObjectError1: LocalizedError {
    
    private let value: JsonValue1
    
    init(value: JsonValue1) {
        self.value = value
    }
    
}

public struct JsonValueIsNotArrayError1: LocalizedError {
    
    private let value: JsonValue1
    
    init(value: JsonValue1) {
        self.value = value
    }
    
}

public struct JsonValueIsNotBooleanError1: LocalizedError {
    
    private let value: JsonValue1
    
    init(value: JsonValue1) {
        self.value = value
    }
    
}

public struct JsonValueIsNotNullError1: LocalizedError {
    
    private let value: JsonValue1
    
    init(value: JsonValue1) {
        self.value = value
    }
    
}
