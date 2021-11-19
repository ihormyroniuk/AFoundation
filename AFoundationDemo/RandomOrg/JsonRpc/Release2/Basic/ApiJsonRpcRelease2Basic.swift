//
//  ApiJsonRpcRelease2Basic.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 08.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

extension Api.JsonRpc.Release2 {
class Basic {
    
    func generateIntegers(requestData: GenerateIntegersRequestData) -> GenerateIntegersHttpExchange {
        let httpExchange = GenerateIntegersHttpExchange(requestData: requestData)
        return httpExchange
    }
    
    func generateStrings(requestData: GenerateStringsRequestData) -> GenerateStringsHttpExchange {
        let httpExchange = GenerateStringsHttpExchange(requestData: requestData)
        return httpExchange
    }
    
    func generateDecimalFractions(requestData: GenerateDecimalFractionsRequestData) -> GenerateDecimalFractionsHttpExchange {
        let httpExchange = GenerateDecimalFractionsHttpExchange(requestData: requestData)
        return httpExchange
    }
    
}
}
