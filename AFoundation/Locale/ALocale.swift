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
  
    var language: Language? { get }
    var preferredLanguages: [Language] { get }
  
    // MARK: Country
  
    var country: Country? { get }
  
    // MARK: Currency
  
    var currency: Currency? { get }
  
}
