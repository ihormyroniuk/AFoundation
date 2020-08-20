//
//  JsonParsingErrorObjectValueForKeyIsNotString.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct JsonErrorValueNotObject: JsonError {
    
    private let object: JsonObject
    private let key: String
    private let value: Any
    
    init(object: JsonObject, key: String, value: Any) {
        self.object = object
        self.key = key
        self.value = value
    }
    
}
