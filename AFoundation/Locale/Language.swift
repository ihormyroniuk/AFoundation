//
//  AOSLanguage.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 12/20/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

private typealias CodeParts = (part1: String, part2: String?)
private let englishCodePart1 = "en"
private let codesPartsSeparator = "-"
private let englishAustraliaCodePart2 = "AU"
private let englishCanadaCodePart2 = "CA"
private let englishIndiaCodePart2 = "IN"
private let englishIrelandCodePart2 = "IE"
private let englishNewZealandCodePart2 = "NZ"
private let englishSingaporeCodePart2 = "SG"
private let englishSouthAfricaCodePart2 = "ZA"
private let englishUKCodePart2 = "GB"
private let englishUSCodePart2 = "US"
private let russianCodePart1 = "ru"
private let ukrainianCodePart1 = "uk"

public enum Language {
    
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
        let codePart1: String
        let codePart2: String?
        let separator = codesPartsSeparator
        let codeParts = code.components(separatedBy: separator)
        if codeParts.count == 1 {
            codePart1 = code
            codePart2 = nil
        } else if codeParts.count == 2, let codePartsFirst = codeParts.first, let codePartsLast = codeParts.last {
            codePart1 = codePartsFirst
            codePart2 = codePartsLast
        } else {
            let error = LanguageUnknownCodeInitializationError(code: code)
            throw error
        }
        switch codePart1 {
        case englishCodePart1:
            switch codePart2 {
            case englishAustraliaCodePart2:
                self = .englishAustralia
            case englishCanadaCodePart2:
                self = .englishCanada
            case englishIndiaCodePart2:
                self = .englishIndia
            case englishIrelandCodePart2:
                self = .englishIreland
            case englishNewZealandCodePart2:
                self = .englishNewZealand
            case englishSingaporeCodePart2:
                self = .englishSingapore
            case englishSouthAfricaCodePart2:
                self = .englishSouthAfrica
            case englishUKCodePart2:
                self = .englishUK
            case englishUSCodePart2:
                self = .englishUS
            case nil:
                self = .english
            default:
                let error = LanguageUnknownCodeInitializationError(code: code)
                throw error
        }
        case russianCodePart1:
            self = .russian
        case ukrainianCodePart1:
            self = .ukrainian
        default:
            let error = LanguageUnknownCodeInitializationError(code: code)
            throw error
        }
    }
    
    var code: String {
        let part1: String
        let part2: String?
        switch self {
        case .englishAustralia:
            part1 = englishCodePart1
            part2 = englishAustraliaCodePart2
        case .englishCanada:
            part1 = englishCodePart1
            part2 = englishCanadaCodePart2
        case .englishIndia:
            part1 = englishCodePart1
            part2 = englishIndiaCodePart2
        case .englishIreland:
            part1 = englishCodePart1
            part2 = englishIrelandCodePart2
        case .englishNewZealand:
            part1 = englishCodePart1
            part2 = englishNewZealandCodePart2
        case .englishSingapore:
            part1 = englishCodePart1
            part2 = englishSingaporeCodePart2
        case .englishSouthAfrica:
            part1 = englishCodePart1
            part2 = englishSouthAfricaCodePart2
        case .englishUK:
            part1 = englishCodePart1
            part2 = englishUKCodePart2
        case .englishUS:
            part1 = englishCodePart1
            part2 = englishUSCodePart2
        case .english:
            part1 = englishCodePart1
            part2 = nil
        case .russian:
            part1 = russianCodePart1
            part2 = nil
        case .ukrainian:
            part1 = ukrainianCodePart1
            part2 = nil
        }
        let code: String
        if let part2 = part2 {
            let separator = codesPartsSeparator
            code = "\(part1)\(separator)\(part2)"
        } else {
            code = part1
        }
        return code
    }
    
}

public struct LanguageUnknownCodeInitializationError: Error, CustomStringConvertible {
    
    private let code: String
    
    public init(code: String) {
        self.code = code
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        return "\(Language.self) can not be initialized with code \(code)"
    }
    
}
