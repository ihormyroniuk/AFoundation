//
//  PlainHttpResponse.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 20.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct HTTPURLResponseDataHttpResponse: HttpResponse {

    public let version: String
    public let code: Int
    public let phrase: String
    public let headers: [String: String]?
    public let body: [UInt8]?
    
    public init(httpUrlResponse: HTTPURLResponse, data: Data?) {
        version = ""
        code = httpUrlResponse.statusCode
        phrase = ""
        headers = httpUrlResponse.allHeaderFields as? [String: String]
        if let data = data { body = Array(data) } else { body = nil }
    }
    
}
