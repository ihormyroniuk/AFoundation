//
//  AFoundationError.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 30.03.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

struct AFoundationError: Error, CustomDebugStringConvertible {
    
    private let fileId: StaticString
    private let line: UInt
    private let message: String
    
    init(fileId: StaticString = #fileID, line: UInt = #line, _ message: String) {
        self.fileId = fileId
        self.line = line
        self.message = message
    }
    
    // MARK: CustomDebugStringConvertible
    
    var debugDescription: String {
        return "\(fileId):\(String(reflecting: line)) \(message)"
    }
    
}
