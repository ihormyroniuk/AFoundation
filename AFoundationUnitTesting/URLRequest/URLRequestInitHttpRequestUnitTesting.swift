//
//  URLRequestUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 19.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class URLRequestInitHttpRequestUnitTesting: XCTestCase {

    func testInitWithoutheadersAndMessageBody() {
        let method = "GET"
        let uri = URL(string: "https://localhost")!
        let version = "HTTP/1.0"
        let headers: [String: String]? = nil
        let body: Data? = nil
        let httpRequest = HttpRequest(method: method, uri: uri, version: version, headers: headers, body: body)
        
        let httpRequestUrlRequest = URLRequest(httpRequest)
        
        var urlRequest = URLRequest(url: uri)
        urlRequest.httpMethod = method
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        XCTAssertTrue(httpRequestUrlRequest == urlRequest, "Unexpected URLRequest object's \"\(urlRequest)\" is found while \"(\(httpRequest))\" is expected)")
    }
    
    func testInitWithoutMessageBody() {
        let method = "GET"
        let uri = URL(string: "https://localhost")!
        let version = "HTTP/1.0"
        let headers: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        let body: Data? = nil
        let httpRequest = HttpRequest(method: method, uri: uri, version: version, headers: headers, body: body)
        
        let httpRequestUrlRequest = URLRequest(httpRequest)
        
        var urlRequest = URLRequest(url: uri)
        urlRequest.httpMethod = method
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        XCTAssertTrue(httpRequestUrlRequest == urlRequest, "Unexpected URLRequest object's \"\(urlRequest)\" is found while \"(\(httpRequest))\" is expected)")
    }
    
    func testInitWithoutheaders() {
        let method = "GET"
        let uri = URL(string: "https://localhost")!
        let version = "HTTP/1.0"
        let headers: [String: String]? = nil
        let body: Data = Data([0x00])
        let httpRequest = HttpRequest(method: method, uri: uri, version: version, headers: headers, body: body)
        
        let httpRequestUrlRequest = URLRequest(httpRequest)
        
        var urlRequest = URLRequest(url: uri)
        urlRequest.httpMethod = method
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        XCTAssertTrue(httpRequestUrlRequest == urlRequest, "Unexpected URLRequest object's \"\(urlRequest)\" is found while \"(\(httpRequest))\" is expected)")
    }
    
    func testInit() {
        let method = "GET"
        let uri = URL(string: "https://localhost")!
        let version = "HTTP/1.0"
        let headers: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        let body: Data = Data([0x00])
        let httpRequest = HttpRequest(method: method, uri: uri, version: version, headers: headers, body: body)
        
        let httpRequestUrlRequest = URLRequest(httpRequest)
        
        var urlRequest = URLRequest(url: uri)
        urlRequest.httpMethod = method
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        XCTAssertTrue(httpRequestUrlRequest == urlRequest, "Unexpected URLRequest object's \"\(urlRequest)\" is found while \"(\(httpRequest))\" is expected)")
    }
    
}
