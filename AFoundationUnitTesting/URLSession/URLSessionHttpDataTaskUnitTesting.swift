//
//  URLSessionHttpDataTaskUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 28.11.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class URLSessionHttpDataTaskUnitTesting: XCTestCase {
    
    // MARK: Mocks
    
    private class MockURLSession: URLSession {
        
        let mockData: Data?
        let mockHttpUrlResponse: HTTPURLResponse?
        let mockError: Swift.Error?
        
        init(mockData: Data?, mockHttpUrlResponse: HTTPURLResponse?, mockError: Swift.Error?) {
            self.mockData = mockData
            self.mockHttpUrlResponse = mockHttpUrlResponse
            self.mockError = mockError
        }
        
        private class MockURLSessionDataTask: URLSessionDataTask {
            
            let mockData: Data?
            let mockHttpUrlResponse: HTTPURLResponse?
            let mockError: Swift.Error?
            let completionHandler: (Data?, URLResponse?, Swift.Error?) -> Void
            
            init(completionHandler: @escaping (Data?, URLResponse?, Swift.Error?) -> Void, mockData: Data?, mockHttpUrlResponse: HTTPURLResponse?, mockError: Swift.Error?) {
                self.completionHandler = completionHandler
                self.mockData = mockData
                self.mockHttpUrlResponse = mockHttpUrlResponse
                self.mockError = mockError
                super.init()
            }
            
            override func resume() {
                completionHandler(mockData, mockHttpUrlResponse, mockError)
            }
            
        }
        
        override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Swift.Error?) -> Void) -> URLSessionDataTask {
            let urLSessionDataTask = MockURLSessionDataTask(completionHandler: completionHandler, mockData: mockData, mockHttpUrlResponse: mockHttpUrlResponse, mockError: mockError)
            return urLSessionDataTask
        }
    }
    
    // MARK: String
    
    func testFailureError() {
        let data: Data? = nil
        let urlSession = MockURLSession(mockData: data, mockHttpUrlResponse: nil, mockError: nil)
        let url = URL(string: "localhost")!
        let request = URLRequest(url: url)

        let expectation = self.expectation(description: #function)
        let dataTask = urlSession.httpDataTask(with: request) { (result) in
            switch result {
            case .success(let urlDataTaskResponse):
                XCTFail("Unexpected success \(String(describing: urlDataTaskResponse)) is returned while failure has to be returned")
            case .failure:
                break
            }
            expectation.fulfill()
        }
        dataTask.resume()
        wait(for: [expectation], timeout: 1)
    }
    
    func testSuccessNotConnectedToInternet() {
        let data: Data? = nil
        let httpUrlResponse: HTTPURLResponse? = nil
        let nsError = NSError(domain: "", code: NSURLErrorNotConnectedToInternet, userInfo: nil)
        let urlSession = MockURLSession(mockData: data, mockHttpUrlResponse: httpUrlResponse, mockError: (nsError as Swift.Error))
        let url = URL(string: "localhost")!
        let request = URLRequest(url: url)

        let expectation = self.expectation(description: #function)
        let dataTask = urlSession.httpDataTask(with: request) { (result) in
            switch result {
            case .success(let urlDataTaskResponse):
                switch urlDataTaskResponse {
                case .notConnectedToInternet(let error):
                    XCTAssertTrue((error as NSError) == nsError)
                default:
                    XCTFail("Unexpected success \(String(describing: result)) is returned while failure has to be returned")
                }
            case .failure(let error):
                XCTFail("Unexpected failure \(String(describing: error)) is returned while success has to be returned")
            }
            expectation.fulfill()
        }
        dataTask.resume()
        wait(for: [expectation], timeout: 1)
    }
    
    func testSuccessNetworkConnectionLost() {
        let data: Data? = nil
        let httpUrlResponse: HTTPURLResponse? = nil
        let nsError = NSError(domain: "", code: NSURLErrorNetworkConnectionLost, userInfo: nil)
        let urlSession = MockURLSession(mockData: data, mockHttpUrlResponse: httpUrlResponse, mockError: (nsError as Swift.Error))
        let url = URL(string: "localhost")!
        let request = URLRequest(url: url)

        let expectation = self.expectation(description: #function)
        let dataTask = urlSession.httpDataTask(with: request) { (result) in
            switch result {
            case .success(let urlDataTaskResponse):
                switch urlDataTaskResponse {
                case .networkConnectionLost(let error):
                    XCTAssertTrue((error as NSError) == nsError)
                default:
                    XCTFail("Unexpected success \(String(describing: result)) is returned while failure has to be returned")
                }
            case .failure(let error):
                XCTFail("Unexpected failure \(String(describing: error)) is returned while success has to be returned")
            }
            expectation.fulfill()
        }
        dataTask.resume()
        wait(for: [expectation], timeout: 1)
    }

    func testSuccessHttpUrlResponseData() {
        let data: Data? = nil
        let url = URL(string: "localhost")!
        let statusCode: Int = 200
        let httpUrlResponse = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
        let error: Error? = nil
        let urlSession = MockURLSession(mockData: data, mockHttpUrlResponse: httpUrlResponse, mockError: error)
        let request = URLRequest(url: url)

        let expectation = self.expectation(description: #function)
        let dataTask = urlSession.httpDataTask(with: request) { (result) in
            switch result {
            case .failure(let error):
                XCTFail("Unexpected failure \(String(describing: error)) is returned while success has to be returned")
            case .success(let urlDataTaskResponse):
                switch urlDataTaskResponse {
                case let .httpUrlResponseWithData(urlResponse, _data):
                    XCTAssertTrue(urlResponse === httpUrlResponse)
                    XCTAssertTrue(_data == data)
                default:
                    XCTFail("Unexpected success \(String(describing: result)) is returned while failure has to be returned")
                }
            }
            expectation.fulfill()
        }
        dataTask.resume()
        wait(for: [expectation], timeout: 1)
    }
    
}
