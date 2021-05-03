//
//  AOSRegion.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 1/4/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import Foundation

private let armeniaCode = "AM"
private let russiaCode = "RU"
private let ukraineCode = "UA"

public enum Region {
    
    case ukraine
    case armenia
    case russia
    
    // MARK: Initializer
  
    init(code: String) throws {
        switch code {
        case armeniaCode: self = .armenia
        case russiaCode: self = .russia
        case ukraineCode: self = .ukraine
        default: throw MessageError("Cannot initialize \(String(reflecting: Region.self)) with code \(String(reflecting: code))")
        }
    }
    
    // MARK: Code
    
    var code: String {
        switch self {
        case .armenia: return armeniaCode
        case .russia: return russiaCode
        case .ukraine: return ukraineCode
        }
    }
    
}
