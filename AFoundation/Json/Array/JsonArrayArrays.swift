//
//  JsonArrayArrays.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 09.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias JsonArrayArrays = [JsonArray]

public extension JsonArray {
    
    func arrayArrays() throws -> JsonArrayArrays {
        guard let arrayArrays = self as? JsonArrayArrays else {
            let error = JsonErrorNotArrayArrays(array: self)
            throw error
        }
        return arrayArrays
    }

}

public struct JsonErrorNotArrayArrays: LocalizedError {
    
    private let array: JsonArray
    
    init(array: JsonArray) {
        self.array = array
    }
    
}
