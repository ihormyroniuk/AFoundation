//
//  AOStandardISO639Part1.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 12/20/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

class HardcodedLanguagesCodes: LanguagesCodes {
  
  // MARK: AOSLanguagesCodes
  
  private typealias CodeParts = (part1: String, part2: String)
  private static var codesPartsSeparator = "-"
  private static var englishCodePart1: String { return "en" }
  private static var englishAustraliaCodePart2: String { return "AU" }
  private static var englishCanadaCodePart2: String { return "CA" }
  private static var englishIndiaCodePart2: String { return "IN" }
  private static var englishIrelandCodePart2: String { return "IE" }
  private static var englishNewZealandCodePart2: String { return "NZ" }
  private static var englishSingaporeCodePart2: String { return "SG" }
  private static var englishSouthAfricaCodePart2: String { return "ZA" }
  private static var englishUKCodePart2: String { return "GB" }
  private static var englishUSCodePart2: String { return "US" }
  private static var russianCodePart1: String { return "ru" }
  private static var ukrainianCodePart1: String { return "uk" }
  
  func codeOfLanguage(_ language: Language) -> String? {
    let part1: String?
    let part2: String?
    switch language {
    case .englishAustralia:
      part1 = HardcodedLanguagesCodes.englishCodePart1
      part2 = HardcodedLanguagesCodes.englishAustraliaCodePart2
    case .englishCanada:
      part1 = HardcodedLanguagesCodes.englishCodePart1
      part2 = HardcodedLanguagesCodes.englishCanadaCodePart2
    case .englishIndia:
      part1 = HardcodedLanguagesCodes.englishCodePart1
      part2 = HardcodedLanguagesCodes.englishIndiaCodePart2
    case .englishIreland:
      part1 = HardcodedLanguagesCodes.englishCodePart1
      part2 = HardcodedLanguagesCodes.englishIrelandCodePart2
    case .englishNewZealand:
      part1 = HardcodedLanguagesCodes.englishCodePart1
      part2 = HardcodedLanguagesCodes.englishNewZealandCodePart2
    case .englishSingapore:
      part1 = HardcodedLanguagesCodes.englishCodePart1
      part2 = HardcodedLanguagesCodes.englishSingaporeCodePart2
    case .englishSouthAfrica:
      part1 = HardcodedLanguagesCodes.englishCodePart1
      part2 = HardcodedLanguagesCodes.englishSouthAfricaCodePart2
    case .englishUK:
      part1 = HardcodedLanguagesCodes.englishCodePart1
      part2 = HardcodedLanguagesCodes.englishUKCodePart2
    case .englishUS:
      part1 = HardcodedLanguagesCodes.englishCodePart1
      part2 = HardcodedLanguagesCodes.englishUSCodePart2
    default :
      switch language {
      case .english:
        part1 = HardcodedLanguagesCodes.englishCodePart1
      case .russian:
        part1 = HardcodedLanguagesCodes.russianCodePart1
      case .ukrainian:
        part1 = HardcodedLanguagesCodes.ukrainianCodePart1
      default: return nil
      }
      guard let countryCode = Locale.current.regionCode else { return nil }
      part2 = countryCode
    }
    guard let unwrappedPart1 = part1 else { return nil }
    guard let unwrappedPart2 = part2 else { return nil }
    let code = composeCode(part1: unwrappedPart1, part2: unwrappedPart2)
    return code
  }
  
  private func composeCode(part1: String, part2: String) -> String {
    let separator = HardcodedLanguagesCodes.codesPartsSeparator
    return "\(part1)\(separator)\(part2)"
  }
  
  func languageByCode(_ code: String) -> Language? {
    guard let codeParts = extractCodeParts(code) else { return nil }
    let codePart1 = codeParts.part1
    let codePart2 = codeParts.part2
    switch codePart1 {
    case HardcodedLanguagesCodes.englishCodePart1:
      switch codePart2 {
      case HardcodedLanguagesCodes.englishAustraliaCodePart2: return .englishAustralia
      case HardcodedLanguagesCodes.englishCanadaCodePart2: return .englishCanada
      case HardcodedLanguagesCodes.englishIndiaCodePart2: return .englishIndia
      case HardcodedLanguagesCodes.englishIrelandCodePart2: return .englishIreland
      case HardcodedLanguagesCodes.englishNewZealandCodePart2: return .englishNewZealand
      case HardcodedLanguagesCodes.englishSingaporeCodePart2: return .englishSingapore
      case HardcodedLanguagesCodes.englishSouthAfricaCodePart2: return .englishSouthAfrica
      case HardcodedLanguagesCodes.englishUKCodePart2: return .englishUK
      case HardcodedLanguagesCodes.englishUSCodePart2: return .englishUS
      default: return .english
      }
    case HardcodedLanguagesCodes.russianCodePart1: return .russian
    case HardcodedLanguagesCodes.ukrainianCodePart1: return .ukrainian
    default: return nil
    }
  }
  
  private func extractCodeParts(_ code: String) -> CodeParts? {
    let separator = HardcodedLanguagesCodes.codesPartsSeparator
    let codeParts = code.components(separatedBy: separator)
    guard codeParts.count == 2 else { return nil }
    guard let codePart1 = codeParts.first, codePart1.count == 2 else { return nil }
    guard let codePart2 = codeParts.last, codePart2.count == 2 else { return nil }
    return (part1: codePart1, part2: codePart2)
  }
  
}
