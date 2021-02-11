//
//  ApiJsonRpcRelease2BasicGenerateStringsParsedResponse.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 09.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateStringsParsedResponse {
    
    let id: UInt
    let data: [String]
    let completionTime: Date
    let bitsUsed: UInt
    let bitsLeft: UInt
    let requestsLeft: UInt
    let advisoryDelay: UInt
    
}
}
