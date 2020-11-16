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
    public let uri: String
    public let version: String
    public let headers: [String: String]?
    public let body: [UInt8]?
    
    public init(method: String, uri: String, version: String, headers: [String: String]?, body: [UInt8]?) {
        self.method = method
        self.uri = uri
        self.version = version
        self.headers = headers
        self.body = body
    }
    
    public init(method: String, uri: String, version: String, headers: [String: String]?, bodyData: Data?) {
        let body: [UInt8]?
        if let bodyData = bodyData { body = Array(bodyData) } else { body = nil }
        self.init(method: method, uri: uri, version: version, headers: headers, body: body)
    }
    
    public init(method: String, uriURL: URL, version: String, headers: [String: String]?, body: [UInt8]?) {
        let uri = uriURL.absoluteString
        self.init(method: method, uri: uri, version: version, headers: headers, body: body)
    }
    
    public init(method: String, uriURL: URL, version: String, headers: [String: String]?, bodyData: Data?) {
        let uri = uriURL.absoluteString
        let body: [UInt8]?
        if let bodyData = bodyData { body = Array(bodyData) } else { body = nil }
        self.init(method: method, uri: uri, version: version, headers: headers, body: body)
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        var description = "\(method) \(uri) \(version)\n"
        headers?.forEach({ description += "\($0):\($1)\n" })
        description += "\n"
        body?.forEach({ description += String(repeating: "0", count: $0.leadingZeroBitCount) + String($0, radix: 2) })
        return description
    }
    
}
