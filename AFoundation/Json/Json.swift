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








public enum JsonSerialization {
    
    public static func jsonValue(data: Data) throws -> JsonValue1 {
        let any: Any
        do { any  = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed]) } catch {
            let error = DataIsNotJsonError(data: data)
            throw error
        }
        guard let jsonValue = JsonValue1.from(any) else {
            let error = DataIsNotJsonError(data: data)
            throw error
        }
        return jsonValue
    }
    
    public static func data(jsonValue: JsonValue1) throws -> Data {
        let data = try JSONSerialization.data(withJSONObject: jsonValue, options: [.fragmentsAllowed])
        return data
    }
    
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
}

public class JsonString1: JsonValue1 {
    public let string: String
    
    public init(string: String) {
        self.string = string
        super.init()
    }
    
    public static func == (lhs: JsonString1, rhs: JsonString1) -> Bool {
        return lhs.string == rhs.string
    }
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(string)
    }
}

public class JsonNumber1: JsonValue1 {
    public let decimal: Decimal
    
    public init(decimal: Decimal) {
        self.decimal = decimal
        super.init()
    }
    
    public static func == (lhs: JsonNumber1, rhs: JsonNumber1) -> Bool {
        return lhs.decimal == rhs.decimal
    }
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(decimal)
    }
}

public class JsonObject1: JsonValue1 {
    public let dictionary: [JsonString1: JsonValue1]
    
    public init(dictionary: [JsonString1: JsonValue1]) {
        self.dictionary = dictionary
        super.init()
    }
    
    public static func == (lhs: JsonObject1, rhs: JsonObject1) -> Bool {
        return lhs.dictionary == rhs.dictionary
    }
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(dictionary)
    }
}

public class JsonArray1: JsonValue1 {
    public let array: [JsonValue1]
    
    public init(array: [JsonValue1]) {
        self.array = array
        super.init()
    }
    
    public static func == (lhs: JsonArray1, rhs: JsonArray1) -> Bool {
        return lhs.array == rhs.array
    }
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(array)
    }
}

public class JsonBoolean1: JsonValue1 {
    public let bool: Bool
    
    public init(bool: Bool) {
        self.bool = bool
        super.init()
    }
    
    public static func == (lhs: JsonBoolean1, rhs: JsonBoolean1) -> Bool {
        return lhs.bool == rhs.bool
    }
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(bool)
    }
}

public class JsonNull1: JsonValue1 {
    public let null: NSNull
    
    public init(null: NSNull) {
        self.null = null
        super.init()
    }
    
    public static func == (lhs: JsonNull1, rhs: JsonNull1) -> Bool {
        return lhs.null == rhs.null
    }
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(null)
    }
}
