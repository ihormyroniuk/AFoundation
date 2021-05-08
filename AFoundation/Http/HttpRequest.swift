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
public struct HttpRequest: Equatable, CustomDebugStringConvertible {
    
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
    
    // MARK: CustomDebugStringConvertible
    
    public var debugDescription: String {
        return "\(String(reflecting: Self.self))(method: \(String(reflecting: method)), uri: \(String(reflecting: uri)), version: \(String(reflecting: version)), headers: \(String(reflecting: headers)), body: \(String(reflecting: body?.map { String(format: "%02x", $0) }.joined())))"
    }
    
}
