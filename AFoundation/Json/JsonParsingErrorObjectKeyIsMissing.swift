//
//  Json.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct JsonParsingErrorObjectKeyIsMissing: JsonParsingError {
    
    let object: JsonObject
    let key: String
    
    init(object: JsonObject, key: String) {
        self.object = object
        self.key = key
    }
    
}
