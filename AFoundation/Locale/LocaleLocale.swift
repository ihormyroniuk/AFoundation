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
  
    open var language: Language? = {
        guard let code = Foundation.Locale.preferredLanguages.first else { return nil }
        let languagesCodes = HardcodedLanguagesCodes()
        let language = languagesCodes.languageByCode(code)
        return language
    }()
  
    open var preferredLanguages: [Language] = {
        var preferredLanguages: [Language] = []
        let codes = Foundation.Locale.preferredLanguages
        let languagesCodes = HardcodedLanguagesCodes()
        for code in codes {
            guard let language = languagesCodes.languageByCode(code) else { continue }
            preferredLanguages.append(language)
        }
        return preferredLanguages
    }()
  
    // MARK: Country
  
    open var country: Region? {
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
