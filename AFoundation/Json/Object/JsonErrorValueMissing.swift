//
//  JsonErrorValueMissing.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 23.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct JsonErrorValueMissing: LocalizedError {
    
    let object: JsonObject
    let key: String
    
    init(object: JsonObject, key: String) {
        self.object = object
        self.key = key
    }
    
}

public struct JsonErrorValueMissing1: LocalizedError {
    
    let object: JsonObject1
    let key: JsonString1
    
    init(object: JsonObject1, key: JsonString1) {
        self.object = object
        self.key = key
    }
    
}
