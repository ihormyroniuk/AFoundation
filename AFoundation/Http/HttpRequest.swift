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
        let methodDebugDescription = String(reflecting: method)
        let uriDebugDescription = "\(String(reflecting: URL.self))(\(String(reflecting: uri)))"
        let versionDebugDescription = String(reflecting: version)
        let headersDebugDescription: String
        if let headers = headers {
            headersDebugDescription = String(reflecting: headers)
        } else {
            headersDebugDescription = "nil"
        }
        let bodyDebugDescription: String
        if let body = body {
            bodyDebugDescription = String(reflecting: body.map { $0 })
        } else {
            bodyDebugDescription = "nil"
        }
        return "\(String(reflecting: Self.self))(method: \(methodDebugDescription), uri: \(uriDebugDescription), version: \(versionDebugDescription), headers: \(headersDebugDescription), body: \(bodyDebugDescription))"
    }
    
}
