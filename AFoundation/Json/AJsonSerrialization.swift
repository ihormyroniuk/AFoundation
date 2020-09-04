//
//  JsonObjectSerrialization.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public enum AJsonSerialization {
    
    static func jsonObject(_ data: Data) throws -> AJsonObject {
        let json = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
        guard let object = json as? AJsonObject else {
            let error = AJsonSerializationErrorNotObject(json: json)
            throw error
        }
        return object
    }
    
    static func jsonArray(_ data: Data) throws -> AJsonArray {
        let json = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
        guard let array = json as? AJsonArray else {
            let error = AJsonSerializationErrorNotArray(json: json)
            throw error
        }
        return array
    }
    
    static func jsonArrayObjects(_ data: Data) throws -> JsonArrayObjects {
        let json = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
        guard let array = json as? JsonArrayObjects else {
            let error = AJsonSerializationErrorNotArrayObjects(json: json)
            throw error
        }
        return array
    }
    
    static func data(_ jsonValue: AJsonValue) throws -> Data? {
        let data = try JSONSerialization.data(withJSONObject: jsonObject, options: [.fragmentsAllowed])
        return data
    }
    
}
