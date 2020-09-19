//
//  JsonErrorNotArrayArrays.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 20.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct JsonErrorNotArrayArrays: LocalizedError {
    
    private let array: JsonArray
    
    init(array: JsonArray) {
        self.array = array
    }
    
}
