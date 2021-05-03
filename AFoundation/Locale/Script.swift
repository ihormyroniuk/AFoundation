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
    
    // MARK: Initializer
    
    init(code: String) throws {
        switch code {
        case arabicCode: self = .arabic
        default: throw MessageError("Cannot initialize \(String(reflecting: Script.self)) with code \(String(reflecting: code))")
        }
    }
    
    // MARK: Code
    
    var code: String {
        switch self {
        case .arabic: return arabicCode
        }
    }
    
}
