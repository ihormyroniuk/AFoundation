//
//  AOSRegionCodes.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 1/4/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import Foundation

protocol CountriesCodes {
  func codeOfRegion(_ region: Country) -> String?
  func regionByCode(_ code: String) -> Country?
}
