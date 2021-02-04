//
//  URLSessionTask.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 04.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

extension URLSessionTask {
    
    public enum Error: Swift.Error, LocalizedError {
        case notConnectedToInternet(NSError)
        case unknown(NSError)
        case badServerResponse(NSError)
        case unexpectedError(Swift.Error)
        
        init(_ error: Swift.Error) {
            let nsError = error as NSError
            if nsError.code == NSURLErrorNotConnectedToInternet {
                self = .notConnectedToInternet(nsError)
            } else if nsError.code == NSURLErrorUnknown {
                self = .unknown(nsError)
            } else if nsError.code == NSURLErrorBadServerResponse {
                self = .badServerResponse(nsError)
            } else {
                self = .unexpectedError(nsError)
            }
        }
    }
    
    public struct URLResponseWithData {
        let urlResponse: URLResponse
        let data: Data?
    }
    
    public struct HTTPURLResponseWithData {
        let httpUrlResponse: HTTPURLResponse
        let data: Data?
    }
    
}