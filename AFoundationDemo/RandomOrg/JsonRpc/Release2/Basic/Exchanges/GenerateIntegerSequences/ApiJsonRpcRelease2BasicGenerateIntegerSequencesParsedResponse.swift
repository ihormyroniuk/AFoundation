//
//  ApiJsonRpcRelease2BasicGenerateIntegerSequencesParsedResponse.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 17.11.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation
import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateIntegerSequencesParsedResponse {
    
    let id: JsonValue
    enum Data {
        case binary([String])
        case octal([String])
        case decimal([Int])
        case hexadecimal([String])
    }
    let data: Data
    let completionTime: Date
    let bitsUsed: UInt
    let bitsLeft: UInt
    let requestsLeft: UInt
    let advisoryDelay: UInt
    
}
}
