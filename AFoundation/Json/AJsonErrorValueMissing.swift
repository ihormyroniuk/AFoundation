//
//  Json.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct AJsonErrorValueMissing: LocalizedError {
    
    let object: AJsonObject
    let key: String
    
    init(object: AJsonObject, key: String) {
        self.object = object
        self.key = key
    }
    
}
