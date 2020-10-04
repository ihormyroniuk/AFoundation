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

    func testInitWithoutHeaderFieldsAndMessageBody() {
        let method = "GET"
        let requestUri = URL(string: "https://localhost")!
        let httpVersion = "HTTP/1.0"
        let httpRequest = PlainHttpRequest(method: method, requestUri: requestUri, httpVersion: httpVersion)
        
        let urlRequest = URLRequest(httpRequest)
        
        XCTAssertTrue(urlRequest.url == httpRequest.requestUri, "Unexpected URLRequest object's url \"\(String(describing: urlRequest.url))\" is found while url \"(\(String(describing: httpRequest.requestUri))\" is expected)")
        XCTAssertTrue(urlRequest.httpMethod == httpRequest.method, "Unexpected URLRequest object's httpMethod \"\(String(describing: urlRequest.httpBody))\" is found while httpMethod \"(\(String(describing: httpRequest.method))\" is expected)")
        XCTAssertTrue(urlRequest.allHTTPHeaderFields ?? [:] == httpRequest.headerFields ?? [:], "Unexpected URLRequest object's allHTTPHeaderFields \"\(String(describing: urlRequest.allHTTPHeaderFields))\" is found while allHTTPHeaderFields \"(\(String(describing: httpRequest.headerFields))\" is expected)")
        XCTAssertTrue(urlRequest.httpBody ?? Data() == httpRequest.messageBody ?? Data(), "Unexpected URLRequest object's httpBody \"\(String(describing: urlRequest.httpBody))\" is found while httpBody \"(\(String(describing: httpRequest.messageBody))\" is expected)")
    }
    
    func testInitWithoutMessageBody() {
        let method = "GET"
        let requestUri = URL(string: "https://localhost")!
        let httpVersion = "HTTP/1.0"
        let headerFields: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        let httpRequest = PlainHttpRequest(method: method, requestUri: requestUri, httpVersion: httpVersion, headerFields: headerFields)
        
        let urlRequest = URLRequest(httpRequest)
        
        XCTAssertTrue(urlRequest.url == httpRequest.requestUri, "Unexpected URLRequest object's url \"\(String(describing: urlRequest.url))\" is found while url \"(\(String(describing: httpRequest.requestUri))\" is expected)")
        XCTAssertTrue(urlRequest.httpMethod == httpRequest.method, "Unexpected URLRequest object's httpMethod \"\(String(describing: urlRequest.httpBody))\" is found while httpMethod \"(\(String(describing: httpRequest.method))\" is expected)")
        XCTAssertTrue(urlRequest.allHTTPHeaderFields ?? [:] == httpRequest.headerFields ?? [:], "Unexpected URLRequest object's allHTTPHeaderFields \"\(String(describing: urlRequest.allHTTPHeaderFields))\" is found while allHTTPHeaderFields \"(\(String(describing: httpRequest.headerFields))\" is expected)")
        XCTAssertTrue(urlRequest.httpBody ?? Data() == httpRequest.messageBody ?? Data(), "Unexpected URLRequest object's httpBody \"\(String(describing: urlRequest.httpBody))\" is found while httpBody \"(\(String(describing: httpRequest.messageBody))\" is expected)")
    }
    
    func testInitWithoutHeaderFields() {
        let method = "GET"
        let requestUri = URL(string: "https://localhost")!
        let httpVersion = "HTTP/1.0"
        let messageBody = Data([0x00])
        let httpRequest = PlainHttpRequest(method: method, requestUri: requestUri, httpVersion: httpVersion, messageBody: messageBody)
        
        let urlRequest = URLRequest(httpRequest)
        
        XCTAssertTrue(urlRequest.url == httpRequest.requestUri, "Unexpected URLRequest object's url \"\(String(describing: urlRequest.url))\" is found while url \"(\(String(describing: httpRequest.requestUri))\" is expected)")
        XCTAssertTrue(urlRequest.httpMethod == httpRequest.method, "Unexpected URLRequest object's httpMethod \"\(String(describing: urlRequest.httpBody))\" is found while httpMethod \"(\(String(describing: httpRequest.method))\" is expected)")
        XCTAssertTrue(urlRequest.allHTTPHeaderFields ?? [:] == httpRequest.headerFields ?? [:], "Unexpected URLRequest object's allHTTPHeaderFields \"\(String(describing: urlRequest.allHTTPHeaderFields))\" is found while allHTTPHeaderFields \"(\(String(describing: httpRequest.headerFields))\" is expected)")
        XCTAssertTrue(urlRequest.httpBody ?? Data() == httpRequest.messageBody ?? Data(), "Unexpected URLRequest object's httpBody \"\(String(describing: urlRequest.httpBody))\" is found while httpBody \"(\(String(describing: httpRequest.messageBody))\" is expected)")
    }
    
    func testInit() {
        let method = "GET"
        let requestUri = URL(string: "https://localhost")!
        let httpVersion = "HTTP/1.0"
        let headerFields: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        let messageBody = Data([0x00])
        let httpRequest = PlainHttpRequest(method: method, requestUri: requestUri, httpVersion: httpVersion, headerFields: headerFields, messageBody: messageBody)
        
        let urlRequest = URLRequest(httpRequest)
        
        XCTAssertTrue(urlRequest.url == httpRequest.requestUri, "Unexpected URLRequest object's url \"\(String(describing: urlRequest.url))\" is found while url \"(\(String(describing: httpRequest.requestUri))\" is expected)")
        XCTAssertTrue(urlRequest.httpMethod == httpRequest.method, "Unexpected URLRequest object's httpMethod \"\(String(describing: urlRequest.httpBody))\" is found while httpMethod \"(\(String(describing: httpRequest.method))\" is expected)")
        XCTAssertTrue(urlRequest.allHTTPHeaderFields ?? [:] == httpRequest.headerFields ?? [:], "Unexpected URLRequest object's allHTTPHeaderFields \"\(String(describing: urlRequest.allHTTPHeaderFields))\" is found while allHTTPHeaderFields \"(\(String(describing: httpRequest.headerFields))\" is expected)")
        XCTAssertTrue(urlRequest.httpBody ?? Data() == httpRequest.messageBody ?? Data(), "Unexpected URLRequest object's httpBody \"\(String(describing: urlRequest.httpBody))\" is found while httpBody \"(\(String(describing: httpRequest.messageBody))\" is expected)")
    }
    
}
