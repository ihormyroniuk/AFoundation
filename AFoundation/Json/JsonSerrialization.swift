//
//  JsonObjectSerrialization.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public enum JsonSerialization {
    
    // MARK: Serialization
    
    public static func jsonValue(_ data: Data) throws -> JsonValue {
        let any: Any
        do { any  = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed]) } catch {
            throw NotJsonValueError(data: data)
        }
        func json(_ any: Any) throws -> JsonValue {
            if let string = any as? String { return .string(string) }
            if let nsString = any as? NSString {
                let string = nsString as String
                return .string(string)
            }
            if let decimal = any as? Decimal { return .number(decimal) }
            if let nsNumber = any as? NSNumber, nsNumber !== kCFBooleanTrue, nsNumber !== kCFBooleanFalse {
                let decimal = nsNumber.decimalValue
                return .number(decimal)
            }
            if let dictionaryStringAny = any as? [String: Any] {
                let dictionaryStringJsonValue = try dictionaryStringAny.mapValues({ try json($0) })
                return .object(dictionaryStringJsonValue)
            }
            if let arrayAny = any as? [Any] {
                let arrayJsonValue = try arrayAny.map({ try json($0) })
                return .array(arrayJsonValue)
            }
            if let bool = any as? Bool { return .boolean(bool) }
            if any is NSNull { return .null }
            throw NotJsonValueError(data: data)
        }
        let jsonValue = try json(any)
        return jsonValue
    }
    private struct NotJsonValueError: LocalizedError {
        let data: Data
    }
    
    // MARK: Deserialization
    
    public static func data(_ jsonValue: JsonValue) throws -> Data {
        func any(_ jsonValue: JsonValue) -> Any {
            switch jsonValue {
            case let .string(string): return string
            case let .number(decimal): return decimal
            case let .object(object): return object.mapValues({ any($0) })
            case let .array(array): return array.map({ any($0) })
            case let .boolean(bool): return bool
            case .null: return NSNull.null
            }
        }
        let data: Data
        do { data = try JSONSerialization.data(withJSONObject: any(jsonValue), options: [.fragmentsAllowed]) } catch {
            throw NotDataError(jsonValue: jsonValue)
        }
        return data
    }
    private struct NotDataError: LocalizedError {
        let jsonValue: JsonValue
    }
    
    public static func data(_ jsonValue: JsonObject) throws -> Data {
        let data = try JsonSerialization.data(.object(jsonValue))
        return data
    }
    
}
