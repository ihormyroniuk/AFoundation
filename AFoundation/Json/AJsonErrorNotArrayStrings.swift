//
//  JsonArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct AJsonErrorNotArrayStrings: LocalizedError {
    
    private let array: AJsonArray
    
    init(array: AJsonArray) {
        self.array = array
    }
    
}
