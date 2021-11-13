//
//  URLSessionHttpExchangeUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 01.05.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class URLSessionHttpExchangeUnitTesting: XCTestCase {
    
    // MARK: Mocks
    
    private class MockURLSession: URLSession {
        
        class MockURLSessionDataTask: URLSessionDataTask {
            
            var data: Data?
            let completionHandler: (Data?, URLResponse?, Swift.Error?) -> Void
            
            init(completionHandler: @escaping (Data?, URLResponse?, Swift.Error?) -> Void) {
                self.completionHandler = completionHandler
                super.init()
            }
            
            override func resume() {
                completionHandler(data, response, error)
            }
            
        }
        
        override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Swift.Error?) -> Void) -> URLSessionDataTask {
            let urLSessionDataTask = MockURLSessionDataTask(completionHandler: completionHandler)
            return urLSessionDataTask
        }
    }
    
    // MARK: String
    
    func testInitString() {
//        let urlSession = MockURLSession()
//        let url = URL(string: "localhost")!
//        let request = URLRequest(url: url)
//
//        var dataTask = urlSession.urlDataTask(with: request) { (result) in
//        }
//        dataTask.data = Data()
//        dataTask.resume()
    }

}
