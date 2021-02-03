//
//  HTTPURLResponseHttpResponse.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 31.01.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension HTTPURLResponse {
    
    func httpResponse(data: Data?) -> Http.Response {
        let version = ""
        let code = statusCode
        let phrase = ""
        let headers = allHeaderFields as? [String: String]
        let body = data
        let httpResponse = Http.Response(version: version, code: code, phrase: phrase, headers: headers, body: body)
        return httpResponse
    }
    
}
