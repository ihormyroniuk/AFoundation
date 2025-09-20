import Foundation

public extension URLSession {
    
    enum UrlDataTaskResponse {
        case urlResponseWithData(URLResponse, Data?)
        case notConnectedToInternet(Swift.Error)
        case networkConnectionLost(Swift.Error)
    }
    func urlDataTask(with urlRequest: URLRequest, completionHandler: @escaping (Result<UrlDataTaskResponse, Swift.Error>) -> Void) -> URLSessionDataTask {
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
                completionHandler(.success(.urlResponseWithData(urlResponse, data)))
            } else {
                let error = Error("Unexpected \(String(reflecting: URLSessionDataTask.self)) completionHandler call for \(String(reflecting: urlRequest))")
                completionHandler(.failure(error))
            }
        }
        return dataTask
    }

    @available(iOS 13.0.0, *)
    func urlDataTask(with urlRequest: URLRequest) async throws -> UrlDataTaskResponse {
        try await withCheckedThrowingContinuation { continuation in
            let dataTask = self.dataTask(with: urlRequest) { (data, urlResponse, error) in
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
                    continuation.resume(returning: .urlResponseWithData(urlResponse, data))
                } else {
                    let error = Error("Unexpected \(String(reflecting: URLSessionDataTask.self)) completionHandler call for \(String(reflecting: urlRequest))")
                    continuation.resume(throwing: error)
                }
            }
            dataTask.resume()
        }
    }
}
