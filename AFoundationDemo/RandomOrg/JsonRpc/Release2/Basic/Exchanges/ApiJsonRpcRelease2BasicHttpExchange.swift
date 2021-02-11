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
    
    func constructRequestObject(method: JsonString, params: JsonObject, id: UInt) -> JsonObject {
        var jsonObject = JsonObject()
        jsonObject["jsonrpc"] = "2.0"
        jsonObject["method"] = method
        jsonObject["params"] = params
        jsonObject["id"] = JsonNumber(id)
        return jsonObject
    }
    
    func transformNumberBase(_ numberBase: NumberBase) -> UInt {
        switch numberBase {
        case .binary:
            return 2
        case .octal:
            return 8
        case .decimal:
            return 10
        case .hexadecimal:
            return 16
        }
    }
    
    func parseIntegers(dataArray: JsonArray, _ numberBase: NumberBase) throws -> [Int] {
        var data: [Int] = []
        switch numberBase {
        case .binary:
            let dataStringsArray = try dataArray.arrayStrings()
            for string in dataStringsArray {
                let number = Int(string, radix: 2) ?? 0
                data.append(number)
            }
        case .octal:
            let dataStringsArray = try dataArray.arrayStrings()
            for string in dataStringsArray {
                let number = Int(string, radix: 8) ?? 0
                data.append(number)
            }
        case .decimal:
            data = try dataArray.arrayNumbers().map({ try $0.int() })
        case .hexadecimal:
            let dataStringsArray = try dataArray.arrayStrings()
            for string in dataStringsArray {
                let number = Int(string, radix: 16) ?? 0
                data.append(number)
            }
        }
        return data
    }
}
}
