//
//  jjj.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 03.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension URLSession {
    
    func dataTask<Data, B>(httpExchange: Http.Exchange<Data, B>, data: Data, completionHandler: @escaping (Result<B, DataTaskError>) -> ()) {
        do {
            let httpRequest = try httpExchange.constructHttpRequest(data: data)
            let urlRequest = URLRequest(httpRequest: httpRequest)
            let dataTask = self.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    let interactionError = DataTaskError(error: error)
                    completionHandler(.failure(interactionError))
                } else if let httpUrlResponse = response as? HTTPURLResponse {
                    let httpResponse = httpUrlResponse.httpResponse(data: data)
                    let response: B
                    do { response = try httpExchange.parseHttpResponse(httpResponse: httpResponse) } catch {
                        let error = UnexpectedHttpExchangeError(httpRequest: httpRequest, httpResponse: httpResponse, error: error)
                        completionHandler(.failure(.unexpectedError(error: error)))
                        return
                    }
                    completionHandler(.success(response))
                } else {
                    let error = UnexpectedDataTaskCompletion()
                    completionHandler(.failure(.unexpectedError(error: error)))
                }
            }
            dataTask.resume()
        } catch {
            let interactionError = DataTaskError(error: error)
            completionHandler(.failure(interactionError))
        }
    }
    
}

public struct UnexpectedDataTaskCompletion: Error {
    
}

public enum DataTaskError: Error {
    case notConnectedToInternet
    case unexpectedError(error: Error)
    
    init(error: Error) {
        if (error as NSError).code == NSURLErrorNotConnectedToInternet {
            self = .notConnectedToInternet
        } else {
            self = .unexpectedError(error: error)
        }
    }
    
}
