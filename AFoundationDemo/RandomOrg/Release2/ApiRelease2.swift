//
//  ApiRelease2.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 05.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

extension Api {
class Release2: Api {
    
    func generateIntegers(requestData: GenerateIntegersRequestData) -> GenerateIntegersHttpExchange {
        let httpExchange = GenerateIntegersHttpExchange(requestData: requestData)
        return httpExchange
    }
    
}
}
