//
//  HTTPURLResponseHttpResponseDataUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 31.01.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class HTTPURLResponseHttpResponseDataUnitTesting: XCTestCase {

    func testInit() {
        let url = URL(string: "https://localhost")!
        let code = 200
        let version = ""
        let phrase = ""
        let headers: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        let httpUrlResponse = HTTPURLResponse(url: url, statusCode: code, httpVersion: version, headerFields: headers)!
        let data = Data([0x00])
        
        let httpUrlResponseHttpResponse = httpUrlResponse.httpResponse(data: data)
        
        let httpResponse = HttpResponse(version: version, code: code, phrase: phrase, headers: headers, body: data)
        XCTAssertTrue(httpUrlResponseHttpResponse == httpResponse, "Unexpected HTTPResponse \"\(httpResponse)\" is found while \"(\(httpUrlResponse.statusCode)\" is expected)")
    }
    
    // MARK: Description
    
    func testDescriptionEmptyBody() {
        let url = URL(string: "https://localhost")!
        let code = 200
        let version = "HTTP/1.0"
        let headers: [String: String] = [:]
        let httpUrlResponse = HTTPURLResponse(url: url, statusCode: code, httpVersion: version, headerFields: headers)!
        let data: Data? = nil
        
        let httpResponse = httpUrlResponse.httpResponse(data: data)
        
        let description = httpResponse.description
        
        let expectedDescription = " 200 \n"
        XCTAssertTrue(description == expectedDescription, "Unexpected description \(description)) is found, but description \(expectedDescription) is expected")
    }
    
}
