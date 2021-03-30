//
//  HttpExchange.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 07.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

open class HttpExchange<ParsedResponse>: CustomDebugStringConvertible {
    
    open func constructRequest() throws -> HttpRequest {
        fatalError()
    }
    
    open func parseResponse(_ response: HttpResponse) throws -> ParsedResponse {
        fatalError()
    }
    
    public var debugDescription: String {
        return ""
    }
}
public struct HttpExchangeCannotConstructRequest: Error, CustomDebugStringConvertible {
    private let fileId: StaticString
    private let line: UInt
    private let exchange: Any
    private let error: Error
    
    public init(fileId: StaticString = #fileID, line: UInt = #line, exchange: Any, error: Error) {
        self.fileId = fileId
        self.line = line
        self.exchange = exchange
        self.error = error
    }
    
    public var debugDescription: String {
        return "\(fileId):\(String(reflecting: line))\n\(String(reflecting: exchange)) cannot construct request\n\(String(reflecting: error))"
    }
}
public struct HttpExchangeCannotParseResponse: Error, CustomDebugStringConvertible {
    private let fileId: StaticString
    private let line: UInt
    private let exchange: Any
    private let response: HttpResponse
    private let error: Error
    
    public init(fileId: StaticString = #fileID, line: UInt = #line, exchange: Any, response: HttpResponse, error: Error) {
        self.fileId = fileId
        self.line = line
        self.exchange = exchange
        self.response = response
        self.error = error
    }
    
    public var debugDescription: String {
        return "\(fileId):\(String(reflecting: line))\n\(String(reflecting: exchange)) cannot parse response \n\(String(reflecting: response))\n\(String(reflecting: error))"
    }
}
public struct UnexpectedHttpResponseCodeError: Error, CustomStringConvertible {

    public let code: Int
    
    public init(code: Int) {
        self.code = code
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        return ""
    }
    
}

open class RequestDataHttpExchange<RequestData, ParsedResponse>: HttpExchange<ParsedResponse> {
    
    public let requestData: RequestData
    
    public init(requestData: RequestData) {
        self.requestData = requestData
    }
    
    public override var debugDescription: String {
        return "\(String(reflecting: Self.self))(requestData: \(String(reflecting: requestData)))"
    }
}

open class SchemeHostHttpExchange<RequestData, ParsedResponse>: RequestDataHttpExchange<RequestData, ParsedResponse> {
    
    public let scheme: String
    public let host: String
    
    public init(scheme: String, host: String, requestData: RequestData) {
        self.scheme = scheme
        self.host = host
        super.init(requestData: requestData)
    }
    
    public override var debugDescription: String {
        return "\(String(reflecting: Self.self))(requestData: \(String(reflecting: requestData)), scheme: \(String(reflecting: scheme)), scheme: \(String(reflecting: host)))"
    }
}
