//
//  ApiJsonRpcRelease2BasicGenerateUuidsParsedResponse.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 18.11.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation
import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateUuidsParsedResponse {
    
    let id: JsonValue
    let data: [UUID]
    let completionTime: Date
    let bitsUsed: UInt
    let bitsLeft: UInt
    let requestsLeft: UInt
    let advisoryDelay: UInt
    
}
}
