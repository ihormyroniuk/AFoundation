//
//  JsonArrayNumbers.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 09.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonArrayNumbers = [JsonNumber]

public extension JsonArray {
    
    func arrayNumbers() throws -> JsonArrayNumbers {
        guard let arrayNumbers = self as? [JsonNumber] else {
            let error = JsonErrorNotArrayNumbers(array: self)
            throw error
        }
        return arrayNumbers
    }

}

public struct JsonErrorNotArrayNumbers: LocalizedError {
    
    private let array: JsonArray
    
    init(array: JsonArray) {
        self.array = array
    }
    
}
