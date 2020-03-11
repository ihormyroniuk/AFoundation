//
//  ALocale.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 10/10/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol ALocale {
  
    // MARK: Current
  
    static var current: ALocale { get }
  
    // MARK: Language
  
    var language: ALanguage? { get }
    var preferredLanguages: [ALanguage] { get }
  
    // MARK: Country
  
    var country: ACountry? { get }
  
    // MARK: Currency
  
    var currency: ACurrency? { get }
  
}
