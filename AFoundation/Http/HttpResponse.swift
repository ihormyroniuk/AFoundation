//
//  HttpResponse.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 07.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://tools.ietf.org/html/rfc2616#section-6
 */
public struct HttpResponse: Equatable, CustomDebugStringConvertible {

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
    
    // MARK: CustomDebugStringConvertible
    
    public var debugDescription: String {
        let versionDebugDescription = String(reflecting: version)
        let codeDebugDescription = String(reflecting: code)
        let phraseDebugDescription = String(reflecting: phrase)
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
        return "\(String(reflecting: Self.self))(version: \(versionDebugDescription), code: \(codeDebugDescription), phrase: \(phraseDebugDescription), headers: \(headersDebugDescription), body: \(bodyDebugDescription))"
    }
    
}
