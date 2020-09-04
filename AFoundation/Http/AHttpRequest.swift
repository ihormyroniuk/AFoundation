//
//  HttpRequest.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 20.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol AHttpRequest {
    var method: String { get }
    var requestUri: URL { get }
    var httpVersion: String { get }
    var headerFields: [String: String]? { get }
    var messageBody: Data? { get }
}

extension AHttpRequest {
    
    func urlRequest() -> URLRequest {
        var urlRequest = URLRequest(url: requestUri)
        urlRequest.allHTTPHeaderFields = headerFields
        urlRequest.httpBody = messageBody
        return urlRequest
    }
    
}
