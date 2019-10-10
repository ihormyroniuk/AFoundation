//
//  AOSStandardISO3166Part2.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 1/4/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import Foundation

class AHardcodedCountriesCodes: ACountriesCodes {
  
  // MARK: AOSCountriesCodes
  
  private static var armenia: String { return "AM" }
  private static var russia: String { return "RU" }
  private static var ukraine: String { return "UA" }
  
  func codeOfRegion(_ region: ACountry) -> String? {
    switch region {
    case .armenia: return AHardcodedCountriesCodes.armenia
    case .russia: return AHardcodedCountriesCodes.russia
    case .ukraine: return AHardcodedCountriesCodes.ukraine
    }
  }
  
  func regionByCode(_ code: String) -> ACountry? {
    switch code {
    case AHardcodedCountriesCodes.armenia: return .armenia
    case AHardcodedCountriesCodes.russia: return .russia
    case AHardcodedCountriesCodes.ukraine: return .ukraine
    default: return nil
    }
  }
  
}
