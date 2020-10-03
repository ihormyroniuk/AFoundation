//
//  AOSStandardISO3166Part2.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 1/4/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import Foundation

class HardcodedRegionsCodes: RegionsCodes {
    
    private let armeniaCode = "AM"
    private let russiaCode = "RU"
    private let ukraineCode = "UA"
  
    func codeOfRegion(_ region: Region) -> String? {
        switch region {
        case .armenia: return armeniaCode
        case .russia: return russiaCode
        case .ukraine: return ukraineCode
        }
    }
  
    func regionByCode(_ code: String) -> Region? {
        switch code {
        case armeniaCode: return .armenia
        case russiaCode: return .russia
        case ukraineCode: return .ukraine
        default: return nil
        }
    }
  
}
