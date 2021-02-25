//
//  jjj.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 03.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension URLSession {
    
    typealias URLResponseWithData = (urlResponse: URLResponse, data: Data?)
    func dataTask(with request: URLRequest, completionHandler: @escaping (Result<URLResponseWithData, URLSessionTask.Error>) -> Void) -> URLSessionDataTask {
        let dataTask = self.dataTask(with: request) { (data, urlResponse, error) in
            if let error = error {
                let error = URLSessionTask.Error(error as NSError)
                completionHandler(.failure(error))
            } else if let urlResponse = urlResponse {
                let urlResponseWithData = URLResponseWithData(urlResponse: urlResponse, data: data)
                completionHandler(.success(urlResponseWithData))
            } else {
                let error = NSError(domain: NSURLErrorDomain, code: NSURLErrorUnknown, userInfo: nil)
                completionHandler(.failure(.unknown(error)))
            }
        }
        return dataTask
    }
    
    typealias HTTPURLResponseWithData = (httpUrlResponse: HTTPURLResponse, data: Data?)
    func httpDataTask(with request: URLRequest, completionHandler: @escaping (Result<HTTPURLResponseWithData, URLSessionTask.Error>) -> Void) -> URLSessionDataTask {
        let dataTask = self.dataTask(with: request) { (result) in
            switch result {
            case let .success(urlResponseWithData):
                let urlResponse = urlResponseWithData.urlResponse
                let data = urlResponseWithData.data
                if let httpUrlResponse = urlResponse as? HTTPURLResponse {
                    let urlResponseWithData = HTTPURLResponseWithData(httpUrlResponse: httpUrlResponse, data: data)
                    completionHandler(.success(urlResponseWithData))
                } else {
                    let error = NSError(domain: NSURLErrorDomain, code: NSURLErrorBadServerResponse, userInfo: nil)
                    completionHandler(.failure(.unknown(error)))
                }
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
        return dataTask
    }
    
    func httpExchangeDataTask<ParsedResponse>(_ httpExchange: HttpExchange<ParsedResponse>, completionHandler: @escaping (Result<ParsedResponse, URLSessionTask.Error>) -> ()) throws -> URLSessionDataTask {
        let httpRequest: HttpRequest
        do { httpRequest = try httpExchange.constructRequest() } catch {
            fatalError()
        }
        let urlRequest = URLRequest(httpRequest: httpRequest)
        let dataTask = self.httpDataTask(with: urlRequest) { (result) in
            switch result {
            case let .success(urlResponseWithData):
                let httpUrlResponse = urlResponseWithData.httpUrlResponse
                let data = urlResponseWithData.data
                let httpResponse = httpUrlResponse.httpResponse(data: data)
                let response: ParsedResponse
                do { response = try httpExchange.parseResponse(httpResponse) } catch {
                    let error = UnexpectedHttpExchangeError(httpRequest: httpRequest, httpResponse: httpResponse, error: error)
                    completionHandler(.failure(.unexpectedError(error)))
                    return
                }
                completionHandler(.success(response))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
        return dataTask
    }
    
}
