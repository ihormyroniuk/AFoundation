import XCTest
import Foundation
@testable import AFoundation

class URLSessionHttpExchangeDataTaskUnitTesting: XCTestCase {
    
    // MARK: Mocks
    
    private class MockURLSession: URLSession, @unchecked Sendable {
        
        let mockData: Data?
        let mockUrlResponse: URLResponse?
        let mockError: Swift.Error?
        
        init(mockData: Data?, mockHttpUrlResponse: URLResponse?, mockError: Swift.Error?) {
            self.mockData = mockData
            self.mockUrlResponse = mockHttpUrlResponse
            self.mockError = mockError
        }
        
        private class MockURLSessionDataTask: URLSessionDataTask, @unchecked Sendable {
            
            let mockData: Data?
            let mockUrlResponse: URLResponse?
            let mockError: Swift.Error?
            let completionHandler: (Data?, URLResponse?, Swift.Error?) -> Void
            
            init(completionHandler: @escaping (Data?, URLResponse?, Swift.Error?) -> Void, mockData: Data?, mockHttpUrlResponse: URLResponse?, mockError: Swift.Error?) {
                self.completionHandler = completionHandler
                self.mockData = mockData
                self.mockUrlResponse = mockHttpUrlResponse
                self.mockError = mockError
                super.init()
            }
            
            override func resume() {
                completionHandler(mockData, mockUrlResponse, mockError)
            }
            
        }
        
        override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Swift.Error?) -> Void) -> URLSessionDataTask {
            let urLSessionDataTask = MockURLSessionDataTask(completionHandler: completionHandler, mockData: mockData, mockHttpUrlResponse: mockUrlResponse, mockError: mockError)
            return urLSessionDataTask
        }
    }
    
    private class MockHttpExchange<ParsedResponse: Sendable>: HttpExchange {
        func constructRequest() throws -> HttpRequest {
            let method = HttpRequestMethod.get
            let uri = URL(string: "localhost")!
            let version = HttpVersion.http1dot1
            let headers: [String : String]? = nil
            let body: Data? = nil
            let httpRequest = HttpRequest(method: method, uri: uri, version: version, headers: headers, body: body)
            return httpRequest
        }
        
        func parseResponse(_ response: HttpResponse) throws -> Void {
            return
        }
    }
    
    private class MockHttpExchangeErrorConstructRequest<ParsedResponse: Sendable>: HttpExchange {
        func constructRequest() throws -> HttpRequest {
            let error = Error("")
            throw error
        }
        
        func parseResponse(_ response: HttpResponse) throws -> Void {
            return
        }
    }
    
    private class MockHttpExchangeErrorParseResponse<ParsedResponse: Sendable>: HttpExchange {
        func constructRequest() throws -> HttpRequest {
            let method = HttpRequestMethod.get
            let uri = URL(string: "localhost")!
            let version = HttpVersion.http1dot1
            let headers: [String : String]? = nil
            let body: Data? = nil
            let httpRequest = HttpRequest(method: method, uri: uri, version: version, headers: headers, body: body)
            return httpRequest
        }
        
        func parseResponse(_ response: HttpResponse) throws -> Void {
            let error = Error("")
            throw error
        }
    }
    
    // MARK: String
    
    func testFailureError() {
        let data: Data? = nil
        let urlSession = MockURLSession(mockData: data, mockHttpUrlResponse: nil, mockError: nil)
        let httpExchange = MockHttpExchange<any Sendable>()

        let expectation = self.expectation(description: #function)
        do {
            let dataTask = try urlSession.httpExchangeDataTask(httpExchange) { (result) in
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
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
    }
    
    func testFailureParseResponseError() {
        let data: Data? = nil
        let url = URL(string: "localhost")!
        let statusCode: Int = 200
        let httpUrlResponse = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
        let error: Error? = nil
        let urlSession = MockURLSession(mockData: data, mockHttpUrlResponse: httpUrlResponse, mockError: error)
        let httpExchange = MockHttpExchangeErrorParseResponse<any Sendable>()

        let expectation = self.expectation(description: #function)
        do {
            let dataTask = try urlSession.httpExchangeDataTask(httpExchange) { (result) in
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
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
    }
    
    func testFailureParseResponseError2() {
        let data: Data? = nil
        let url = URL(string: "localhost")!
        let httpUrlResponse: URLResponse? = URLResponse(url: url, mimeType: nil, expectedContentLength: 0, textEncodingName: nil)
        let error: Error? = nil
        let urlSession = MockURLSession(mockData: data, mockHttpUrlResponse: httpUrlResponse, mockError: error)
        let httpExchange = MockHttpExchangeErrorParseResponse<any Sendable>()

        let expectation = self.expectation(description: #function)
        do {
            let dataTask = try urlSession.httpExchangeDataTask(httpExchange) { (result) in
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
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
    }
    
    func testSuccessNotConnectedToInternet() {
        let data: Data? = nil
        let httpUrlResponse: HTTPURLResponse? = nil
        let nsError = NSError(domain: "", code: NSURLErrorNotConnectedToInternet, userInfo: nil)
        let urlSession = MockURLSession(mockData: data, mockHttpUrlResponse: httpUrlResponse, mockError: (nsError as Swift.Error))
        let httpExchange = MockHttpExchange<any Sendable>()

        let expectation = self.expectation(description: #function)
        do {
            let dataTask = try urlSession.httpExchangeDataTask(httpExchange) { (result) in
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
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
    }
    
    func testSuccessNetworkConnectionLost() {
        let data: Data? = nil
        let httpUrlResponse: HTTPURLResponse? = nil
        let nsError = NSError(domain: "", code: NSURLErrorNetworkConnectionLost, userInfo: nil)
        let urlSession = MockURLSession(mockData: data, mockHttpUrlResponse: httpUrlResponse, mockError: (nsError as Swift.Error))
        let httpExchange = MockHttpExchange<any Sendable>()

        let expectation = self.expectation(description: #function)
        do {
            let dataTask = try urlSession.httpExchangeDataTask(httpExchange) { (result) in
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
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
    }

    func testSuccessHttpUrlResponseData() {
        let data: Data? = nil
        let url = URL(string: "localhost")!
        let statusCode: Int = 200
        let httpUrlResponse = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
        let error: Error? = nil
        let urlSession = MockURLSession(mockData: data, mockHttpUrlResponse: httpUrlResponse, mockError: error)
        let httpExchange = MockHttpExchange<any Sendable>()

        let expectation = self.expectation(description: #function)
        do {
            let dataTask = try urlSession.httpExchangeDataTask(httpExchange) { (result) in
                switch result {
                case .failure(let error):
                    XCTFail("Unexpected failure \(String(describing: error)) is returned while success has to be returned")
                case .success(let urlDataTaskResponse):
                    switch urlDataTaskResponse {
                    case .parsedResponse(_):
                        break
                    default:
                        XCTFail("Unexpected success \(String(describing: result)) is returned while failure has to be returned")
                    }
                }
                expectation.fulfill()
            }
            dataTask.resume()
            wait(for: [expectation], timeout: 1)
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
            return
        }
    }
    
    func testFailureConstructRequestError() {
        let data: Data? = nil
        let urlSession = MockURLSession(mockData: data, mockHttpUrlResponse: nil, mockError: nil)
        let httpExchange = MockHttpExchangeErrorConstructRequest<any Sendable>()

        let expectation = self.expectation(description: #function)
        do {
            let dataTask = try urlSession.httpExchangeDataTask(httpExchange) { (result) in
                XCTFail("Unexpected result \(result) is returned, but error has to be thrown")
                expectation.fulfill()
            }
            dataTask.resume()
            wait(for: [expectation], timeout: 1)
        } catch {
            expectation.fulfill()
            wait(for: [expectation], timeout: 1)
        }
    }
    
}
