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
    
    func testDescription() {
        let code = 200
        let version = "HTTP/1.0"
        let headers: [String: String] = ["headerField1": "headerField1"]
        let data: Data? = Data([0x01])
        
        let httpResponse = HttpResponse(version: version, code: code, phrase: "OK", headers: headers, body: data)
        
        let description = httpResponse.debugDescription
        
        let expectedDescription =
        """
        HTTP/1.0 200 OK
        headerField1:headerField1
        
        00000001
        """
        XCTAssertTrue(description == expectedDescription, "Unexpected description \(description)) is found, but description \(expectedDescription) is expected")
    }
    
}
