//
//  ApiRelease2HttpExchangeGenerateIntegers.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 06.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import AFoundation

extension Api.JsonRpc.Release2.Basic {
class GenerateIntegersHttpExchange: HttpExchange<GenerateIntegersRequestData, GenerateIntegersParsedResponse> {
    
    override func constructRequest() throws -> HttpRequest {
        let method = HttpRequestMethod.post
        let uri = try constructUri()
        let version = HttpVersion.http1dot1
        let headers = self.headers
        var params = JsonObject()
        params.setString(requestData.apiKey, for: "apiKey")
        params.setNumber(Decimal(requestData.n), for: "n")
        params.setNumber(Decimal(integerLiteral: requestData.min), for: "min")
        params.setNumber(Decimal(integerLiteral: requestData.max), for: "max")
        params.setMissableBoolean(requestData.replacement, for: "replacement")
        let base: Decimal?
        switch requestData.base {
        case .none: base = nil
        case .some(.binary): base = 2
        case .some(.octal): base = 8
        case .some(.decimal): base = 10
        case .some(.hexadecimal): base = 16
        }
        params.setMissableNumber(base, for: "base")
        let id = requestData.id
        let requestObject = constructRequestObject(method: "generateIntegers", params: params, id: id)
        let body = try JsonSerialization.data(requestObject)
        let request = HttpRequest(method: method, uri: uri, version: version, headers: headers, body: body)
        return request
    }
    
    override func parseResponse(_ httpResponse: HttpResponse) throws -> GenerateIntegersParsedResponse {
        let code = httpResponse.code
        guard code == HttpResponseCode.ok else {
            let error = UnexpectedHttpResponseCodeError(code: code)
            throw error
        }
        let body = httpResponse.body ?? Data()
        let jsonValue = try JsonSerialization.jsonValue(body)
        let response = try jsonValue.object()
        
        let resultJsonObject = try response.object("result")
        let random = try resultJsonObject.object("random")
        let data: GenerateIntegersParsedResponse.Data
        switch requestData.base {
        case .none:
            let integers = try random.array("data").numbers().map({ try $0.int() })
            data = .decimal(integers)
        case .some(.binary):
            let strings = try random.array("data").strings()
            data = .binary(strings)
        case .some(.octal):
            let strings = try random.array("data").strings()
            data = .octal(strings)
        case .some(.decimal):
            let integers = try random.array("data").numbers().map({ try $0.int() })
            data = .decimal(integers)
        case .some(.hexadecimal):
            let strings = try random.array("data").strings()
            data = .hexadecimal(strings)
        }
        let completionTimeString = try random.string("completionTime")
        let iso8601DateFormatter = ISO8601DateFormatter()
        iso8601DateFormatter.formatOptions = [.withSpaceBetweenDateAndTime]
        let completionTime = iso8601DateFormatter.date(from: completionTimeString)!
        let id = try response.value("id")
        let bitsUsed = try resultJsonObject.number("bitsUsed").uint()
        let bitsLeft = try resultJsonObject.number("bitsLeft").uint()
        let requestsLeft = try resultJsonObject.number("requestsLeft").uint()
        let advisoryDelay = try resultJsonObject.number("advisoryDelay").uint()
        
        let parsedResponse = GenerateIntegersParsedResponse(id: id, data: data, completionTime: completionTime, bitsUsed: bitsUsed, bitsLeft: bitsLeft, requestsLeft: requestsLeft, advisoryDelay: advisoryDelay)
        
        return parsedResponse
    }

}
}
