//
//  AOSRegionCodes.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 1/4/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import Foundation

protocol RegionsCodes {
    func codeOfRegion(_ region: Region) -> String?
    func regionByCode(_ code: String) -> Region?
}
