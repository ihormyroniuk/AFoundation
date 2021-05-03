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
        if let url = self.url { return url }
        else { throw MessageError("\(String(reflecting: self)) cannot construct \(String(reflecting: URL.self))") }
    }
    
}
