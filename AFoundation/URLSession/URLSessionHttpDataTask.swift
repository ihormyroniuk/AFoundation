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

}
