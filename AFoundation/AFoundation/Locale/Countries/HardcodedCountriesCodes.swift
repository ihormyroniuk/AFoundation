//
//  AOSStandardISO3166Part2.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 1/4/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import Foundation

class HardcodedCountriesCodes: CountriesCodes {
  
  // MARK: AOSCountriesCodes
  
  private static var armenia: String { return "AM" }
  private static var russia: String { return "RU" }
  private static var ukraine: String { return "UA" }
  
  func codeOfRegion(_ region: Country) -> String? {
    switch region {
    case .armenia: return HardcodedCountriesCodes.armenia
    case .russia: return HardcodedCountriesCodes.russia
    case .ukraine: return HardcodedCountriesCodes.ukraine
    }
  }
  
  func regionByCode(_ code: String) -> Country? {
    switch code {
    case HardcodedCountriesCodes.armenia: return .armenia
    case HardcodedCountriesCodes.russia: return .russia
    case HardcodedCountriesCodes.ukraine: return .ukraine
    default: return nil
    }
  }
  
}
