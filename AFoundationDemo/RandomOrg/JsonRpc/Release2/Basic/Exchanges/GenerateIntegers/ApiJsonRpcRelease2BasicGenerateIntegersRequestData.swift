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
    
    let id: JsonAnyValue
    let apiKey: String
    let n: UInt
    let min: Int
    let max: Int
    let replacement: Bool?
    enum Base {
        case binary
        case octal
        case decimal
        case hexadecimal
    }
    let base: Base?
    
    init(id: JsonAnyValue, apiKey: String, n: UInt, min: Int, max: Int, replacement: Bool?, base: Base?) {
        self.id = id
        self.apiKey = apiKey
        self.n = n
        self.min = min
        self.max = max
        self.replacement = replacement
        self.base = base
    }
    
    init(id: Int, apiKey: String, n: UInt, min: Int, max: Int, replacement: Bool?, base: Base?) {
        self.id = .number(1)
        self.apiKey = apiKey
        self.n = n
        self.min = min
        self.max = max
        self.replacement = replacement
        self.base = base
    }
    
}
}
