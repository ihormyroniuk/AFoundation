//
//  HTTP.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 02.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://tools.ietf.org/html/rfc2616
 */
public enum Http {
    
    public enum Version {
        public static let http1dot1 = "HTTP/1.1"
    }
    
    public enum HeaderField {
        public static let authorization = "Authorization"
        public static let contentType = "Content-Type"
    }
    
    /**
        Implemented based on https://tools.ietf.org/html/rfc2616#section-5
     */
    public struct Request: CustomStringConvertible, Equatable {
        
        /**
            Implemented based on https://tools.ietf.org/html/rfc2616#section-9
         */
        public enum Method {
            public static let options = "OPTIONS"
            public static let get = "GET"
            public static let head = "HEAD"
            public static let post = "POST"
            public static let put = "PUT"
            public static let delete = "DELETE"
            public static let trace = "TRACE"
            public static let connect = "CONNECT"
        }
        public let method: String
        public let uri: URL
        public let version: String
        public let headers: [String: String]?
        public let body: Data?
        
        public init(method: String, uri: URL, version: String, headers: [String: String]?, body: Data?) {
            self.method = method
            self.uri = uri
            self.version = version
            self.headers = headers
            self.body = body
        }
        
        // MARK: CustomStringConvertible
        
        public var description: String {
            var description = "\(method) \(uri) \(version)\n"
            headers?.forEach({ description += "\($0):\($1)\n" })
            if let body = body, !body.isEmpty {
                description += "\n"
                body.forEach({ description += String(repeating: "0", count: $0.leadingZeroBitCount) + String($0, radix: 2) })
            }
            return description
        }
        
    }
    
    /**
        Implemented based on https://tools.ietf.org/html/rfc2616#section-6
     */
    public struct Response: CustomStringConvertible, Equatable {

        public let version: String
        /**
            Implemented based on https://tools.ietf.org/html/rfc2616#section-10
         */
        public enum Code {
            public static let `continue` = 100
            public static let switchingProtocols = 101
            public static let ok = 200
            public static let created = 201
            public static let accepted = 202
            public static let nonAuthoritativeInformation = 203
            public static let noContent = 204
            public static let resetContent = 205
            public static let partialContent = 206
            public static let multipleChoices = 300
            public static let movedPermanently = 301
            public static let found = 302
            public static let seeOther = 303
            public static let notModified = 304
            public static let useProxy = 305
            public static let temporaryRedirect = 307
            public static let badRequest = 400
            public static let unauthorized = 401
            public static let paymentRequired = 402
            public static let forbidden = 403
            public static let notFound = 404
            public static let methodNotAllowed = 405
            public static let notAcceptable = 406
            public static let proxyAuthenticationRequired = 407
            public static let requestTimeOut = 408
            public static let conflict = 409
            public static let gone = 410
            public static let lengthRequired = 411
            public static let preconditionFailed = 412
            public static let requestEntityTooLarge = 413
            public static let requestUriTooLarge = 414
            public static let unsupportedMediaType = 415
            public static let requestedRangeNotSatisfiable = 416
            public static let expectationFailed = 417
            public static let internalServerError = 500
            public static let notImplemented = 501
            public static let badGateway = 502
            public static let serviceUnavailable = 503
            public static let gatewayTimeOut = 504
            public static let httpVersionNotSupported = 505
        }
        public let code: Int
        public let phrase: String
        public let headers: [String: String]?
        public let body: Data?
        
        public init(version: String, code: Int, phrase: String, headers: [String: String]?, body: Data?) {
            self.version = version
            self.code = code
            self.phrase = phrase
            self.headers = headers
            self.body = body
        }
        
        // MARK: CustomStringConvertible
        
        public var description: String {
            var description = "\(version) \(code) \(phrase)\n"
            headers?.forEach({ description += "\($0):\($1)\n" })
            if let body = body, !body.isEmpty {
                description += "\n"
                body.forEach({ description += String(repeating: "0", count: $0.leadingZeroBitCount) + String($0, radix: 2) })
            }
            return description
        }
        
    }
    
    open class Exchange<HttpRequestData, ParsedHttpResponse> {
        
        open func constructHttpRequest(data: HttpRequestData) throws -> Http.Request {
            fatalError()
        }
        
        open func parseHttpResponse(httpResponse: Http.Response) throws -> ParsedHttpResponse {
            fatalError()
        }
        
    }

    open class SchemeHostExchange<HttpRequestData, ParsedHttpResponse>: Http.Exchange<HttpRequestData, ParsedHttpResponse> {
        
        public let scheme: String
        public let host: String
        
        public init(scheme: String, host: String) {
            self.scheme = scheme
            self.host = host
        }
        
    }
    
}
