//
//  HttpExchange.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 13.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol HttpExchange {
    
    associatedtype HttpRequestData
    func constructHttpRequest(data: HttpRequestData) throws -> HttpRequest
    
    associatedtype ParsedHttpResponse
    func parseHttpResponse(httpResponse: HttpResponse) throws -> ParsedHttpResponse
    
}
