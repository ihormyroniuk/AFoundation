//
//  ALocale.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 10/10/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol ALocale {
  
  static var current: ALocale { get }
  
  var language: ALanguage? { get }
  var preferredLanguages: [ALanguage] { get }
  var country: ACountry? { get }
  var currency: ACurrency? { get }
  
}
