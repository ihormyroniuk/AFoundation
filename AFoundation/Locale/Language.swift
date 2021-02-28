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
    
    // MARK: Initializer
    
    init(code: String) throws {
        switch code {
        case englishCode: self = .english
        case russianCode: self = .russian
        case ukrainianCode: self = .ukrainian
        default: throw UnknownCodeError(code: code)
        }
    }
    struct UnknownCodeError: Error, CustomStringConvertible {
        let code: String
        var description: String {
            return "Could not initialize \(Language.self) with code \(String.self) \"\(code)\""
        }
    }
    
    // MARK: Code
    
    var code: String {
        switch self {
        case .english: return englishCode
        case .russian: return russianCode
        case .ukrainian: return ukrainianCode
        }
    }
}
