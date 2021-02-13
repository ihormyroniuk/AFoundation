//
//  ApiRelease2RequestObject.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 05.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateIntegersRequestData {
    
    let id: JsonValue
    let apiKey: String
    let n: UInt
    let min: Int
    let max: Int
    let replacement: Bool?
    
    init(id: JsonValue, apiKey: String, n: UInt, min: Int, max: Int, replacement: Bool) {
        self.id = id
        self.apiKey = apiKey
        self.n = n
        self.min = min
        self.max = max
        self.replacement = replacement
    }
    
}
}
