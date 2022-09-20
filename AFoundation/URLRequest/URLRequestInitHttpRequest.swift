import Foundation

public extension URLRequest {
    
    init(_ httpRequest: HttpRequest) {
        let uri = httpRequest.uri
        self.init(url: uri)
        httpMethod = httpRequest.method
        allHTTPHeaderFields = httpRequest.headers
        httpBody = httpRequest.body
    }
    
}
