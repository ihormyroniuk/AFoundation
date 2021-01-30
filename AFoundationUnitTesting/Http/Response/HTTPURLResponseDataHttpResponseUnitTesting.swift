//
//  HTTPURLResponseDataHttpResponseUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 19.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class HTTPURLResponseDataHttpResponseUnitTesting: XCTestCase {

    func testInit() {
        let url = URL(string: "https://localhost")!
        let code = 200
        let version = "HTTP/1.0"
        let headers: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        let httpUrlResponse = HTTPURLResponse(url: url, statusCode: code, httpVersion: version, headerFields: headers)!
        let data = Data([0x00])
        
        let httpResponse = HttpResponse(httpUrlResponse: httpUrlResponse, data: data)
        
        XCTAssertTrue(httpResponse.code == httpUrlResponse.statusCode, "Unexpected HTTPResponse object's code \"\(String(describing: httpResponse.code))\" is found while code \"(\(String(describing: httpUrlResponse.statusCode))\" is expected)")
        XCTAssertTrue(httpResponse.headers == httpUrlResponse.allHeaderFields as? [String: String], "Unexpected HTTPResponse object's headers \"\(String(describing: httpResponse.headers))\" is found while headers \"(\(String(describing: httpUrlResponse.allHeaderFields))\" is expected)")
        XCTAssertTrue(httpResponse.body == data, "Unexpected HTTPResponse object's data \"\(String(describing: httpResponse.body))\" is found while data \"(\(String(describing: data))\" is expected)")
    }
    
    // MARK: Description
    
    func testDescriptionEmptyBody() {
        let url = URL(string: "https://localhost")!
        let code = 200
        let version = "HTTP/1.0"
        let headers: [String: String] = [:]
        let httpUrlResponse = HTTPURLResponse(url: url, statusCode: code, httpVersion: version, headerFields: headers)!
        let data: Data? = nil
        
        let httpResponse = HttpResponse(httpUrlResponse: httpUrlResponse, data: data)
        
        let description = httpResponse.description
        
        let expectedDescription = " 200 \n"
        XCTAssertTrue(description == expectedDescription, "Unexpected description \(description)) is found, but description \(expectedDescription) is expected")
    }
    
    func testDescription() {
        let code = 200
        let version = "HTTP/1.0"
        let headers: [String: String] = ["headerField1": "headerField1"]
        let data: Data? = Data([0x01])
        
        let httpResponse = HttpResponse(version: version, code: code, phrase: "OK", headers: headers, body: data)
        
        let description = httpResponse.description
        
        let expectedDescription =
            """
            HTTP/1.0 200 OK
            headerField1:headerField1
            
            00000001
            """
        XCTAssertTrue(description == expectedDescription, "Unexpected description \(description)) is found, but description \(expectedDescription) is expected")
    }
    
}
