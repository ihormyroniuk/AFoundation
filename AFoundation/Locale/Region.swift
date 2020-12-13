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
  
    init(code: String) throws {
        switch code {
        case armeniaCode:
            self = .armenia
        case russiaCode:
            self = .russia
        case ukraineCode:
            self = .ukraine
        default:
            let error = RegionUnknownCodeInitializationError(code: code)
            throw error
        }
    }
    
    var code: String {
        switch self {
        case .armenia:
            return armeniaCode
        case .russia:
            return russiaCode
        case .ukraine:
            return ukraineCode
        }
    }
    
}

public struct RegionUnknownCodeInitializationError: Error, CustomStringConvertible {
    
    private let code: String
    
    public init(code: String) {
        self.code = code
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        return "\(Region.self) can not be initialized with code \(code)"
    }
    
}
