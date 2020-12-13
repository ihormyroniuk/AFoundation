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
  
    var language: Language? {
        guard let code = languageCode else { return nil }
        let language = try? Language(code: code)
        return language
    }
  
    // MARK: Region
  
    var region: Region? {
        guard let code = regionCode else { return nil }
        let region = try? Region(code: code)
        return region
    }
    
    // MARK: Currency
  
    var currency: Currency? {
        guard let code = currencyCode else { return nil }
        let currency = try? Currency.init(code: code)
        return currency
    }
    
}
