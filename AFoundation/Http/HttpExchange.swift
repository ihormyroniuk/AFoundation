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
        throw Error("\(#function) is not implemented")
    }
    
    open func parseResponse(_ response: HttpResponse) throws -> ParsedResponse {
        throw Error("\(#function) is not implemented")
    }
    
    // MARK: CustomDebugStringConvertible
    
    public var debugDescription: String {
        return "\(String(reflecting: Self.self))()"
    }
}

open class SchemeHostHttpExchange<ParsedResponse>: HttpExchange<ParsedResponse> {
    
    public let scheme: String
    public let host: String
    
    public init(scheme: String, host: String) {
        self.scheme = scheme
        self.host = host
    }
    
    // MARK: CustomDebugStringConvertible
    
    public override var debugDescription: String {
        let shemeDebugDescription = String(reflecting: scheme)
        let hostDebugDescription = String(reflecting: host)
        return "\(String(reflecting: Self.self))(scheme: \(shemeDebugDescription), host: \(hostDebugDescription))"
    }
}

open class RequestDataHttpExchange<RequestData, ParsedResponse>: HttpExchange<ParsedResponse> {
    
    public let requestData: RequestData
    
    public init(requestData: RequestData) {
        self.requestData = requestData
    }
    
    // MARK: CustomDebugStringConvertible
    
    public override var debugDescription: String {
        let requestDataDebugDescription = String(reflecting: requestData)
        return "\(String(reflecting: Self.self))(requestData: \(requestDataDebugDescription))"
    }
}

open class SchemeHostRequestDataHttpExchange<RequestData, ParsedResponse>: HttpExchange<ParsedResponse> {
    
    public let scheme: String
    public let host: String
    public let requestData: RequestData
    
    public init(scheme: String, host: String, requestData: RequestData) {
        self.scheme = scheme
        self.host = host
        self.requestData = requestData
    }
    
    // MARK: CustomDebugStringConvertible
    
    public override var debugDescription: String {
        let shemeDebugDescription = String(reflecting: scheme)
        let hostDebugDescription = String(reflecting: host)
        let requestDataDebugDescription = String(reflecting: requestData)
        return "\(String(reflecting: Self.self))(scheme: \(shemeDebugDescription), host: \(hostDebugDescription), requestData: \(requestDataDebugDescription))"
    }
}
