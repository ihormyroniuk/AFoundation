//
//  JsonParsingErrorJsonIsNotObjectsArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 31.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct JsonSerializationErrorNotArrayObjects: LocalizedError {
    
    private let json: Any
    
    init(json: Any) {
        self.json = json
    }
    
}
