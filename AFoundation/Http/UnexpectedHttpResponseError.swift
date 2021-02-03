//
//  UnexpectedHttpResponse.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct UnexpectedHttpExchangeError: Error {
    
    public let httpRequest: Http.Request
    public let httpResponse: Http.Response
    public let error: Error
    
    public init(httpRequest: Http.Request, httpResponse: Http.Response, error: Error) {
        self.httpRequest = httpRequest
        self.httpResponse = httpResponse
        self.error = error
    }
    
}
