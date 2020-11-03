//
//  ALocale.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 10/10/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol Locale {
  
    // MARK: Language
  
    var language: Language? { get }
  
    // MARK: Region
  
    var region: Region? { get }
  
    // MARK: Currency
  
    var currency: Currency? { get }
  
}
