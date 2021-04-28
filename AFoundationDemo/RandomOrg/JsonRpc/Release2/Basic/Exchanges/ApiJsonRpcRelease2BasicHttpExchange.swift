//
//  ApiRelease2HttpExchange.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 06.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import AFoundation

extension Api.JsonRpc.Release2.Basic {
class HttpExchange<RequestData, ParsedResponse>: RequestDataHttpExchange<RequestData, ParsedResponse> {
    
    let scheme = Api.JsonRpc.Release2.scheme
    let host = "api.random.org"
    let path = "/json-rpc/2/invoke"
    
    func constructUri() throws -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        let uri = try urlComponents.url()
        return uri
    }
    
    var headers: [String: String] = [HttpHeaderField.contentType: MediaType.json]
    
    func constructRequestObject(method: String, params: JsonObject, id: JsonValue) -> JsonObject {
        var jsonObject = JsonObject()
        jsonObject.setString("2.0", for: "jsonrpc")
        jsonObject.setString(method, for: "method")
        jsonObject.setObject(params, for: "params")
        jsonObject["id"] = id
        return jsonObject
    }
}
}
