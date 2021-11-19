//
//  ApiJsonRpcRelease2BasicGenerateRequestData.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 18.11.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateUuidsRequestData {
    
    let id: JsonValue
    let apiKey: String
    let n: UInt
    
    init(id: JsonValue, apiKey: String, n: UInt) {
        self.id = id
        self.apiKey = apiKey
        self.n = n
    }
    
}
}
