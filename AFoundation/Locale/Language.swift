//
//  AOSLanguage.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 12/20/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

private let englishCode = "en"
private let russianCode = "ru"
private let ukrainianCode = "uk"

public enum Language {
    
    case english
    case russian
    case ukrainian
    
    init(code: String) throws {
        switch code {
        case englishCode:
            self = .english
        case russianCode:
            self = .russian
        case ukrainianCode:
            self = .ukrainian
        default:
            let error = LanguageUnknownCodeError(code: code)
            throw error
        }
    }
    
    // MARK: Code
    
    var code: String {
        switch self {
        case .english:
            return englishCode
        case .russian:
            return russianCode
        case .ukrainian:
            return ukrainianCode
        }
    }
    
}

public struct LanguageUnknownCodeError: Error, CustomStringConvertible {
    
    private let code: String
    
    public init(code: String) {
        self.code = code
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        return "Code \"\(code)\" is unknown to \(Language.self)"
    }
    
}
