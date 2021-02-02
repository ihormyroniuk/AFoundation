//
//  JsonObjectSerrialization.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JSONSerialization {
    
    class func json(data: Data) throws -> JsonValue {
        let json: Any
        do { json  = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed]) } catch {
            let error = DataIsNotJsonError(data: data)
            throw error
        }
        if let object = json as? JsonObject {
            return object
        } else if let array = json as? JsonArray {
            return array
        } else if let string = json as? JsonString {
            return string
        } else if let boolean = json as? JsonBoolean {
            return boolean
        } else if let number = (json as? NSNumber)?.decimalValue {
            return number
        } else if let null = json as? JsonNull {
            return null
        } else {
            let error = DataIsNotJsonError(data: data)
            throw error
        }
    }
    
    class func data(jsonValue: JsonValue) throws -> Data {
        let data = try JSONSerialization.data(withJSONObject: jsonValue, options: [.fragmentsAllowed])
        return data
    }
    
}

public struct DataIsNotJsonError: LocalizedError {
    
    private let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
}
