import Foundation

/**
    Implemented based on https://tools.ietf.org/html/rfc2616#section-9
 */
public enum HttpRequestMethod {
    
    public static let options = "OPTIONS"
    public static let get = "GET"
    public static let head = "HEAD"
    public static let post = "POST"
    public static let put = "PUT"
    public static let delete = "DELETE"
    public static let trace = "TRACE"
    public static let connect = "CONNECT"
    
}
