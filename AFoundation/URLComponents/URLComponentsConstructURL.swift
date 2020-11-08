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
        guard let url = self.url else {
            let error = URLComponentsConstructUrlError(urlComponents: self)
            throw error
        }
        return url
    }
    
}

public struct URLComponentsConstructUrlError: Error {
    
    public let urlComponents: URLComponents
    
    public init(urlComponents: URLComponents) {
        self.urlComponents = urlComponents
    }
    
}
