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
private let azerbaijaniCode = "az"

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
    case azerbaijani
    
    // MARK: Initializer
    
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
        default:
            let codeFirstPart = code.split(separator: "-").first
            switch codeFirstPart {
            case .some(russianCode): self = .russian
            case .some(ukrainianCode): self = .ukrainian
            case .some(azerbaijaniCode): self = .azerbaijani
            default: throw Error("Cannot initialize \(String(reflecting: PreferredLanguage.self)) with code \(String(reflecting: code))")
            }
        }
    }
    
}
