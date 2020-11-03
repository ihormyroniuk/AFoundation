//
//  ALocaleLocale.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 10/10/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

open class LocaleLocale: Locale {
  
    // MARK: Locale
  
    public let locale: Foundation.Locale
  
    // MARK: Initializer
  
    public init(locale: Foundation.Locale) {
        self.locale = locale
    }
  
    // MARK: Language
  
    open var language: Language? {
        guard let code = locale.languageCode else { return nil }
        let language = HardcodedLanguagesCodes().languageByCode(code)
        return language
    }
  
    // MARK: Region
  
    open var region: Region? {
        guard let code = locale.regionCode else { return nil }
        let region = HardcodedRegionsCodes().regionByCode(code)
        return region
    }
  
    // MARK: Currency
  
    open var currency: Currency? {
        guard let code = locale.currencyCode else { return nil }
        let currency = HardcodedCurrenciesCodes().currencyByCode(code)
        return currency
    }
  
}
