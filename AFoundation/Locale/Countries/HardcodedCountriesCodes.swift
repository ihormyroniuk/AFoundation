//
//  AOSStandardISO3166Part2.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 1/4/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import Foundation

private let armeniaCode = "AM"
private let russiaCode = "RU"
private let ukraineCode = "UA"

class HardcodedCountriesCodes: CountriesCodes {
  
    // MARK: AOSCountriesCodes
  
    func codeOfRegion(_ region: ACountry) -> String? {
        switch region {
        case .armenia: return armeniaCode
        case .russia: return russiaCode
        case .ukraine: return ukraineCode
        }
    }
  
    func regionByCode(_ code: String) -> ACountry? {
        switch code {
        case armeniaCode: return .armenia
        case russiaCode: return .russia
        case ukraineCode: return .ukraine
        default: return nil
        }
    }
  
}
