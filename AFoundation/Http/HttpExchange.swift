//
//  HttpExchange.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 07.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

extension Http {
open class Exchange<ParsedResponse> {
    
    open func constructHttpRequest() throws -> Http.Request {
        fatalError()
    }
    
    open func parseHttpResponse(httpResponse: Http.Response) throws -> ParsedResponse {
        fatalError()
    }
    
}

open class RequestDataExchange<RequestData, ParsedResponse>: Http.Exchange<ParsedResponse> {
    
    public let requestData: RequestData
    
    public init(requestData: RequestData) {
        self.requestData = requestData
    }
    
}

open class SchemeHostExchange<RequestData, ParsedResponse>: Http.RequestDataExchange<RequestData, ParsedResponse> {
    
    public let scheme: String
    public let host: String
    
    public init(scheme: String, host: String, requestData: RequestData) {
        self.scheme = scheme
        self.host = host
        super.init(requestData: requestData)
    }
    
}
}
