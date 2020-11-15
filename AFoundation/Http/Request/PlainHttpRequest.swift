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
    public let body: [UInt8]?
    
    public init(method: String, uri: URL, version: String, headers: [String: String]?, body: [UInt8]?) {
        self.method = method
        self.uri = uri
        self.version = version
        self.headers = headers
        self.body = body
    }
    
    public init(method: String, uri: URL, version: String, headers: [String: String]?, body: Data?) {
        let bodyArray: [UInt8]?
        if let body = body { bodyArray = Array(body) } else { bodyArray = nil }
        self.init(method: method, uri: uri, version: version, headers: headers, body: bodyArray)
    }
    
}
