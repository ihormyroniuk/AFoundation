//
//  HttpExchange.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 07.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

open class HttpExchange<ParsedResponse> {
    
    open func constructRequest() throws -> HttpRequest {
        fatalError()
    }
    
    open func parseResponse(_ response: HttpResponse) throws -> ParsedResponse {
        fatalError()
    }
}

public struct UnexpectedHttpExchangeError: Error {
    
    public let httpRequest: HttpRequest
    public let httpResponse: HttpResponse
    public let error: Error
    
    public init(httpRequest: HttpRequest, httpResponse: HttpResponse, error: Error) {
        self.httpRequest = httpRequest
        self.httpResponse = httpResponse
        self.error = error
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
    
}

open class SchemeHostHttpExchange<RequestData, ParsedResponse>: RequestDataHttpExchange<RequestData, ParsedResponse> {
    
    public let scheme: String
    public let host: String
    
    public init(scheme: String, host: String, requestData: RequestData) {
        self.scheme = scheme
        self.host = host
        super.init(requestData: requestData)
    }
    
}
