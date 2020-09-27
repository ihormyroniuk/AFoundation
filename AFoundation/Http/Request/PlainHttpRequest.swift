//
//  PlainHttpRequest.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 20.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct PlainHttpRequest: HttpRequest {
    
    public let method: String
    public let requestUri: URL
    public let httpVersion: String
    public let headerFields: [String: String]?
    public let messageBody: Data?
    
    public init(method: String, requestUri: URL, httpVersion: String, headerFields: [String: String]? = nil, messageBody: Data? = nil) {
        self.method = method
        self.requestUri = requestUri
        self.httpVersion = httpVersion
        self.headerFields = headerFields
        self.messageBody = messageBody
    }
    
}
