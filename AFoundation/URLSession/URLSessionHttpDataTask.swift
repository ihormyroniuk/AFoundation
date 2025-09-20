import Foundation

public extension URLSession {
    
    enum HttpDataTaskResponse {
        case httpUrlResponseWithData(HTTPURLResponse, Data?)
        case notConnectedToInternet(Swift.Error)
        case networkConnectionLost(Swift.Error)
    }
    func httpDataTask(with urlRequest: URLRequest, completionHandler: @escaping (Result<HttpDataTaskResponse, Swift.Error>) -> Void) -> URLSessionDataTask {
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

    @available(iOS 13.0.0, *)
    func httpDataTask(with urlRequest: URLRequest) async throws -> HttpDataTaskResponse {
        try await withCheckedThrowingContinuation { continuation in
            let dataTask = self.dataTask(with: urlRequest) { data, urlResponse, error in
                if let error = error {
                    let nsError = error as NSError
                    if nsError.code == NSURLErrorNotConnectedToInternet {
                        continuation.resume(returning: .notConnectedToInternet(error))
                    } else if nsError.code == NSURLErrorNetworkConnectionLost {
                        continuation.resume(returning: .networkConnectionLost(error))
                    } else {
                        continuation.resume(throwing: error)
                    }
                } else if let urlResponse = urlResponse {
                    if let httpUrlResponse = urlResponse as? HTTPURLResponse {
                        continuation.resume(returning: .httpUrlResponseWithData(httpUrlResponse, data))
                    } else {
                        let error = Error("Unexpected \(String(reflecting: urlResponse)) for \(String(reflecting: urlRequest))")
                        continuation.resume(throwing: error)
                    }
                } else {
                    let error = Error("Unexpected \(String(reflecting: URLSessionDataTask.self)) completionHandler call for \(String(reflecting: urlRequest))")
                    continuation.resume(throwing: error)
                }
            }
            dataTask.resume()
        }
    }
    
}
