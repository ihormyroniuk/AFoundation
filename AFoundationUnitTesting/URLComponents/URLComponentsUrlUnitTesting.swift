//
//  URLComponentsConstructUrlUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 13.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class URLComponentsUrlUnitTesting: XCTestCase {
    
    func testSchemeHost() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "localhost"
        
        let url: URL
        do { url = try urlComponents.url() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        let expectedUrl = URL(string: "http://localhost")
        XCTAssertTrue(url == expectedUrl, "Unexpected URL \(url)) is returned, but URL \(String(describing: expectedUrl)) is expected")
    }
    
    func testPath() {
        var urlComponents = URLComponents()
        urlComponents.path = "path"
        
        let url: URL
        do { url = try urlComponents.url() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        let expectedUrl = URL(string: "path")
        XCTAssertTrue(url == expectedUrl, "Unexpected URL \(url)) is returned, but URL \(String(describing: expectedUrl)) is expected")
    }
    
    func testSchemeHostPath() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "localhost"
        urlComponents.path = "/path"
        
        let url: URL
        do { url = try urlComponents.url() } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
        
        let expectedUrl = URL(string: "http://localhost/path")
        XCTAssertTrue(url == expectedUrl, "Unexpected URL \(url)) is returned, but URL \(String(describing: expectedUrl)) is expected")
    }

    func testHostPathWithoutSlash() {
        var urlComponents = URLComponents()
        urlComponents.host = "localhost"
        urlComponents.path = "path"
        
        let url: URL
        do { url = try urlComponents.url() } catch {
            return
        }
        
        XCTFail("Unexpected URL \"\(String(describing: url))\" is returned while error has to be thrown")
    }
    
    func testPathWithTwoSlashes() {
        var urlComponents = URLComponents()
        urlComponents.path = "//path"
        
        let url: URL
        do { url = try urlComponents.url() } catch {
            return
        }
        
        XCTFail("Unexpected URL \"\(String(describing: url))\" is returned while error has to be thrown")
    }
    
}
