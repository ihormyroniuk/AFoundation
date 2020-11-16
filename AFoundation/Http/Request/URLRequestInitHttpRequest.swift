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
        let url = URL(string: httpRequest.uri)!
        self.init(url: url)
        httpMethod = httpRequest.method
        allHTTPHeaderFields = httpRequest.headers
        if let body = httpRequest.body { httpBody = Data(body) }
    }
    
}
