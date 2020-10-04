//
//  JsonObjectSerrialization.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JSONSerialization {
    
    static func object(_ data: Data) throws -> JsonObject {
        let json = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
        guard let object = json as? JsonObject else {
            let error = JsonSerializationErrorNotObject(json: json)
            throw error
        }
        return object
    }
    
    static func array(_ data: Data) throws -> JsonArray {
        let json = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
        guard let array = json as? JsonArray else {
            let error = JsonSerializationErrorNotArray(json: json)
            throw error
        }
        return array
    }
    
    static func data(_ jsonValue: JsonValue) throws -> Data {
        let data = try JSONSerialization.data(withJSONObject: jsonValue, options: [.fragmentsAllowed])
        return data
    }
    
}

public struct JsonSerializationErrorNotObject: LocalizedError {
    
    private let json: Any
    
    init(json: Any) {
        self.json = json
    }
    
}

public struct JsonSerializationErrorNotArray: LocalizedError {
    
    private let json: Any
    
    init(json: Any) {
        self.json = json
    }
    
}
