//
//  HTTPURLResponseHttpResponse.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 31.01.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension HTTPURLResponse {
    
    func httpResponse(_ data: Data?) -> HttpResponse {
        let version = ""
        let code = statusCode
        let phrase = ""
        let headers = allHeaderFields as? [String: String]
        let body = data
        let httpResponse = HttpResponse(version: version, code: code, phrase: phrase, headers: headers, body: body)
        return httpResponse
    }
    
}
