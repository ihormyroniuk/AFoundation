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
