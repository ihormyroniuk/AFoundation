//
//  JsonObjectSerrialization.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct DataIsNotJsonError: LocalizedError {
    
    private let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
}

public enum JsonSerialization {
    
    public static func jsonValue(data: Data) throws -> JsonAnyValue {
        let any: Any
        do { any  = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed]) } catch {
            let error = DataIsNotJsonError(data: data)
            throw error
        }
        func json(_ any: Any) -> JsonAnyValue? {
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
                var dictionaryStringJsonValue: [String: JsonAnyValue] = [:]
                for (string, any) in dictionaryStringAny {
                    guard let jsonValue = json(any) else {
                        return nil
                    }
                    dictionaryStringJsonValue[String( string)] = jsonValue
                }
                return .object(dictionaryStringJsonValue)
            }
            if let arrayAny = any as? [Any] {
                var arrayJsonValue: [JsonAnyValue] = []
                for any in arrayAny {
                    guard let jsonValue = json(any) else {
                        return nil
                    }
                    arrayJsonValue.append(jsonValue)
                }
                return .array(arrayJsonValue)
            }
            if let bool = any as? Bool {
                return .boolean(bool)
            }
            if any is NSNull {
                return .null
            }
            return nil
        }
        guard let jsonValue = json(any) else {
            let error = DataIsNotJsonError(data: data)
            throw error
        }
        return jsonValue
    }
    
    public static func data(jsonValue: JsonAnyValue) throws -> Data {
        func any(_ jsonValue: JsonAnyValue) -> Any {
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
