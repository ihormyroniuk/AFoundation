//
//  UnexpectedHttpResponse.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct UnexpectedHttpResponse: Error {
    
    public let httpRequest: HttpRequest
    public let httpResponse: HttpResponse
    public let error: Error
    
    init(httpRequest: HttpRequest, httpResponse: HttpResponse, error: Error) {
        self.httpRequest = httpRequest
        self.httpResponse = httpResponse
        self.error = error
    }
    
}
