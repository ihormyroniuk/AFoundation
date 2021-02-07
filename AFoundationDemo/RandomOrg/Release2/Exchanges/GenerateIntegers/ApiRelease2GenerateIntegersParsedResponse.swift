//
//  ApiRelease2GenerateIntegersParsedResponse.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 06.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

extension Api.Release2 {
struct GenerateIntegersParsedResponse {
    
    let id: UInt
    let data: [Int]
    let completionTime: Date
    let bitsUsed: UInt
    let bitsLeft: UInt
    let requestsLeft: UInt
    let advisoryDelay: UInt
    
}
}
