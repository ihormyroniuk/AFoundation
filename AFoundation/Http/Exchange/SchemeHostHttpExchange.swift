//
//  SchemeHostHttpExchange.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 04.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

open class SchemeHostHttpExchange<HttpRequestData, ParsedHttpResponse>: HttpExchange {
    
    public let scheme: String
    public let host: String
    
    public init(scheme: String, host: String) {
        self.scheme = scheme
        self.host = host
    }
    
    public typealias HttpRequestData = HttpRequestData
    open func constructHttpRequest(data: HttpRequestData) throws -> HttpRequest {
        let error = UnexpectedError()
        throw error
    }
    
    public typealias ParsedHttpResponse = ParsedHttpResponse
    open func parseHttpResponse(httpResponse: HttpResponse) throws -> ParsedHttpResponse {
        let error = UnexpectedError()
        throw error
    }
    
}
