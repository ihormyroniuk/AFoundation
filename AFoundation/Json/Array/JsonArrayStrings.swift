//
//  JsonArrayStrings.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 09.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonArrayStrings = [JsonString]

public extension JsonArray {
    
    func arrayStrings() throws -> JsonArrayStrings {
        guard let arrayStrings = self as? JsonArrayStrings else {
            let error = JsonErrorNotArrayStrings(array: self)
            throw error
        }
        return arrayStrings
    }

}

public struct JsonErrorNotArrayStrings: LocalizedError {
    
    private let array: JsonArray
    
    init(array: JsonArray) {
        self.array = array
    }
    
}
