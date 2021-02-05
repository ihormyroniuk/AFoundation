//
//  URLSessionTask.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 04.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

extension URLSessionTask {
    
    public enum Error: Swift.Error, CustomStringConvertible {
        case notConnectedToInternet(NSError)
        case unknown(NSError)
        case badServerResponse(NSError)
        case unexpectedError(NSError)
        
        init(_ error: NSError) {
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
        
        public var description: String {
            switch self {
            case let .badServerResponse(error):
                return error.description
            case let .notConnectedToInternet(error):
                return error.description
            case let .unknown(error):
                return error.description
            case let .unexpectedError(error):
                return error.description
            }
        }
    }

}
