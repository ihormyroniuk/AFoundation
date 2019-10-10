//
//  ALocaleLocale.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 10/10/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

open class ALocaleLocale: ALocale {
  
  // MARK: Locale
  
  public let locale: Locale
  
  // MARK: Initializer
  
  public init(locale: Locale) {
    self.locale = locale
  }
  
  // MARK: Current
  
  public static let current: ALocale = ALocaleLocale(locale: Locale.current)
  
  // MARK: Language
  
  open var language: ALanguage? = {
    guard let code = Locale.preferredLanguages.first else { return nil }
    let languagesCodes = AHardcodedLanguagesCodes()
    let language = languagesCodes.languageByCode(code)
    return language
  }()
  
  open var preferredLanguages: [ALanguage] = {
    var preferredLanguages: [ALanguage] = []
    let codes = Locale.preferredLanguages
    let languagesCodes = AHardcodedLanguagesCodes()
    for code in codes {
      guard let language = languagesCodes.languageByCode(code) else { continue }
      preferredLanguages.append(language)
    }
    return preferredLanguages
  }()
  
  // MARK: Country
  
  open var country: ACountry? {
    guard let code = locale.regionCode else { return nil }
    let region = AHardcodedCountriesCodes().regionByCode(code)
    return region
  }
  
  // MARK: Currency
  
  open var currency: ACurrency? {
    guard let code = locale.currencyCode else { return nil }
    let currency = AHardcodedCurrenciesCodes().currencyByCode(code)
    return currency
  }
  
}
