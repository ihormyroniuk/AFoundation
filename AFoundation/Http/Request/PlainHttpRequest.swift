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
    public let uri: URL
    public let version: String
    public let headers: [String: String]?
    public let body: Data?
    
    public init(method: String, uri: URL, version: String, headers: [String: String]?, body: Data?) {
        self.method = method
        self.uri = uri
        self.version = version
        self.headers = headers
        self.body = body
    }
    
}
