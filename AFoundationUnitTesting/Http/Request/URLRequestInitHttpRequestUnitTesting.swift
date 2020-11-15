//
//  URLRequestUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 19.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class URLRequestInitHttpRequestUnitTesting: XCTestCase {

    func testInitWithoutheadersAndMessageBody() {
        let method = "GET"
        let requestUri = URL(string: "https://localhost")!
        let version = "HTTP/1.0"
        let body: Data? = nil
        let httpRequest = PlainHttpRequest(method: method, uri: requestUri, version: version, headers: nil, body: body)
        
        let urlRequest = URLRequest(httpRequest: httpRequest)
        
        XCTAssertTrue(urlRequest.url == httpRequest.uri, "Unexpected URLRequest object's url \"\(String(describing: urlRequest.url))\" is found while url \"(\(String(describing: httpRequest.uri))\" is expected)")
        XCTAssertTrue(urlRequest.httpMethod == httpRequest.method, "Unexpected URLRequest object's httpMethod \"\(String(describing: urlRequest.httpBody))\" is found while httpMethod \"(\(String(describing: httpRequest.method))\" is expected)")
        XCTAssertTrue(urlRequest.allHTTPHeaderFields ?? [:] == httpRequest.headers ?? [:], "Unexpected URLRequest object's allHTTPheaders \"\(String(describing: urlRequest.allHTTPHeaderFields))\" is found while allHTTPheaders \"(\(String(describing: httpRequest.headers))\" is expected)")
        XCTAssertTrue(Array(urlRequest.httpBody ?? Data()) == httpRequest.body ?? [], "Unexpected URLRequest object's httpBody \"\(String(describing: urlRequest.httpBody))\" is found while httpBody \"(\(String(describing: httpRequest.body))\" is expected)")
    }
    
    func testInitWithoutMessageBody() {
        let method = "GET"
        let requestUri = URL(string: "https://localhost")!
        let version = "HTTP/1.0"
        let headers: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        let body: Data? = nil
        let httpRequest = PlainHttpRequest(method: method, uri: requestUri, version: version, headers: headers, body: body)
        
        let urlRequest = URLRequest(httpRequest: httpRequest)
        
        XCTAssertTrue(urlRequest.url == httpRequest.uri, "Unexpected URLRequest object's url \"\(String(describing: urlRequest.url))\" is found while url \"(\(String(describing: httpRequest.uri))\" is expected)")
        XCTAssertTrue(urlRequest.httpMethod == httpRequest.method, "Unexpected URLRequest object's httpMethod \"\(String(describing: urlRequest.httpBody))\" is found while httpMethod \"(\(String(describing: httpRequest.method))\" is expected)")
        XCTAssertTrue(urlRequest.allHTTPHeaderFields ?? [:] == httpRequest.headers ?? [:], "Unexpected URLRequest object's allHTTPheaders \"\(String(describing: urlRequest.allHTTPHeaderFields))\" is found while allHTTPheaders \"(\(String(describing: httpRequest.headers))\" is expected)")
        XCTAssertTrue(Array(urlRequest.httpBody ?? Data()) == httpRequest.body ?? [], "Unexpected URLRequest object's httpBody \"\(String(describing: urlRequest.httpBody))\" is found while httpBody \"(\(String(describing: httpRequest.body))\" is expected)")
    }
    
    func testInitWithoutheaders() {
        let method = "GET"
        let requestUri = URL(string: "https://localhost")!
        let version = "HTTP/1.0"
        let body: [UInt8] = [0x00]
        let httpRequest = PlainHttpRequest(method: method, uri: requestUri, version: version, headers: nil, body: body)
        
        let urlRequest = URLRequest(httpRequest: httpRequest)
        
        XCTAssertTrue(urlRequest.url == httpRequest.uri, "Unexpected URLRequest object's url \"\(String(describing: urlRequest.url))\" is found while url \"(\(String(describing: httpRequest.uri))\" is expected)")
        XCTAssertTrue(urlRequest.httpMethod == httpRequest.method, "Unexpected URLRequest object's httpMethod \"\(String(describing: urlRequest.httpBody))\" is found while httpMethod \"(\(String(describing: httpRequest.method))\" is expected)")
        XCTAssertTrue(urlRequest.allHTTPHeaderFields ?? [:] == httpRequest.headers ?? [:], "Unexpected URLRequest object's allHTTPheaders \"\(String(describing: urlRequest.allHTTPHeaderFields))\" is found while allHTTPheaders \"(\(String(describing: httpRequest.headers))\" is expected)")
        XCTAssertTrue(Array(urlRequest.httpBody ?? Data()) == httpRequest.body ?? [], "Unexpected URLRequest object's httpBody \"\(String(describing: urlRequest.httpBody))\" is found while httpBody \"(\(String(describing: httpRequest.body))\" is expected)")
    }
    
    func testInit() {
        let method = "GET"
        let requestUri = URL(string: "https://localhost")!
        let version = "HTTP/1.0"
        let headers: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        let body: [UInt8] = [0x00]
        let httpRequest = PlainHttpRequest(method: method, uri: requestUri, version: version, headers: headers, body: body)
        
        let urlRequest = URLRequest(httpRequest: httpRequest)
        
        XCTAssertTrue(urlRequest.url == httpRequest.uri, "Unexpected URLRequest object's url \"\(String(describing: urlRequest.url))\" is found while url \"(\(String(describing: httpRequest.uri))\" is expected)")
        XCTAssertTrue(urlRequest.httpMethod == httpRequest.method, "Unexpected URLRequest object's httpMethod \"\(String(describing: urlRequest.httpBody))\" is found while httpMethod \"(\(String(describing: httpRequest.method))\" is expected)")
        XCTAssertTrue(urlRequest.allHTTPHeaderFields ?? [:] == httpRequest.headers ?? [:], "Unexpected URLRequest object's allHTTPheaders \"\(String(describing: urlRequest.allHTTPHeaderFields))\" is found while allHTTPheaders \"(\(String(describing: httpRequest.headers))\" is expected)")
        XCTAssertTrue(Array(urlRequest.httpBody ?? Data()) == httpRequest.body ?? [], "Unexpected URLRequest object's httpBody \"\(String(describing: urlRequest.httpBody))\" is found while httpBody \"(\(String(describing: httpRequest.body))\" is expected)")
    }
    
}
