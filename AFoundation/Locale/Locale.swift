//
//  ALocale.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 10/10/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension Locale {
    
    // MARK: Language
  
    func language() throws -> Language? {
        guard let code = languageCode else { return nil }
        let language = try Language(code: code)
        return language
    }
  
    // MARK: Region
  
    func region() throws -> Region? {
        guard let code = regionCode else { return nil }
        let region = try Region(code: code)
        return region
    }
    
    // MARK: Currency
  
    func currency() throws -> Currency? {
        guard let code = currencyCode else { return nil }
        let currency = try? Currency(code: code)
        return currency
    }
    
    // MARK: PreferredLanguages
    
    static func preferredLanguages() throws -> [PreferredLanguage] {
        var preferredLanguages: [PreferredLanguage] = []
        let preferredLanguagesCodes: [String] = Locale.preferredLanguages
        for preferredLanguageCode in preferredLanguagesCodes {
            let preferredLanguage = try PreferredLanguage(code: preferredLanguageCode)
            preferredLanguages.append(preferredLanguage)
        }
        return preferredLanguages
    }
    
}
