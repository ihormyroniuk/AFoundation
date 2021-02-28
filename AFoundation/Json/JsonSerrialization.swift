//
//  JsonObjectSerrialization.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public enum JsonSerialization {
    
    public static func jsonValue(data: Data) throws -> JsonValue {
        let any: Any
        do { any  = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed]) } catch {
            let error = DataIsNotJsonError(data: data)
            throw error
        }
        func json(_ any: Any) throws -> JsonValue {
            if let string = any as? String {
                return .string(string)
            }
            if let nsString = any as? NSString {
                let string = nsString as String
                return .string(string)
            }
            if let decimal = any as? Decimal {
                return .number(decimal)
            }
            if let nsNumber = any as? NSNumber, nsNumber !== kCFBooleanTrue, nsNumber !== kCFBooleanFalse {
                let decimal = nsNumber.decimalValue
                return .number(decimal)
            }
            if let dictionaryStringAny = any as? [String: Any] {
                var dictionaryStringJsonValue: [String: JsonValue] = [:]
                for (string, any) in dictionaryStringAny {
                    let jsonValue = try json(any)
                    dictionaryStringJsonValue[String( string)] = jsonValue
                }
                return .object(dictionaryStringJsonValue)
            }
            if let arrayAny = any as? [Any] {
                var arrayJsonValue: [JsonValue] = []
                for any in arrayAny {
                    let jsonValue = try json(any)
                    arrayJsonValue.append(jsonValue)
                }
                return .array(arrayJsonValue)
            }
            if let bool = any as? Bool { return .boolean(bool) }
            if any is NSNull { return .null }
            throw DataIsNotJsonError(data: data)
        }
        let jsonValue = try json(any)
        return jsonValue
    }
    private struct DataIsNotJsonError: LocalizedError {
        let data: Data
    }
    
    public static func data(jsonValue: JsonValue) throws -> Data {
        func any(_ jsonValue: JsonValue) -> Any {
            switch jsonValue {
            case let .string(string):
                return string
            case let .number(decimal):
                return decimal
            case let .object(object):
                var dictionaryStringAny: [String: Any] = [:]
                for (string, jsonValue) in object {
                    dictionaryStringAny[string] = any(jsonValue)
                }
                return dictionaryStringAny
            case let .array(array):
                var arrayAny: [Any] = []
                for jsonValue in array {
                    arrayAny.append(any(jsonValue))
                }
                return arrayAny
            case let .boolean(bool):
                return bool
            case .null:
                return NSNull.null
            }
        }
        let data = try JSONSerialization.data(withJSONObject: any(jsonValue), options: [.fragmentsAllowed])
        return data
    }
    
    public static func data(_ jsonValue: JsonObject) throws -> Data {
        let data = try JsonSerialization.data(jsonValue: .object(jsonValue))
        return data
    }
    
}
