//
//  AFoundationError.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 30.03.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct MessageError: Error, CustomDebugStringConvertible {
    
    private let fileId: StaticString
    private let line: UInt
    private let message: String
    
    public init(fileId: StaticString = #fileID, line: UInt = #line, _ message: String) {
        self.fileId = fileId
        self.line = line
        self.message = message
    }
    
    // MARK: CustomDebugStringConvertible
    
    public var debugDescription: String {
        return "\(fileId):\(String(reflecting: line)) \(message)"
    }
    
}
