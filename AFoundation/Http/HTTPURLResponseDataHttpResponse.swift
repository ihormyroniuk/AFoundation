//
//  PlainHttpResponse.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 20.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct HTTPURLResponseDataHttpResponse: HttpResponse {
    
    public let httpVersion: String
    public let statusCode: Int
    public let reasonPhrase: String
    public let headerFields: [String: String]?
    public let messageBody: Data?
    
    public init(httpUrlResponse: HTTPURLResponse, data: Data?) {
        httpVersion = "HTTP/1.1"
        statusCode = httpUrlResponse.statusCode
        reasonPhrase = HTTPURLResponse.localizedString(forStatusCode: httpUrlResponse.statusCode)
        headerFields = httpUrlResponse.allHeaderFields as? [String: String]
        messageBody = data
    }
    
}
