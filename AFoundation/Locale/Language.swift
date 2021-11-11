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
private let azerbaijaniCode = "az"

public enum Language {
    
    case english
    case russian
    case ukrainian
    case azerbaijani
    
    // MARK: Initializer
    
    init(code: String) throws {
        switch code {
        case englishCode: self = .english
        case russianCode: self = .russian
        case ukrainianCode: self = .ukrainian
        case azerbaijaniCode: self = .azerbaijani
        default: throw MessageError("Cannot initialize \(String(reflecting: Language.self)) with code \(String(reflecting: code))")
        }
    }
    
    // MARK: Code
    
    var code: String {
        switch self {
        case .english: return englishCode
        case .russian: return russianCode
        case .ukrainian: return ukrainianCode
        case .azerbaijani: return azerbaijaniCode
        }
    }
    
}
