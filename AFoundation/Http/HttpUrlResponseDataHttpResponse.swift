//
//  PlainHttpResponse.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 20.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

struct HttpUrlResponseDataHttpResponse: HttpResponse {
    let httpVersion: String
    let statusCode: Int
    let reasonPhrase: String
    let headerFields: [String: String]?
    let messageBody: Data?
    
    init(httpUrlResponse: HTTPURLResponse, data: Data?) throws {
        httpVersion = ""
        statusCode = httpUrlResponse.statusCode
        reasonPhrase = ""
        headerFields = httpUrlResponse.allHeaderFields as? [String: String]
        messageBody = data
    }
}
