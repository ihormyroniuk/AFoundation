//
//  URLRequest.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 19.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension URLRequest {
    
    init(httpRequest: HttpRequest) {
        self.init(url: httpRequest.uri)
        httpMethod = httpRequest.method
        allHTTPHeaderFields = httpRequest.headers
        httpBody = httpRequest.body
    }
    
}
