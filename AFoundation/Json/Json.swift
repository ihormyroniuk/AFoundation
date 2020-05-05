//
//  JSON.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JSONSerialization {
    
    class func object(with data: Data, options opt: JSONSerialization.ReadingOptions = []) throws -> JsonObject {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let object = json as? JsonObject else {
            let error = JsonParsingErrorJsonIsNotObject(json: json)
            throw error
        }
        return object
    }
    
    class func array(with data: Data, options opt: JSONSerialization.ReadingOptions = []) throws -> JsonArray {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let array = json as? JsonArray else {
            let error = JsonParsingErrorJsonIsNotArray(json: json)
            throw error
        }
        return array
    }
    
    class func objectsArray(with data: Data, options opt: JSONSerialization.ReadingOptions = []) throws -> JsonObjectsArray {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let array = json as? JsonObjectsArray else {
            let error = JsonParsingErrorJsonIsNotObjectsArray(json: json)
            throw error
        }
        return array
    }
    
}

public typealias JsonObject = [String: Any]
public typealias JsonArray = [Any]
public typealias JsonObjectsArray = [JsonObject]
public typealias JsonStringsArray = [String]

public extension JsonObject {
    
    func stringForKey(_ key: String) throws -> String {
        let value = self[key]
        guard let string = value as? String else {
            if self[key] == nil {
                let error = JsonParsingErrorObjectKeyIsMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonParsingErrorObjectValueForKeyIsNotString(object: self, key: key, value: value!)
                throw error
            }
        }
        return string
    }
    
    func numberForKey(_ key: String) throws -> NSNumber {
        let value = self[key]
        guard let number = value as? NSNumber else {
            if self[key] == nil {
                let error = JsonParsingErrorObjectKeyIsMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonParsingErrorObjectValueForKeyIsNotNumber(object: self, key: key, value: value!)
                throw error
            }
        }
        return number
    }
    
    func boolForKey(_ key: String) throws -> Bool {
        let value = self[key]
        guard let bool = value as? Bool else {
            if self[key] == nil {
                let error = JsonParsingErrorObjectKeyIsMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonParsingErrorObjectValueForKeyIsNotBool(object: self, key: key, value: value!)
                throw error
            }
        }
        return bool
    }
    
    func stringsArrayForKey(_ key: String) throws -> JsonStringsArray {
        let value = self[key]
        guard let stringsArray = value as? JsonStringsArray else {
            if self[key] == nil {
                let error = JsonParsingErrorObjectKeyIsMissing(object: self, key: key)
                throw error
            } else {
                let error = JsonParsingErrorObjectValueForKeyIsNotStringsArray(object: self, key: key, value: value!)
                throw error
            }
        }
        return stringsArray
    }
    
}

public struct JsonParsingErrorJsonIsNotObject: Error {
    
    private let json: Any
    
    init(json: Any) {
        self.json = json
    }
    
}

public struct JsonParsingErrorJsonIsNotArray: Error {
    
    private let json: Any
    
    init(json: Any) {
        self.json = json
    }
    
}

public struct JsonParsingErrorJsonIsNotObjectsArray: Error {
    
    private let json: Any
    
    init(json: Any) {
        self.json = json
    }
    
}

public struct JsonParsingErrorObjectKeyIsMissing: Error {
    
    private let object: JsonObject
    private let key: String
    
    init(object: JsonObject, key: String) {
        self.object = object
        self.key = key
    }
    
}

public struct JsonParsingErrorObjectValueForKeyIsNotString: Error {
    
    private let object: JsonObject
    private let key: String
    private let value: Any
    
    init(object: JsonObject, key: String, value: Any) {
        self.object = object
        self.key = key
        self.value = value
    }
    
}

public struct JsonParsingErrorObjectValueForKeyIsNotNumber: Error {
    
    private let object: JsonObject
    private let key: String
    private let value: Any
    
    init(object: JsonObject, key: String, value: Any) {
        self.object = object
        self.key = key
        self.value = value
    }
    
}

public struct JsonParsingErrorObjectValueForKeyIsNotBool: Error {
    
    private let object: JsonObject
    private let key: String
    private let value: Any
    
    init(object: JsonObject, key: String, value: Any) {
        self.object = object
        self.key = key
        self.value = value
    }
    
}

public struct JsonParsingErrorObjectValueForKeyIsNotStringsArray: Error {
    
    private let object: JsonObject
    private let key: String
    private let value: Any
    
    init(object: JsonObject, key: String, value: Any) {
        self.object = object
        self.key = key
        self.value = value
    }
    
}
