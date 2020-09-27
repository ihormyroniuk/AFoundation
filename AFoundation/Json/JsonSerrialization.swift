//
//  JsonObjectSerrialization.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public enum JsonSerialization {
    
    public static func jsonObject(_ data: Data) throws -> JsonObject {
        let json = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
        guard let object = json as? JsonObject else {
            let error = JsonSerializationErrorNotObject(json: json)
            throw error
        }
        return object
    }
    
    public static func jsonArray(_ data: Data) throws -> JsonArray {
        let json = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
        guard let array = json as? JsonArray else {
            let error = JsonSerializationErrorNotArray(json: json)
            throw error
        }
        return array
    }
    
    public static func jsonArrayObjects(_ data: Data) throws -> JsonArrayObjects {
        let json = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
        guard let array = json as? JsonArrayObjects else {
            let error = JsonSerializationErrorNotArrayObjects(json: json)
            throw error
        }
        return array
    }
    
    public static func data(_ jsonValue: JsonValue) throws -> Data? {
        let data = try JSONSerialization.data(withJSONObject: jsonObject, options: [.fragmentsAllowed])
        return data
    }
    
}
