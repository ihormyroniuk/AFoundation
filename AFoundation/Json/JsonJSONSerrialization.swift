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
        let json = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
        if let object = json as? JsonObject {
            return object
        }
        if let array = json as? JsonArray {
            return array
        }
        if let string = json as? JsonString {
            return string
        }
        if let boolean = json as? JsonBoolean {
            return boolean
        }
        if let number = (json as? NSNumber)?.decimalValue {
            return number
        }
        if let null = json as? JsonNull {
            return null
        }
        let error = UnexpectedError()
        throw error
    }
    
    class func data(jsonValue: JsonValue) throws -> Data {
        let data = try JSONSerialization.data(withJSONObject: jsonValue, options: [.fragmentsAllowed])
        return data
    }
    
}
