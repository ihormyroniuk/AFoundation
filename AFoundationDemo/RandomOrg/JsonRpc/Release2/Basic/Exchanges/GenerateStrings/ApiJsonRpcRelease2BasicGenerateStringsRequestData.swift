//
//  ApiJsonRpcRelease2BasicGenerateIntegerSequencesRequestData.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 09.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateStringsRequestData {
    
    let id: JsonValue
    let apiKey: String
    let n: UInt
    let lenght: UInt
    let characters: String
    let replacement: Bool?
    
    init(id: JsonValue, apiKey: String, n: UInt, lenght: UInt, characters: String, replacement: Bool) {
        self.id = id
        self.apiKey = apiKey
        self.n = n
        self.lenght = lenght
        self.characters = characters
        self.replacement = replacement
    }
    
}
}

