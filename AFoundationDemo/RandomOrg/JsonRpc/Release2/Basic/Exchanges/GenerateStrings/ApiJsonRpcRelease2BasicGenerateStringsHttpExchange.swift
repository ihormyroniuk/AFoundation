//
//  ApiJsonRpcRelease2BasicGenerateStringsHttpExchange.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 09.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import AFoundation

extension Api.JsonRpc.Release2.Basic {
class GenerateStringsHttpExchange: HttpExchange<GenerateStringsRequestData, GenerateStringsParsedResponse> {
    
    override func constructRequest() throws -> Http.Request {
        let method = Http.Request.Method.post
        let uri = try constructUri()
        let version = Http.Version.http1dot1
        let headers = self.headers
        var params = JsonObject()
        params["apiKey"] = requestData.apiKey
        params["n"] = JsonNumber(requestData.n)
        params["length"] = JsonNumber(requestData.lenght)
        params["characters"] = requestData.characters
        if let replacement = requestData.replacement { params["replacement"] = replacement }
        let id = requestData.id
        let requestObject = constructRequestObject(method: "generateStrings", params: params, id: id)
        let body = try JSONSerialization.data(jsonValue: requestObject)
        let request = Http.Request(method: method, uri: uri, version: version, headers: headers, body: body)
        return request
    }
    
    override func parseResponse(_ httpResponse: Http.Response) throws -> GenerateStringsParsedResponse {
        let code = httpResponse.code
        guard code == Http.Response.Code.ok else {
            let error = UnexpectedHttpResponseCodeError(code: code)
            throw error
        }
        let body = httpResponse.body ?? Data()
        let jsonValue = try JSONSerialization.json(data: body)
        let response = try jsonValue.object()
        
        let resultJsonObject = try response.object("result")
        let random = try resultJsonObject.object("random")
        let data = try random.array("data").arrayStrings()
        let completionTimeString = try random.string("completionTime")
        let iso8601DateFormatter = ISO8601DateFormatter()
        iso8601DateFormatter.formatOptions = [.withSpaceBetweenDateAndTime]
        let completionTime = iso8601DateFormatter.date(from: completionTimeString)!
        let id = try response.value("id")
        let bitsUsed = try resultJsonObject.number("bitsUsed").uint()
        let bitsLeft = try resultJsonObject.number("bitsLeft").uint()
        let requestsLeft = try resultJsonObject.number("requestsLeft").uint()
        let advisoryDelay = try resultJsonObject.number("advisoryDelay").uint()
        
        let parsedResponse = GenerateStringsParsedResponse(id: id, data: data, completionTime: completionTime, bitsUsed: bitsUsed, bitsLeft: bitsLeft, requestsLeft: requestsLeft, advisoryDelay: advisoryDelay)
        
        return parsedResponse
    }
    
}
}
