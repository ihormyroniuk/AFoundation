//
//  JsonArrayBooleans.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 09.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonArrayBooleans = [JsonBoolean]

public extension JsonArray {
    
    func arrayBooleans() throws -> JsonArrayBooleans {
        guard let arrayBooleans = self as? JsonArrayBooleans else {
            let error = JsonErrorNotArrayBooleans(array: self)
            throw error
        }
        return arrayBooleans
    }
    
}

public struct JsonErrorNotArrayBooleans: LocalizedError {
    
    private let array: JsonArray
    
    init(array: JsonArray) {
        self.array = array
    }
    
}
