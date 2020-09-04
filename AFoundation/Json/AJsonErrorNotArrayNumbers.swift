//
//  JsonErrorValueNotArrayNumbers.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 19.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct AJsonErrorNotArrayNumbers: LocalizedError {
    
    private let array: AJsonArray
    
    init(array: AJsonArray) {
        self.array = array
    }
    
}
