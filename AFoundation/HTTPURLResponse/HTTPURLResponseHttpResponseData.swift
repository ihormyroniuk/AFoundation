import Foundation

public extension HTTPURLResponse {
    
    func httpResponse(_ data: Data?) -> HttpResponse {
        let version = ""
        let code = statusCode
        let phrase = ""
        let headers = allHeaderFields as? [String: String]
        let body = data
        let httpResponse = HttpResponse(version: version, code: code, phrase: phrase, headers: headers, body: body)
        return httpResponse
    }
    
}
