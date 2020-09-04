//
//  Json.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol AJsonValue { }
extension String: AJsonValue { }
extension NSNumber: AJsonValue { }
extension Bool: AJsonValue { }
extension NSNull: AJsonValue { }
extension AJsonObject: AJsonValue { }
extension AJsonArray: AJsonValue { }
public typealias AJsonString = String
public typealias AJsonNumber = NSNumber
public typealias AJsonObject = [AJsonString: AJsonValue]
public typealias AJsonArray = [AJsonValue]
public typealias AJsonBoolean = Bool
public typealias AJsonNull = NSNull

// MARK: Object

public extension AJsonObject {
    
    func jsonString(_ key: AJsonString) throws -> AJsonString {
        let value = self[key]
        guard let string = value as? AJsonString else {
            if self[key] == nil {
                let error = AJsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = AJsonErrorValueNotString(object: self, key: key, value: value!)
                throw error
            }
        }
        return string
    }
    
    func optionalJsonString(_ key: AJsonString) throws -> AJsonString? {
        let value = self[key]
        guard let string = value as? AJsonString else {
            if self[key] == nil {
                return nil
            } else {
                let error = AJsonErrorValueNotString(object: self, key: key, value: value!)
                throw error
            }
        }
        return string
    }
    
    func jsonNumber(_ key: AJsonString) throws -> AJsonNumber {
        let value = self[key]
        guard let number = value as? NSNumber else {
            if self[key] == nil {
                let error = AJsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = AJsonErrorValueNotNumber(object: self, key: key, value: value!)
                throw error
            }
        }
        return number
    }
    
    func optionalJsonNumber(_ key: AJsonString) throws -> AJsonNumber? {
        let value = self[key]
        guard let number = value as? NSNumber else {
            if self[key] == nil {
                return nil
            } else {
                let error = AJsonErrorValueNotNumber(object: self, key: key, value: value!)
                throw error
            }
        }
        return number
    }
    
    func jsonObject(_ key: AJsonString) throws -> AJsonObject {
        let value = self[key]
        guard let object = value as? AJsonObject else {
            if self[key] == nil {
                let error = AJsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = AJsonErrorValueNotObject(object: self, key: key, value: value!)
                throw error
            }
        }
        return object
    }
    
    func optionalJsonObject(_ key: AJsonString) throws -> AJsonObject? {
        let value = self[key]
        guard let object = value as? AJsonObject else {
            if self[key] == nil {
                return nil
            } else {
                let error = AJsonErrorValueNotObject(object: self, key: key, value: value!)
                throw error
            }
        }
        return object
    }

    func jsonArray(_ key: AJsonString) throws -> AJsonArray {
        let value = self[key]
        guard let array = value as? AJsonArray else {
            if self[key] == nil {
                let error = AJsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = AJsonErrorValueNotArray(object: self, key: key, value: value!)
                throw error
            }
        }
        return array
    }
    
    func optionalJsonArray(_ key: AJsonString) throws -> AJsonArray? {
        let value = self[key]
        guard let array = value as? AJsonArray else {
            if self[key] == nil {
                return nil
            } else {
                let error = AJsonErrorValueNotArray(object: self, key: key, value: value!)
                throw error
            }
        }
        return array
    }
    
    func jsonBoolean(_ key: AJsonString) throws -> Bool {
        let value = self[key]
        guard let boolean = value as? Bool else {
            if self[key] == nil {
                let error = AJsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = AJsonErrorValueNotBoolean(object: self, key: key, value: value!)
                throw error
            }
        }
        return boolean
    }
    
    func optionalJsonBoolean(_ key: AJsonString) throws -> Bool? {
        let value = self[key]
        guard let boolean = value as? Bool else {
            if self[key] == nil {
                return nil
            } else {
                let error = AJsonErrorValueNotBoolean(object: self, key: key, value: value!)
                throw error
            }
        }
        return boolean
    }
    
    func jsonNull(_ key: AJsonString) throws -> AJsonNull {
        let value = self[key]
        guard let null = value as? NSNull else {
            if self[key] == nil {
                let error = AJsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = AJsonErrorValueNotNull(object: self, key: key, value: value!)
                throw error
            }
        }
        return null
    }
    
    func optionalJsonNull(_ key: AJsonString) throws -> AJsonNull? {
        let value = self[key]
        guard let null = value as? NSNull else {
            if self[key] == nil {
                let error = AJsonErrorValueMissing(object: self, key: key)
                throw error
            } else {
                let error = AJsonErrorValueNotNull(object: self, key: key, value: value!)
                throw error
            }
        }
        return null
    }
    
}

// MARK: Array

public typealias JsonArrayStrings = [AJsonString]
public typealias JsonArrayNumbers = [AJsonNumber]
public typealias JsonArrayObjects = [AJsonObject]
public typealias JsonArrayArrays = [AJsonArray]
public typealias JsonArrayBooleans = [AJsonBoolean]

public extension AJsonArray {
    
    func jsonArrayStrings() throws -> JsonArrayStrings {
        guard let arrayStrings = self as? JsonArrayStrings else {
            let error = AJsonErrorNotArrayStrings(array: self)
            throw error
        }
        return arrayStrings
    }
    
    func jsonArrayNumbers() throws -> JsonArrayNumbers {
        guard let arrayNumbers = self as? JsonArrayNumbers else {
            let error = AJsonErrorNotArrayNumbers(array: self)
            throw error
        }
        return arrayNumbers
    }
    
    func jsonArrayObjects() throws -> JsonArrayObjects {
        guard let arrayObjects = self as? JsonArrayObjects else {
            let error = AJsonErrorNotArrayObjects(array: self)
            throw error
        }
        return arrayObjects
    }
    
    func jsonArrayArrays() throws -> JsonArrayArrays {
        guard let arrayArrays = self as? JsonArrayArrays else {
            let error = AJsonErrorNotArrayArrays(array: self)
            throw error
        }
        return arrayArrays
    }
    
    func jsonArrayBooleans() throws -> JsonArrayBooleans {
        guard let arrayBooleans = self as? JsonArrayBooleans else {
            let error = AJsonErrorNotArrayBooleans(array: self)
            throw error
        }
        return arrayBooleans
    }
    
}
