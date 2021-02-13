//
//  JsonObject.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonObject = [JsonString: JsonValue]
extension JsonObject: JsonValue { }

public func ==(lhs: JsonObject, rhs: JsonObject) -> Bool {
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}

public func ==(lhs: JsonObject?, rhs: JsonObject) -> Bool {
    guard let lhs = lhs else { return false }
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}

public extension JsonValue {
    
    func object() throws -> JsonObject {
        guard let object = self as? JsonObject else {
            let error = JsonValueIsNotObjectError(value: self)
            throw error
        }
        return object
    }
    
}

public struct JsonValueIsNotObjectError: LocalizedError {
    
    private let value: JsonValue
    
    init(value: JsonValue) {
        self.value = value
    }
    
}

public class JsonObject1: JsonValue1, ExpressibleByDictionaryLiteral {
    public typealias Key = JsonString1
    public typealias Value = JsonValue1
    
    required public init(dictionaryLiteral elements: (JsonString1, JsonValue1)...) {
        var dictionary: [JsonString1: JsonValue1] = [:]
        for element in elements {
            dictionary[element.0] = element.1
        }
        self.dictionary = dictionary
    }
    
    public var dictionary: [JsonString1: JsonValue1]
    
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
    
    subscript(index: JsonString1) -> JsonValue1? {
        get {
            return dictionary[index]
        }
        set(newValue) {
            dictionary[index] = newValue
        }
    }
    
    func value(_ key: JsonString1) throws -> JsonValue1 {
        let optionalValue = self[key]
        guard let value = optionalValue else {
            let error = JsonErrorValueMissing1(object: self, key: key)
            throw error
        }
        return value
    }
    
    func string(_ key: JsonString1) throws -> JsonString1 {
        let value = self[key]
        guard let string = value as? JsonString1 else {
            if value == nil {
                let error = JsonErrorValueMissing1(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotStringError1(value: value!)
                throw error
            }
        }
        return string
    }

    func optionalString(_ key: JsonString1) throws -> JsonString1? {
        let value = self[key]
        if let string = value as? JsonString1 {
            return string
        } else if value is JsonNull1 {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing1(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotStringError1(value: value!)
        throw error
    }
    
    func number(_ key: JsonString1) throws -> JsonNumber1 {
        let value = self[key]
        guard let number = value as? JsonNumber1 else {
            if value == nil {
                let error = JsonErrorValueMissing1(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotNumberError1(value: value!)
                throw error
            }
        }
        return number
    }

    func optionalNumber(_ key: JsonString1) throws -> JsonNumber1? {
        let value = self[key]
        if let number = value as? JsonNumber1 {
            return number
        } else if value is JsonNull1 {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing1(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotNumberError1(value: value!)
        throw error
    }
    
    func object(_ key: JsonString1) throws -> JsonObject1 {
        let value = self[key]
        guard let object = value as? JsonObject1 else {
            if value == nil {
                let error = JsonErrorValueMissing1(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotObjectError1(value: value!)
                throw error
            }
        }
        return object
    }

    func optionalObject(_ key: JsonString1) throws -> JsonObject1? {
        let value = self[key]
        if let object = value as? JsonObject1 {
            return object
        } else if value is JsonNull1 {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing1(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotObjectError1(value: value!)
        throw error
    }
    
    func array(_ key: JsonString1) throws -> JsonArray1 {
        let value = self[key]
        guard let array = value as? JsonArray1 else {
            if value == nil {
                let error = JsonErrorValueMissing1(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotArrayError1(value: value!)
                throw error
            }
        }
        return array
    }

    func optionalArray(_ key: JsonString1) throws -> JsonArray1? {
        let value = self[key]
        if let array = value as? JsonArray1 {
            return array
        } else if value is JsonNull1 {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing1(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotArrayError1(value: value!)
        throw error
    }
    
    func boolean(_ key: JsonString1) throws -> JsonBoolean1 {
        let value = self[key]
        guard let boolean = value as? JsonBoolean1 else {
            if value == nil {
                let error = JsonErrorValueMissing1(object: self, key: key)
                throw error
            } else {
                let error = JsonValueIsNotBooleanError1(value: value!)
                throw error
            }
        }
        return boolean
    }

    func optionalBoolean(_ key: JsonString1) throws -> JsonBoolean1? {
        let value = self[key]
        if let boolean = value as? JsonBoolean1 {
            return boolean
        } else if value is JsonNull1 {
            return nil
        } else if value == nil {
            let error = JsonErrorValueMissing1(object: self, key: key)
            throw error
        }
        let error = JsonValueIsNotBooleanError1(value: value!)
        throw error
    }
}
