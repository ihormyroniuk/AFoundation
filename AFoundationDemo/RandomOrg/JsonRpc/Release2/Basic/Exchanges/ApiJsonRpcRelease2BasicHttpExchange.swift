//
//  ApiRelease2HttpExchange.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 06.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import AFoundation

extension Api.JsonRpc.Release2.Basic {
class HttpExchange<RequestData, ParsedResponse>: Http.RequestDataExchange<RequestData, ParsedResponse> {
    
    let scheme = Api.JsonRpc.Release2.scheme
    let host = "api.random.org"
    let path = "/json-rpc/2/invoke"
    
    func constructUri() throws -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        let uri = try urlComponents.constructUrl()
        return uri
    }
    
    var headers: [String: String] = [Http.HeaderField.contentType: MediaType.Application.Json.template]
    
    func constructRequestObject(method: JsonString, params: JsonObject, id: JsonValueContainer) -> JsonObject {
        var jsonObject = JsonObject()
        jsonObject.setString("2.0", for: "jsonrpc")
        jsonObject.setString(method, for: "method")
        jsonObject.setObject(params, for: "params")
        jsonObject["id"] = id
        return jsonObject
    }
}
}
