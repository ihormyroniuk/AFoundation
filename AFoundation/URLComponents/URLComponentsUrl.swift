//
//  URLComponentsConstructURL.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 08.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension URLComponents {
    
    func url() throws -> URL {
        guard let url = self.url else {
            throw MessageError("Cannot get \(String(reflecting: URL.self)) from \(String(reflecting: self))")
        }
        return url
    }
    
}
