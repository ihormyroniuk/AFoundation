//
//  URLComponentsConstructUrlUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 13.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class URLComponentsConstructUrlUnitTesting: XCTestCase {
    
    func test() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "localhost"
        urlComponents.path = "/path"
        
        let url: URL
        do { url = try urlComponents.constructUrl() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        let expectedUrl = URL(string: "http://localhost/path")!
        XCTAssertTrue(url == expectedUrl, "Unexpected URL \(url)) is constructed, but URL \(expectedUrl) is expected")
    }

    func testError() {
        var urlComponents = URLComponents()
        urlComponents.host = "localhost"
        urlComponents.path = "path"
        
        let url: URL
        do { url = try urlComponents.constructUrl() } catch {
            if error is URLComponentsConstructUrlError {
                return
            } else {
                XCTFail("Unexpected error \(error) is thrown")
                return
            }
        }
        
        XCTFail("Unexpected URL \"\(String(describing: url))\" is found while error \(URLComponentsConstructUrlError.self) has to be thrown")
    }
    
    // MARK: URLComponentsConstructUrlError
    
    func testURLComponentsConstructUrlErrorDescription() {
        let urlComponents = URLComponents()
        let error = URLComponentsConstructUrlError(urlComponents: urlComponents)
        
        let errorDescriptionString = "\(error)"
        
        let descriptionString = "Can not construct \(URL.self) using \(URLComponents.self) \(urlComponents)"
        XCTAssertTrue(errorDescriptionString == descriptionString, "Unexpected description string \(errorDescriptionString)) is found but description string \(descriptionString) is expected")
    }
    
}
