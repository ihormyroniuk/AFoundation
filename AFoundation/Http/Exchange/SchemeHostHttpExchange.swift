//
//  SchemeHostHttpExchange.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 04.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

open class SchemeHostHttpExchange<ParsedHttpResponse>: HttpExchange {
    public typealias ParsedHttpResponse = ParsedHttpResponse
    
    public let scheme: String
    public let host: String
    
    public init(scheme: String, host: String) {
        self.scheme = scheme
        self.host = host
    }
    
    open func constructHttpRequest() throws -> HttpRequest {
        let error = UnexpectedError()
        throw error
    }
    
    open func parseHttpResponse(httpResponse: HttpResponse) throws -> ParsedHttpResponse {
        let error = UnexpectedError()
        throw error
    }
    
}
