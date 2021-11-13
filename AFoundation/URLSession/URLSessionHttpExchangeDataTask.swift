//
//  jjj.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 03.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension URLSession {
    
    enum HttpExchangeDataTaskResponse<ParsedResponse> {
        case parsedResponse(ParsedResponse)
        case notConnectedToInternet(Swift.Error)
        case networkConnectionLost(Swift.Error)
    }
    func httpExchangeDataTask<ParsedResponse>(_ httpExchange: HttpExchange<ParsedResponse>, completionHandler: @escaping (Result<HttpExchangeDataTaskResponse<ParsedResponse>, Swift.Error>) -> ()) throws -> URLSessionDataTask {
        let httpRequest: HttpRequest
        do { httpRequest = try httpExchange.constructRequest() } catch {
            throw Error("Cannot not get \(String(reflecting: URLSessionDataTask.self)) for \(String(reflecting: httpExchange))\n\(error)")
        }
        let urlRequest = URLRequest(httpRequest)
        let dataTask = self.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let error = error {
                let nsError = error as NSError
                if nsError.code == NSURLErrorNotConnectedToInternet {
                    completionHandler(.success(.notConnectedToInternet(error)))
                } else if nsError.code == NSURLErrorNetworkConnectionLost {
                    completionHandler(.success(.networkConnectionLost(error)))
                } else {
                    completionHandler(.failure(error))
                }
            } else if let urlResponse = urlResponse {
                if let httpUrlResponse = urlResponse as? HTTPURLResponse {
                    let httpResponse = httpUrlResponse.httpResponse(data)
                    let parsedResponse: ParsedResponse
                    do { parsedResponse = try httpExchange.parseResponse(httpResponse) } catch {
                        completionHandler(.failure(Error("Cannot parse \(httpResponse) for \(httpRequest) \n\(String(reflecting: error))")))
                        return
                    }
                    completionHandler(.success(.parsedResponse(parsedResponse)))
                } else {
                    let error = Error("Unexpected \(String(reflecting: urlResponse)) for \(String(reflecting: urlRequest))")
                    completionHandler(.failure(error))
                }
            } else {
                let error = Error("Unexpected \(String(reflecting: URLSessionDataTask.self)) completionHandler call for \(String(reflecting: urlRequest))")
                completionHandler(.failure(error))
            }
        }
        return dataTask
    }
    
}
