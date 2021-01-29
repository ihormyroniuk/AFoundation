//
//  PlainHttpResponse.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 20.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://tools.ietf.org/html/rfc2616#section-6
 */
public struct HttpResponse: CustomStringConvertible {

    public let version: String
    public let code: Int
    public let phrase: String
    public let headers: [String: String]?
    public let body: Data?
    
    public init(version: String, code: Int, phrase: String, headers: [String: String]?, body: Data?) {
        self.version = version
        self.code = code
        self.phrase = phrase
        self.headers = headers
        self.body = body
    }
    
    public init(httpUrlResponse: HTTPURLResponse, data: Data?) {
        let version = ""
        let code = httpUrlResponse.statusCode
        let phrase = ""
        let headers = httpUrlResponse.allHeaderFields as? [String: String]
        let body = data
        self.init(version: version, code: code, phrase: phrase, headers: headers, body: body)
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        var description = "\(version) \(code) \(phrase)\n"
        headers?.forEach({ description += "\($0):\($1)\n" })
        if let body = body, !body.isEmpty {
            description += "\n"
            body.forEach({ description += String(repeating: "0", count: $0.leadingZeroBitCount) + String($0, radix: 2) })
        }
        return description
    }
    
}
