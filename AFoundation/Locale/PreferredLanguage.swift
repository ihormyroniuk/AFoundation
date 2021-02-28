//
//  PrefferedLanguage.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 02.01.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

private let englishAustraliaCode = "en-AU"
private let englishCanadaCode = "en-CA"
private let englishIndiaCode = "en-IN"
private let englishIrelandCode = "en-IE"
private let englishNewZealandCode = "en-NZ"
private let englishSingaporeCode = "en-SG"
private let englishSouthAfricaCode = "en-ZA"
private let englishUKCode = "en-GB"
private let englishUSCode = "en-US"
private let englishCode = "en"
private let russianCode = "ru"
private let ukrainianCode = "uk"

public enum PreferredLanguage {
    
    case english
    case englishAustralia
    case englishCanada
    case englishIndia
    case englishIreland
    case englishNewZealand
    case englishSingapore
    case englishSouthAfrica
    case englishUK
    case englishUS
    case russian
    case ukrainian
    
    init(code: String) throws {
        switch code {
        case englishAustraliaCode: self = .englishAustralia
        case englishCanadaCode: self = .englishCanada
        case englishIndiaCode: self = .englishIndia
        case englishIrelandCode: self = .englishIreland
        case englishNewZealandCode: self = .englishNewZealand
        case englishSingaporeCode: self = .englishSingapore
        case englishSouthAfricaCode: self = .englishSouthAfrica
        case englishUKCode: self = .englishUK
        case englishUSCode: self = .englishUS
        case englishCode: self = .english
        case russianCode: self = .russian
        case ukrainianCode: self = .ukrainian
        default: throw UnknownCodeError(code: code)
        }
    }
    struct UnknownCodeError: Error, CustomStringConvertible {
        let code: String
        public var description: String {
            return "Could not initialize \(PreferredLanguage.self) with code \(String.self) \"\(code)\""
        }
    }
    
    // MARK: Code
    
    var code: String {
        switch self {
        case .englishAustralia: return englishAustraliaCode
        case .englishCanada: return englishCanadaCode
        case .englishIndia: return englishIndiaCode
        case .englishIreland: return englishIrelandCode
        case .englishNewZealand: return englishNewZealandCode
        case .englishSingapore: return englishSingaporeCode
        case .englishSouthAfrica: return englishSouthAfricaCode
        case .englishUK: return englishUKCode
        case .englishUS: return englishUSCode
        case .english: return englishCode
        case .russian: return russianCode
        case .ukrainian: return ukrainianCode
        }
    }
}
