//
//  URLComponentsConstructURL.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 08.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension URLComponents {
    
    func constructUrl() throws -> URL {
        if let url = self.url { return url }
        else { throw CannotConstructUrlError(urlComponents: self) }
    }
    private struct CannotConstructUrlError: Error, CustomStringConvertible {
        let urlComponents: URLComponents
        public var description: String {
            return "\(String(reflecting: urlComponents)) cannot construct \(String(reflecting: URL.self))"
        }
    }
    
}
