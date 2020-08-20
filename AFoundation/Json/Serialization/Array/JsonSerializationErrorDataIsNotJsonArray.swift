//
//  JsonSerializationErrorDataIsNotJsonArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 17.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct JsonSerializationErrorDataIsNotJsonArray: Error {
    
    private let json: Any
    
    init(json: Any) {
        self.json = json
    }
    
}
