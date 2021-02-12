//
//  Script.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 31.01.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

private let arabicCode = "Arab"

public enum Script {
    
    case arabic
    
    init(code: String) throws {
        switch code {
        case arabicCode:
            self = .arabic
        default:
            let error = ScriptUnknownCodeError(code: code)
            throw error
        }
    }
    
    // MARK: Code
    
    var code: String {
        switch self {
        case .arabic:
            return arabicCode
        }
    }
    
}

public struct ScriptUnknownCodeError: Error, CustomStringConvertible {
    
    public let code: String
    
    init(code: String) {
        self.code = code
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        return "Could not initialize \(Script.self) with code \(String.self) \"\(code)\""
    }
    
}
