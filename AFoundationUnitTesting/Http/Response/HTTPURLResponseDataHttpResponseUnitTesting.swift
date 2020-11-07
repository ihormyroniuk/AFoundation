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
        let statusCode = 200
        let httpVersion = "HTTP/1.0"
        let headerFields: [String: String] = ["headerField1": "headerField1", "headerField2": "headerField2"]
        let httpUrlResponse = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: httpVersion, headerFields: headerFields)!
        let data = Data([0x00])
        
        let httpResponse = HTTPURLResponseDataHttpResponse(httpUrlResponse: httpUrlResponse, data: data)
        
        XCTAssertTrue(httpResponse.statusCode == httpUrlResponse.statusCode, "Unexpected HTTPResponse object's statusCode \"\(String(describing: httpResponse.statusCode))\" is found while statusCode \"(\(String(describing: httpUrlResponse.statusCode))\" is expected)")
        XCTAssertTrue(httpResponse.headerFields == httpUrlResponse.allHeaderFields as? [String: String], "Unexpected HTTPResponse object's headerFields \"\(String(describing: httpResponse.headerFields))\" is found while headerFields \"(\(String(describing: httpUrlResponse.allHeaderFields))\" is expected)")
        XCTAssertTrue(httpResponse.entityBody == data, "Unexpected HTTPResponse object's data \"\(String(describing: httpResponse.entityBody))\" is found while data \"(\(String(describing: data))\" is expected)")
    }
    
}
