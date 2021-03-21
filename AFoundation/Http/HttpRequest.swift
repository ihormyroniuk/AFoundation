//
//  HttpRequest.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 07.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://tools.ietf.org/html/rfc2616#section-5
 */
public struct HttpRequest: CustomDebugStringConvertible, Equatable {
    
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
    
    public var debugDescription: String {
        var description = "\(method) \(uri) \(version)\n"
        headers?.forEach({ description += "\($0):\($1)\n" })
        if let body = body, !body.isEmpty {
            description += "\n"
            body.forEach({ description += String(repeating: "0", count: $0.leadingZeroBitCount) + String($0, radix: 2) })
        }
        return description
    }
    
}
