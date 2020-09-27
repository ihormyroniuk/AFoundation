//
//  URLRequest.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 19.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public class URLRequestInitializer {
    
    // MARK: Initializers
    
    private init() {
        
    }
    
    public class func initWithHttpRequest(_ httpRequest: HttpRequest) -> URLRequest {
        var urlRequest = URLRequest(url: httpRequest.requestUri)
        urlRequest.allHTTPHeaderFields = httpRequest.headerFields
        urlRequest.httpBody = httpRequest.messageBody
        return urlRequest
    }
    
}
