//
//  HttpExchange.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 13.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol HttpExchange {
    associatedtype ParsedHttpResponse
    
    func constructHttpRequest() throws -> HttpRequest
    func parseHttpResponse(httpResponse: HttpResponse) throws -> ParsedHttpResponse
}
