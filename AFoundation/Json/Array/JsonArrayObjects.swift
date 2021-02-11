//
//  JsonArrayObjects.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 09.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonArrayObjects = [JsonObject]

public extension JsonArray {
    
    func arrayObjects() throws -> JsonArrayObjects {
        guard let arrayObjects = self as? JsonArrayObjects else {
            let error = JsonErrorNotArrayObjects(array: self)
            throw error
        }
        return arrayObjects
    }

}

public struct JsonErrorNotArrayObjects: LocalizedError {
    
    private let array: JsonArray
    
    init(array: JsonArray) {
        self.array = array
    }
    
}
