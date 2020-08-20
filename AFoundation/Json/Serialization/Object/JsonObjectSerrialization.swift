//
//  JsonObjectSerrialization.swift
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
            let error = JsonSerializationErrorJsonIsNotObject(json: json)
            throw error
        }
        return object
    }
    
}
