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
                let dictionaryStringJsonValue: JsonObject
                do { dictionaryStringJsonValue = try dictionaryStringAny.mapValues({ try json($0) }) } catch {
                    throw NotJsonValueError(data: data, error: error)
                }
                return .object(dictionaryStringJsonValue)
            }
            if let arrayAny = any as? [Any] {
                let arrayJsonValue: JsonArray
                do { arrayJsonValue = try arrayAny.map({ try json($0) }) } catch {
                    throw NotJsonValueError(data: data, error: error)
                }
                return .array(arrayJsonValue)
            }
            if let bool = any as? Bool { return .boolean(bool) }
            if any is NSNull { return .null }
            throw AnyNotJsonValueError(any: any)
        }
        do {
            let any = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
            let jsonValue = try json(any)
            return jsonValue
        } catch {
            throw NotJsonValueError(data: data, error: error)
        }
    }
    private struct AnyNotJsonValueError: Error, CustomDebugStringConvertible {
        private let fileId: StaticString
        private let line: UInt
        private let any: Any
        
        init(fileId: StaticString = #fileID, line: UInt = #line, any: Any) {
            self.fileId = fileId
            self.line = line
            self.any = any
        }
        
        var debugDescription: String {
            return "\(fileId):\(String(reflecting: line))\n\(String(reflecting: any)) is not JSON value"
        }
    }
    private struct NotJsonValueError: Error, CustomDebugStringConvertible {
        private let fileId: StaticString
        private let line: UInt
        private let data: Data
        private let error: Error
        
        init(fileId: StaticString = #fileID, line: UInt = #line, data: Data, error: Error) {
            self.fileId = fileId
            self.line = line
            self.data = data
            self.error = error
        }
        
        var debugDescription: String {
            return "\(fileId):\(String(reflecting: line))\n\(String(reflecting: data)) is not JSON value\n\(String(reflecting: error))"
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
            throw NotDataError(value: value, error: error)
        }
        return data
    }
    private struct NotDataError: Error, CustomDebugStringConvertible {
        private let fileId: StaticString
        private let line: UInt
        private let value: JsonValue
        private let error: Error
        
        init(fileId: StaticString = #fileID, line: UInt = #line, value: JsonValue, error: Error) {
            self.fileId = fileId
            self.line = line
            self.value = value
            self.error = error
        }
        
        var debugDescription: String {
            return "\(fileId):\(String(reflecting: line))\nCannot get data from \(String(reflecting: value))\n\(String(reflecting: error))"
        }
    }
    
    public static func data(_ jsonValue: JsonObject) throws -> Data {
        let data = try JsonSerialization.data(.object(jsonValue))
        return data
    }
    
    public static func data(_ jsonArray: JsonArray) throws -> Data {
        let data = try JsonSerialization.data(.array(jsonArray))
        return data
    }
    
}
