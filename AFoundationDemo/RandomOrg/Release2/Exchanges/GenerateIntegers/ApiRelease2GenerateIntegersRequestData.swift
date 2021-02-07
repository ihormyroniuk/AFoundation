//
//  ApiRelease2RequestObject.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 05.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

extension Api.Release2 {
struct GenerateIntegersRequestData {
    
    let id: UInt
    let apiKey: String
    let n: UInt
    let min: Int
    let max: Int
    let replacement: Bool?
    let base: NumberBase?
    
    init(id: UInt, apiKey: String, n: UInt, min: Int, max: Int, replacement: Bool, base: NumberBase) {
        self.id = id
        self.apiKey = apiKey
        self.n = n
        self.min = min
        self.max = max
        self.replacement = replacement
        self.base = base
    }
    
}
}
