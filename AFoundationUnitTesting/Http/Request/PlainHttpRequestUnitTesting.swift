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

    func testInitWithoutheadersAndMessageBody() {
        let method = "GET"
        let uri = URL(string: "https://localhost")!.absoluteString
        let version = "HTTP/1.0"
        let body: Data? = nil
        
        let httpRequest = PlainHttpRequest(method: method, uri: uri, version: version, headers: nil, body: body)
        
        XCTAssertTrue(httpRequest.method == method, "Unexpected HTTPRequest object's method \"\(String(describing: httpRequest.method))\" is found while method \"(\(String(describing: method))\" is expected)")
        XCTAssertTrue(httpRequest.uri == uri, "Unexpected HTTP request object's request URI \"\(String(describing: httpRequest.uri))\" is found while request URI \"\(String(describing: uri))\" is expected)")
        XCTAssertTrue(httpRequest.version == version, "Unexpected HTTP request object's HTTP version \"\(String(describing: httpRequest.version))\" is found while HTTP version \"\(String(describing: version))\" is expected)")
    }
    
    func testInitWithoutMessageBody() {
        let method = "GET"
        let uri = URL(string: "https://localhost")!.absoluteString
        let version = "HTTP/1.0"
        let headers: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        let body: Data? = nil
        
        let httpRequest = PlainHttpRequest(method: method, uri: uri, version: version, headers: headers, body: body)
        
        XCTAssertTrue(httpRequest.method == method, "Unexpected HTTPRequest object's method \"\(String(describing: httpRequest.method))\" is found while method \"(\(String(describing: method))\" is expected)")
        XCTAssertTrue(httpRequest.uri == uri, "Unexpected HTTP request object's request URI \"\(String(describing: httpRequest.uri))\" is found while request URI \"\(String(describing: uri))\" is expected)")
        XCTAssertTrue(httpRequest.version == version, "Unexpected HTTP request object's HTTP version \"\(String(describing: httpRequest.version))\" is found while HTTP version \"\(String(describing: version))\" is expected)")
        XCTAssertTrue(httpRequest.headers == headers, "Unexpected HTTP request object's heder fields \"\(String(describing: httpRequest.headers))\" is found while header fields \"\(String(describing: headers))\" is expected)")
    }
    
    func testInitWithoutheaders() {
        let method = "GET"
        let uri = URL(string: "https://localhost")!.absoluteString
        let version = "HTTP/1.0"
        let body: [UInt8] = [0x00]
        
        let httpRequest = PlainHttpRequest(method: method, uri: uri, version: version, headers: nil, body: body)
        
        XCTAssertTrue(httpRequest.method == method, "Unexpected HTTPRequest object's method \"\(String(describing: httpRequest.method))\" is found while method \"(\(String(describing: method))\" is expected)")
        XCTAssertTrue(httpRequest.uri == uri, "Unexpected HTTP request object's request URI \"\(String(describing: httpRequest.uri))\" is found while request URI \"\(String(describing: uri))\" is expected)")
        XCTAssertTrue(httpRequest.version == version, "Unexpected HTTP request object's HTTP version \"\(String(describing: httpRequest.version))\" is found while HTTP version \"\(String(describing: version))\" is expected)")
        XCTAssertTrue(httpRequest.body == body, "Unexpected HTTP request object's message body \"\(String(describing: httpRequest.body))\" is found while message body \"\(String(describing: body))\" is expected)")
    }
    
    func testInit() {
        let method = "GET"
        let uri = URL(string: "https://localhost")!.absoluteString
        let version = "HTTP/1.0"
        let headers: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        let body: [UInt8] = [0x00]
        
        let httpRequest = PlainHttpRequest(method: method, uri: uri, version: version, headers: headers, body: body)
        
        XCTAssertTrue(httpRequest.method == method, "Unexpected HTTPRequest object's method \"\(String(describing: httpRequest.method))\" is found while method \"(\(String(describing: method))\" is expected)")
        XCTAssertTrue(httpRequest.uri == uri, "Unexpected HTTP request object's request URI \"\(String(describing: httpRequest.uri))\" is found while request URI \"\(String(describing: uri))\" is expected)")
        XCTAssertTrue(httpRequest.version == version, "Unexpected HTTP request object's HTTP version \"\(String(describing: httpRequest.version))\" is found while HTTP version \"\(String(describing: version))\" is expected)")
        XCTAssertTrue(httpRequest.headers == headers, "Unexpected HTTP request object's heder fields \"\(String(describing: httpRequest.headers))\" is found while header fields \"\(String(describing: headers))\" is expected)")
        XCTAssertTrue(httpRequest.body == body, "Unexpected HTTP request object's message body \"\(String(describing: httpRequest.body))\" is found while message body \"\(String(describing: body))\" is expected)")
    }
    
}
