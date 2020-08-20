//
//  JsonArraySerrialization.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JSONSerialization {
    
    class func jsonArray(with data: Data, options opt: JSONSerialization.ReadingOptions = []) throws -> JsonArray {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let array = json as? JsonArray else {
            let error = JsonSerializationErrorDataIsNotJsonArray(json: json)
            throw error
        }
        return array
    }
    
    class func objectsArray(with data: Data, options opt: JSONSerialization.ReadingOptions = []) throws -> JsonArrayObjects {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let array = json as? JsonArrayObjects else {
            let error = JsonParsingErrorJsonIsNotObjectsArray(json: json)
            throw error
        }
        return array
    }
    
}

public struct JsonParsingErrorJsonIsNotObjectsArray: Error {
    
    private let json: Any
    
    init(json: Any) {
        self.json = json
    }
    
}
