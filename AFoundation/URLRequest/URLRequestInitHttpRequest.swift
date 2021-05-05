//
//  URLRequest.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 19.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension URLRequest {
    
    init(_ httpRequest: HttpRequest) {
        let uri = httpRequest.uri
        self.init(url: uri)
        httpMethod = httpRequest.method
        allHTTPHeaderFields = httpRequest.headers
        httpBody = httpRequest.body
    }
    
}
