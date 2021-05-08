//
//  URLSessionHttpDataTaskResponse.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 07.05.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension URLSession {
    
    enum HttpDataTaskResponse {
        case httpUrlResponseWithData(HTTPURLResponse, Data?)
        case notConnectedToInternet(Error)
        case networkConnectionLost(Error)
    }
    func httpDataTask(with urlRequest: URLRequest, completionHandler: @escaping (Result<HttpDataTaskResponse, Error>) -> Void) -> URLSessionDataTask {
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
                    completionHandler(.success(.httpUrlResponseWithData(httpUrlResponse, data)))
                } else {
                    completionHandler(.failure(MessageError("")))
                }
            } else {
                let error = MessageError("")
                completionHandler(.failure(error))
            }
        }
        return dataTask
    }

}
