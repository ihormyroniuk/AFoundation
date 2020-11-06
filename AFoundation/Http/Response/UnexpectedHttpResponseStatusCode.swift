//
//  UnexpectedHttpResponseStatusCode.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct UnexpectedHttpResponseStatusCode: Error {
    
    public let statusCode: Int
    
    public init(statusCode: Int) {
        self.statusCode = statusCode
    }
    
}
