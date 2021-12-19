//
//  ApiJsonRpcRelease2BasicGenerateStringsHttpExchange.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 06.12.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import AFoundation

extension Api.JsonRpc.Release2.Basic {
class GenerateGaussiansHttpExchange: HttpExchange<GenerateGaussiansRequestData, GenerateGaussiansParsedResponse> {
    
    override func constructRequest() throws -> HttpRequest {
        let method = HttpRequestMethod.post
        let uri = try constructUri()
        let version = HttpVersion.http1dot1
        let headers = self.headers
        var params = JsonObject()
        params.setString(requestData.apiKey, for: "apiKey")
        params.setNumber(Decimal(requestData.n), for: "n")
        params.setNumber(requestData.mean, for: "mean")
        params.setNumber(requestData.standardDeviation, for: "standardDeviation")
        params.setNumber(Decimal(requestData.significantDigits), for: "significantDigits")
        let id = requestData.id
        let requestObject = constructRequestObject(method: "generateGaussians", params: params, id: id)
        let body = try JsonSerialization.data(requestObject)
        let request = HttpRequest(method: method, uri: uri, version: version, headers: headers, body: body)
        return request
    }
    
    override func parseResponse(_ httpResponse: HttpResponse) throws -> GenerateGaussiansParsedResponse {
        let code = httpResponse.code
        guard code == HttpResponseCode.ok else {
            let error = Error("Unexpected code \(code)")
            throw error
        }
        let body = httpResponse.body ?? Data()
        let jsonValue = try JsonSerialization.jsonValue(body)
        let response = try jsonValue.object()
        let resultJsonObject = try response.object("result")
        let random = try resultJsonObject.object("random")
        let data: [Decimal] = try random.array("data").numbers()
        let completionTimeString = try random.string("completionTime")
        let iso8601DateFormatter = ISO8601DateFormatter()
        iso8601DateFormatter.formatOptions = [.withSpaceBetweenDateAndTime]
        let completionTime = iso8601DateFormatter.date(from: completionTimeString)!
        let id = try response.value("id")
        let bitsUsed = try resultJsonObject.number("bitsUsed").uint()
        let bitsLeft = try resultJsonObject.number("bitsLeft").uint()
        let requestsLeft = try resultJsonObject.number("requestsLeft").uint()
        let advisoryDelay = try resultJsonObject.number("advisoryDelay").uint()
        let parsedResponse = GenerateGaussiansParsedResponse(id: id, data: data, completionTime: completionTime, bitsUsed: bitsUsed, bitsLeft: bitsLeft, requestsLeft: requestsLeft, advisoryDelay: advisoryDelay)
        return parsedResponse
    }
    
}
}
