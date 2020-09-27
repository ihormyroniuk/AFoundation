//
//  PlainHttpRequestUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 19.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class PlainHttpRequestUnitTesting: XCTestCase {

    func testInitWithoutHeaderFieldsAndMessageBody() {
        let method = "GET"
        let requestUri = URL(string: "https://localhost")!
        let httpVersion = "HTTP/1.0"
        
        let httpRequest = PlainHttpRequest(method: method, requestUri: requestUri, httpVersion: httpVersion)
        
        XCTAssertTrue(httpRequest.method == method, "Unexpected HTTPRequest object's method \"\(String(describing: httpRequest.method))\" is found while method \"(\(String(describing: method))\" is expected)")
        XCTAssertTrue(httpRequest.requestUri == requestUri, "Unexpected HTTP request object's request URI \"\(String(describing: httpRequest.requestUri))\" is found while request URI \"\(String(describing: requestUri))\" is expected)")
        XCTAssertTrue(httpRequest.httpVersion == httpVersion, "Unexpected HTTP request object's HTTP version \"\(String(describing: httpRequest.httpVersion))\" is found while HTTP version \"\(String(describing: httpVersion))\" is expected)")
    }
    
    func testInitWithoutMessageBody() {
        let method = "GET"
        let requestUri = URL(string: "https://localhost")!
        let httpVersion = "HTTP/1.0"
        let headerFields: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        
        let httpRequest = PlainHttpRequest(method: method, requestUri: requestUri, httpVersion: httpVersion, headerFields: headerFields)
        
        XCTAssertTrue(httpRequest.method == method, "Unexpected HTTPRequest object's method \"\(String(describing: httpRequest.method))\" is found while method \"(\(String(describing: method))\" is expected)")
        XCTAssertTrue(httpRequest.requestUri == requestUri, "Unexpected HTTP request object's request URI \"\(String(describing: httpRequest.requestUri))\" is found while request URI \"\(String(describing: requestUri))\" is expected)")
        XCTAssertTrue(httpRequest.httpVersion == httpVersion, "Unexpected HTTP request object's HTTP version \"\(String(describing: httpRequest.httpVersion))\" is found while HTTP version \"\(String(describing: httpVersion))\" is expected)")
        XCTAssertTrue(httpRequest.headerFields == headerFields, "Unexpected HTTP request object's heder fields \"\(String(describing: httpRequest.headerFields))\" is found while header fields \"\(String(describing: headerFields))\" is expected)")
    }
    
    func testInitWithoutHeaderFields() {
        let method = "GET"
        let requestUri = URL(string: "https://localhost")!
        let httpVersion = "HTTP/1.0"
        let messageBody = Data([0x00])
        
        let httpRequest = PlainHttpRequest(method: method, requestUri: requestUri, httpVersion: httpVersion, messageBody: messageBody)
        
        XCTAssertTrue(httpRequest.method == method, "Unexpected HTTPRequest object's method \"\(String(describing: httpRequest.method))\" is found while method \"(\(String(describing: method))\" is expected)")
        XCTAssertTrue(httpRequest.requestUri == requestUri, "Unexpected HTTP request object's request URI \"\(String(describing: httpRequest.requestUri))\" is found while request URI \"\(String(describing: requestUri))\" is expected)")
        XCTAssertTrue(httpRequest.httpVersion == httpVersion, "Unexpected HTTP request object's HTTP version \"\(String(describing: httpRequest.httpVersion))\" is found while HTTP version \"\(String(describing: httpVersion))\" is expected)")
        XCTAssertTrue(httpRequest.messageBody == messageBody, "Unexpected HTTP request object's message body \"\(String(describing: httpRequest.messageBody))\" is found while message body \"\(String(describing: messageBody))\" is expected)")
    }
    
    func testInit() {
        let method = "GET"
        let requestUri = URL(string: "https://localhost")!
        let httpVersion = "HTTP/1.0"
        let headerFields: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        let messageBody = Data([0x00])
        
        let httpRequest = PlainHttpRequest(method: method, requestUri: requestUri, httpVersion: httpVersion, headerFields: headerFields, messageBody: messageBody)
        
        XCTAssertTrue(httpRequest.method == method, "Unexpected HTTPRequest object's method \"\(String(describing: httpRequest.method))\" is found while method \"(\(String(describing: method))\" is expected)")
        XCTAssertTrue(httpRequest.requestUri == requestUri, "Unexpected HTTP request object's request URI \"\(String(describing: httpRequest.requestUri))\" is found while request URI \"\(String(describing: requestUri))\" is expected)")
        XCTAssertTrue(httpRequest.httpVersion == httpVersion, "Unexpected HTTP request object's HTTP version \"\(String(describing: httpRequest.httpVersion))\" is found while HTTP version \"\(String(describing: httpVersion))\" is expected)")
        XCTAssertTrue(httpRequest.headerFields == headerFields, "Unexpected HTTP request object's heder fields \"\(String(describing: httpRequest.headerFields))\" is found while header fields \"\(String(describing: headerFields))\" is expected)")
        XCTAssertTrue(httpRequest.messageBody == messageBody, "Unexpected HTTP request object's message body \"\(String(describing: httpRequest.messageBody))\" is found while message body \"\(String(describing: messageBody))\" is expected)")
    }
    
}
