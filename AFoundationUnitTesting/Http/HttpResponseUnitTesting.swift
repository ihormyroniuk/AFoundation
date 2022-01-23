//
//  HTTPURLResponseDataHttpResponseUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 19.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class HttpResponseUnitTesting: XCTestCase {
    
    // MARK: Debug Description
    
    func testDebugDescription() {
        let code = 200
        let version = "HTTP/1.0"
        let headers: [String: String]? = ["headerField1": "headerField1"]
        let body: Data? = Data([0x01, 0x02])
        
        let httpResponse = HttpResponse(version: version, code: code, phrase: "OK", headers: headers, body: body)
        
        let description = httpResponse.debugDescription
        
        let expectedDescription = "AFoundation.HttpResponse(version: \"HTTP/1.0\", code: 200, phrase: \"OK\", headers: [\"headerField1\": \"headerField1\"], body: [1, 2])"
        XCTAssertTrue(description == expectedDescription, "Unexpected description \(description) is found, but description \(expectedDescription) is expected")
    }
    
    func testDebugDescriptionEmptyHeader() {
        let code = 200
        let version = "HTTP/1.0"
        let headers: [String: String]? = nil
        let body: Data? = Data([0x01, 0x02])
        
        let httpResponse = HttpResponse(version: version, code: code, phrase: "OK", headers: headers, body: body)
        
        let description = httpResponse.debugDescription
        
        let expectedDescription = "AFoundation.HttpResponse(version: \"HTTP/1.0\", code: 200, phrase: \"OK\", headers: nil, body: [1, 2])"
        XCTAssertTrue(description == expectedDescription, "Unexpected description \(description) is found, but description \(expectedDescription) is expected")
    }
    
    func testDebugDescriptionEmptyBody() {
        let code = 200
        let version = "HTTP/1.0"
        let headers: [String: String]? = ["headerField1": "headerField1"]
        let body: Data? = nil
        
        let httpResponse = HttpResponse(version: version, code: code, phrase: "OK", headers: headers, body: body)
        
        let description = httpResponse.debugDescription
        
        let expectedDescription = "AFoundation.HttpResponse(version: \"HTTP/1.0\", code: 200, phrase: \"OK\", headers: [\"headerField1\": \"headerField1\"], body: nil)"
        XCTAssertTrue(description == expectedDescription, "Unexpected description \(description) is found, but description \(expectedDescription) is expected")
    }
    
    func testDebugDescriptionEmptyHeaderEmptyBody() {
        let code = 200
        let version = "HTTP/1.0"
        let headers: [String: String]? = nil
        let body: Data? = nil
        
        let httpResponse = HttpResponse(version: version, code: code, phrase: "OK", headers: headers, body: body)
        
        let description = httpResponse.debugDescription
        
        let expectedDescription = "AFoundation.HttpResponse(version: \"HTTP/1.0\", code: 200, phrase: \"OK\", headers: nil, body: nil)"
        XCTAssertTrue(description == expectedDescription, "Unexpected description \(description) is found, but description \(expectedDescription) is expected")
    }
    
}
