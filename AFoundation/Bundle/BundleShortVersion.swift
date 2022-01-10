//
//  File.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 09.01.2022.
//  Copyright © 2022 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension Bundle {
    
    static let shortVersionInfoDictionaryKey = "CFBundleShortVersionString"

    var shortVersion: String? {
        let shortVersion = infoDictionary?[Bundle.shortVersionInfoDictionaryKey] as? String
        return shortVersion
    }
    
}
