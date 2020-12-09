//
//  UnexpectedHttpResponsecode.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct UnexpectedHttpResponseCode: Error, CustomStringConvertible {
    
    public let code: Int
    
    public init(code: Int) {
        self.code = code
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        return ""
    }
    
}
