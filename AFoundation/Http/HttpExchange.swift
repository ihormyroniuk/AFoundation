import Foundation

public protocol HttpExchange {
    associatedtype ParsedResponse: Sendable

    func constructRequest() throws -> HttpRequest
    func parseResponse(_ response: HttpResponse) throws -> ParsedResponse
}

open class SchemeHostHttpExchange<ParsedResponse: Sendable>: HttpExchange, CustomDebugStringConvertible {
    
    public let scheme: String
    public let host: String
    
    public init(scheme: String, host: String) {
        self.scheme = scheme
        self.host = host
    }
    
    // MARK: - HttpExchange
    
    open func constructRequest() throws -> HttpRequest {
        throw Error("")
    }
    
    open func parseResponse(_ response: HttpResponse) throws -> ParsedResponse {
        throw Error("")
    }
    
    // MARK: - CustomDebugStringConvertible
    
    open var debugDescription: String {
        let shemeDebugDescription = String(reflecting: scheme)
        let hostDebugDescription = String(reflecting: host)
        return "\(String(reflecting: Self.self))(scheme: \(shemeDebugDescription), host: \(hostDebugDescription))"
    }
}

open class RequestDataHttpExchange<RequestData: Sendable, ParsedResponse: Sendable>: HttpExchange, CustomDebugStringConvertible {
    
    public let requestData: RequestData
    
    public init(requestData: RequestData) {
        self.requestData = requestData
    }
    
    // MARK: - HttpExchange
    
    open func constructRequest() throws -> HttpRequest {
        throw Error("")
    }
    
    open func parseResponse(_ response: HttpResponse) throws -> ParsedResponse {
        throw Error("")
    }
    
    // MARK: - CustomDebugStringConvertible
    
    open var debugDescription: String {
        let requestDataDebugDescription = String(reflecting: requestData)
        return "\(String(reflecting: Self.self))(requestData: \(requestDataDebugDescription))"
    }
}

open class SchemeHostRequestDataHttpExchange<RequestData, ParsedResponse>: HttpExchange, CustomDebugStringConvertible {
    
    public let scheme: String
    public let host: String
    public let requestData: RequestData
    
    public init(scheme: String, host: String, requestData: RequestData) {
        self.scheme = scheme
        self.host = host
        self.requestData = requestData
    }
    
    // MARK: - HttpExchange
    
    open func constructRequest() throws -> HttpRequest {
        throw Error("")
    }
    
    open func parseResponse(_ response: HttpResponse) throws -> ParsedResponse {
        throw Error("")
    }
    
    // MARK: - CustomDebugStringConvertible
    
    open var debugDescription: String {
        let shemeDebugDescription = String(reflecting: scheme)
        let hostDebugDescription = String(reflecting: host)
        let requestDataDebugDescription = String(reflecting: requestData)
        return "\(String(reflecting: Self.self))(scheme: \(shemeDebugDescription), host: \(hostDebugDescription), requestData: \(requestDataDebugDescription))"
    }
}
