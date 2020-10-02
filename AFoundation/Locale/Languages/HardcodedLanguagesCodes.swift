//
//  AOStandardISO639Part1.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 12/20/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

private typealias CodeParts = (part1: String, part2: String)
private let codesPartsSeparator = "-"
private let englishCodePart1 = "en"
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

class HardcodedLanguagesCodes: LanguagesCodes {
  
    func codeOfLanguage(_ language: Language) -> String? {
        let part1: String?
        let part2: String?
        switch language {
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
            guard let countryCode = Locale.current.regionCode else { return nil }
            part2 = countryCode
        case .russian:
            part1 = russianCodePart1
            guard let countryCode = Locale.current.regionCode else { return nil }
            part2 = countryCode
        case .ukrainian:
            part1 = ukrainianCodePart1
            guard let countryCode = Locale.current.regionCode else { return nil }
            part2 = countryCode
        }
        guard let unwrappedPart1 = part1 else { return nil }
        guard let unwrappedPart2 = part2 else { return nil }
        let code = composeCode(part1: unwrappedPart1, part2: unwrappedPart2)
        return code
    }
  
    private func composeCode(part1: String, part2: String) -> String {
        let separator = codesPartsSeparator
        return "\(part1)\(separator)\(part2)"
    }
  
    func languageByCode(_ code: String) -> Language? {
        guard let codeParts = extractCodeParts(code) else { return nil }
        let codePart1 = codeParts.part1
        let codePart2 = codeParts.part2
        switch codePart1 {
        case englishCodePart1:
            switch codePart2 {
            case englishAustraliaCodePart2: return .englishAustralia
            case englishCanadaCodePart2: return .englishCanada
            case englishIndiaCodePart2: return .englishIndia
            case englishIrelandCodePart2: return .englishIreland
            case englishNewZealandCodePart2: return .englishNewZealand
            case englishSingaporeCodePart2: return .englishSingapore
            case englishSouthAfricaCodePart2: return .englishSouthAfrica
            case englishUKCodePart2: return .englishUK
            case englishUSCodePart2: return .englishUS
            default: return .english
        }
        case russianCodePart1: return .russian
        case ukrainianCodePart1: return .ukrainian
        default: return nil
        }
    }
  
    private func extractCodeParts(_ code: String) -> CodeParts? {
        let separator = codesPartsSeparator
        let codeParts = code.components(separatedBy: separator)
        guard codeParts.count == 2 else { return nil }
        guard let codePart1 = codeParts.first, codePart1.count == 2 else { return nil }
        guard let codePart2 = codeParts.last, codePart2.count == 2 else { return nil }
        return (part1: codePart1, part2: codePart2)
    }
  
}
