//
//  ALocaleLocale.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 10/10/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct LocaleLocale: Locale {
  
    // MARK: Locale
  
    private let locale: Foundation.Locale
  
    // MARK: Initializer
  
    public init(locale: Foundation.Locale) {
        self.locale = locale
    }
  
    // MARK: Language
  
    public var language: Language? {
        guard let code = locale.languageCode else { return nil }
        let language = HardcodedLanguagesCodes().languageByCode(code)
        return language
    }
  
    // MARK: Region
  
    public var region: Region? {
        guard let code = locale.regionCode else { return nil }
        let region = HardcodedRegionsCodes().regionByCode(code)
        return region
    }
  
    // MARK: Currency
  
    public var currency: Currency? {
        guard let code = locale.currencyCode else { return nil }
        let currency = Currency.byCode(code)
        return currency
    }
  
}
