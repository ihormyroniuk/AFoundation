//
//  jjj.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 03.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension URLSession {
    
    enum DataTaskResponse {
        case urlResponseWithData(URLResponse, Data?)
        case notConnectedToInternet(Error)
    }
    func dataTask(with request: URLRequest, completionHandler: @escaping (Result<DataTaskResponse, Error>) -> Void) -> URLSessionDataTask {
        let dataTask = self.dataTask(with: request) { (data, urlResponse, error) in
            if let error = error {
                let nsError = error as NSError
                if nsError.code == NSURLErrorNotConnectedToInternet {
                    completionHandler(.success(.notConnectedToInternet(error)))
                } else {
                    completionHandler(.failure(error))
                }
            } else if let urlResponse = urlResponse {
                completionHandler(.success(.urlResponseWithData(urlResponse, data)))
            } else {
                let error = MessageError("")
                completionHandler(.failure(error))
            }
        }
        return dataTask
    }
    
    enum HttpDataTaskResponse {
        case httpUrlResponseWithData(HTTPURLResponse, Data?)
        case notConnectedToInternet(Error)
    }
    func httpDataTask(with request: URLRequest, completionHandler: @escaping (Result<HttpDataTaskResponse, Error>) -> Void) -> URLSessionDataTask {
        let dataTask = self.dataTask(with: request) { (result) in
            switch result {
            case let .success(response):
                switch response {
                case let .notConnectedToInternet(error):
                    completionHandler(.success(.notConnectedToInternet(error)))
                case let .urlResponseWithData(urlResponse, data):
                    if let httpUrlResponse = urlResponse as? HTTPURLResponse {
                        completionHandler(.success(.httpUrlResponseWithData(httpUrlResponse, data)))
                    } else {
                        completionHandler(.failure(MessageError("")))
                    }
                }
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
        return dataTask
    }
    
    enum HttpExchangeDataTaskResponse<ParsedResponse> {
        case parsedResponse(ParsedResponse)
        case notConnectedToInternet(Error)
    }
    func httpExchangeDataTask<ParsedResponse>(_ httpExchange: HttpExchange<ParsedResponse>, completionHandler: @escaping (Result<HttpExchangeDataTaskResponse<ParsedResponse>, Error>) -> ()) throws -> URLSessionDataTask {
        let httpRequest: HttpRequest
        do { httpRequest = try httpExchange.constructRequest() } catch {
            throw MessageError("\(error)")
        }
        let urlRequest = URLRequest(httpRequest)
        let dataTask = self.httpDataTask(with: urlRequest) { (result) in
            switch result {
            case let .success(response):
                switch response {
                case let .notConnectedToInternet(error):
                    completionHandler(.success(.notConnectedToInternet(error)))
                case let .httpUrlResponseWithData(httpUrlResponse, data):
                    let httpResponse = httpUrlResponse.httpResponse(data)
                    let parsedResponse: ParsedResponse
                    do { parsedResponse = try httpExchange.parseResponse(httpResponse) } catch {
                        completionHandler(.failure(MessageError("\(String(reflecting: error))")))
                        return
                    }
                    completionHandler(.success(.parsedResponse(parsedResponse)))
                }
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
        return dataTask
    }
    
}
