//
//  HTTPURLRequestInitHttpRequest.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 20.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension URLRequest {
    
    init(httpRequest: HttpRequest) {
        self.init(url: httpRequest.requestUri)
        allHTTPHeaderFields = httpRequest.headerFields
        httpBody = httpRequest.messageBody
    }
    
}
