//
//  ApiJsonRpcRelease2BasicGenerateStringsRequestData.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 06.12.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation
import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateGaussiansRequestData {
    
    let id: JsonValue
    let apiKey: String
    let n: UInt
    let mean: Decimal
    let standardDeviation: Decimal
    let significantDigits: UInt
    
    init(id: JsonValue, apiKey: String, n: UInt, mean: Decimal, standardDeviation: Decimal, significantDigits: UInt) {
        self.id = id
        self.apiKey = apiKey
        self.n = n
        self.mean = mean
        self.standardDeviation = standardDeviation
        self.significantDigits = significantDigits
    }
    
}
}
