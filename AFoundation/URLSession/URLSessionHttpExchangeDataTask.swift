import Foundation

public extension URLSession {
    
    enum HttpExchangeDataTaskResponse<ParsedResponse> {
        case parsedResponse(ParsedResponse)
        case notConnectedToInternet(Swift.Error)
        case networkConnectionLost(Swift.Error)
    }
    func httpExchangeDataTask<E: HttpExchange>(_ httpExchange: E, completionHandler: @escaping (Result<HttpExchangeDataTaskResponse<E.ParsedResponse>, Swift.Error>) -> ()) throws -> URLSessionDataTask {
        let httpRequest: HttpRequest
        do { httpRequest = try httpExchange.constructRequest() } catch {
            throw Error("Cannot get \(String(reflecting: URLSessionDataTask.self)) for \(String(reflecting: httpExchange))\n\(error)")
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
                    let parsedResponse: E.ParsedResponse
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
    
    @available(iOS 13.0.0, *)
    func httpExchangeDataTask<E: HttpExchange>(_ httpExchange: E) async throws -> HttpExchangeDataTaskResponse<E.ParsedResponse> {
            let httpRequest: HttpRequest
            do {
                httpRequest = try httpExchange.constructRequest()
            } catch {
                throw Error("Cannot get \(String(reflecting: URLSessionDataTask.self)) for \(String(reflecting: httpExchange))\n\(error)")
            }

            let urlRequest = URLRequest(httpRequest)

            return try await withCheckedThrowingContinuation { continuation in
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
                        return
                    }

                    guard let urlResponse = urlResponse else {
                        let error = Error("Unexpected \(String(reflecting: URLSessionDataTask.self)) completionHandler call for \(String(reflecting: urlRequest))")
                        continuation.resume(throwing: error)
                        return
                    }

                    guard let httpUrlResponse = urlResponse as? HTTPURLResponse else {
                        let error = Error("Unexpected \(String(reflecting: urlResponse)) for \(String(reflecting: urlRequest))")
                        continuation.resume(throwing: error)
                        return
                    }

                    let httpResponse = httpUrlResponse.httpResponse(data)
                    do {
                        let parsedResponse = try httpExchange.parseResponse(httpResponse)
                        continuation.resume(returning: .parsedResponse(parsedResponse))
                    } catch {
                        let error = Error("Cannot parse \(httpResponse) for \(httpRequest) \n\(String(reflecting: error))")
                        continuation.resume(throwing: error)
                    }
                }
                dataTask.resume()
            }
        }
}
