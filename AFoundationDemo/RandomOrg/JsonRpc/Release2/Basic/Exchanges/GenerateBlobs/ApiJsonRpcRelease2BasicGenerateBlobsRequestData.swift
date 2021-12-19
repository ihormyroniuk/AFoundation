//
//  ApiJsonRpcRelease2BasicGenerateBlobsRequestData.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 06.12.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateBlobsRequestData {
    
    let id: JsonValue
    let apiKey: String
    let n: UInt
    let size: UInt
    enum Format {
        case base64
        case hex
    }
    let format: Format
    
    init(id: JsonValue, apiKey: String, n: UInt, size: UInt, format: Format) {
        self.id = id
        self.apiKey = apiKey
        self.n = n
        self.size = size
        self.format = format
    }
    
}
}
