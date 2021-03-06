//
//  HttpExchangeUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.05.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class HttpExchangeUnitTesting: XCTestCase {

    func testHttpExchangeConstructRequest() {
        let httpExchange = HttpExchange<Any>()
        do {
            let request = try httpExchange.constructRequest()
            
            XCTFail("Unexpected \(String(reflecting: request)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testHttpExchangeParseResponse() {
        let httpExchange = HttpExchange<Any>()
        let httpResponse = HttpResponse(version: "", code: 0, phrase: "", headers: nil, body: nil)
        do {
            let parsedResponse = try httpExchange.parseResponse(httpResponse)
            
            XCTFail("Unexpected \(String(reflecting: parsedResponse)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testSchemeHostHttpExchangeConstructRequest() {
        let httpExchange = SchemeHostHttpExchange<Any>(scheme: "", host: "")
        do {
            let request = try httpExchange.constructRequest()
            
            XCTFail("Unexpected \(String(reflecting: request)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testSchemeHostHttpExchangeParseResponse() {
        let httpExchange = SchemeHostHttpExchange<Any>(scheme: "", host: "")
        let httpResponse = HttpResponse(version: "", code: 0, phrase: "", headers: nil, body: nil)
        do {
            let parsedResponse = try httpExchange.parseResponse(httpResponse)
            
            XCTFail("Unexpected \(String(reflecting: parsedResponse)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testRequestDataHttpExchangeConstructRequest() {
        let httpExchange = RequestDataHttpExchange<Any, Any>(requestData: Void())
        do {
            let request = try httpExchange.constructRequest()
            
            XCTFail("Unexpected \(String(reflecting: request)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testRequestDataHttpExchangeParseResponse() {
        let httpExchange = RequestDataHttpExchange<Any, Any>(requestData: Void())
        let httpResponse = HttpResponse(version: "", code: 0, phrase: "", headers: nil, body: nil)
        do {
            let parsedResponse = try httpExchange.parseResponse(httpResponse)
            
            XCTFail("Unexpected \(String(reflecting: parsedResponse)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testSchemeHostRequestDataHttpExchangeConstructRequest() {
        let httpExchange = SchemeHostRequestDataHttpExchange<Any, Any>(scheme: "", host: "", requestData: Void())
        do {
            let request = try httpExchange.constructRequest()
            
            XCTFail("Unexpected \(String(reflecting: request)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
    func testSchemeHostRequestDataHttpExchangeParseResponse() {
        let httpExchange = SchemeHostRequestDataHttpExchange<Any, Any>(scheme: "", host: "", requestData: Void())
        let httpResponse = HttpResponse(version: "", code: 0, phrase: "", headers: nil, body: nil)
        do {
            let parsedResponse = try httpExchange.parseResponse(httpResponse)
            
            XCTFail("Unexpected \(String(reflecting: parsedResponse)) is returned, but error has to be thrown")
        } catch {
            return
        }
    }
    
}

