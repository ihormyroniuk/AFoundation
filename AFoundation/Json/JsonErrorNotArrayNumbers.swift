//
//  JsonErrorValueNotArrayNumbers.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 19.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct JsonErrorNotArrayNumbers: JsonError {
    
    private let array: JsonArray
    
    init(array: JsonArray) {
        self.array = array
    }
    
}
