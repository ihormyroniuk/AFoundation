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
        func json(_ any: Any) throws -> JsonValue {
            if let nsString = any as? NSString {
                let string = nsString as String
                return .string(string)
            }
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
            throw AFoundationError("\(String(reflecting: any)) is not JSON value")
        }
        do {
            let any = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
            let jsonValue = try json(any)
            return jsonValue
        } catch {
            throw AFoundationError("\(String(reflecting: data)) is not JSON value\n\(String(reflecting: error))")
        }
    }
    
    // MARK: Deserialization
    
    public static func data(_ value: JsonValue) throws -> Data {
        func any(_ value: JsonValue) -> Any {
            switch value {
            case let .string(string): return string
            case let .number(decimal): return decimal
            case let .object(object): return object.mapValues({ any($0) })
            case let .array(array): return array.map({ any($0) })
            case let .boolean(bool): return bool
            case .null: return NSNull.null
            }
        }
        let data: Data
        do { data = try JSONSerialization.data(withJSONObject: any(value), options: [.fragmentsAllowed]) } catch {
            throw AFoundationError("Cannot get data from \(String(reflecting: value))\n\(String(reflecting: error))")
        }
        return data
    }
    
    public static func data(_ string: String) throws -> Data {
        let data = try JsonSerialization.data(.string(string))
        return data
    }
    
    public static func data(_ decimal: Decimal) throws -> Data {
        let data = try JsonSerialization.data(.number(decimal))
        return data
    }
    
    public static func data(_ object: JsonObject) throws -> Data {
        let data = try JsonSerialization.data(.object(object))
        return data
    }
    
    public static func data(_ array: JsonArray) throws -> Data {
        let data = try JsonSerialization.data(.array(array))
        return data
    }
    
    public static func data(_ bool: Bool) throws -> Data {
        let data = try JsonSerialization.data(.boolean(bool))
        return data
    }
    
    public static func dataNull() throws -> Data {
        let data = try JsonSerialization.data(.null)
        return data
    }
}
