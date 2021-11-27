//
//  ALocale.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 10/10/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPInternational/LanguageandLocaleIDs/LanguageandLocaleIDs.html
 */
public extension Locale {
    
    // MARK: Initializer
    
    init(language: Language, script: Script?, region: Region?) {
        let languageCode = language.code
        var identifier = languageCode
        if let scriptCode = script?.code { identifier += "-\(scriptCode)" }
        if let regionCode = region?.code { identifier += "_\(regionCode)" }
        self.init(identifier: identifier)
    }
    
    // MARK: Language
  
    func language() throws -> Language? {
        guard let code = languageCode else { return nil }
        let language: Language
        do { language = try Language(code: code) }
        catch { throw Error("Cannot get \(String(reflecting: Language.self)) for \(String(reflecting: Locale.self))(\(String(reflecting: self)))\n\(String(reflecting: error))") }
        return language
    }
    
    // MARK: Script
  
    func script() throws -> Script? {
        guard let code = scriptCode else { return nil }
        let script: Script
        do { script = try Script(code: code) }
        catch { throw Error("Cannot get \(String(reflecting: Script.self)) for \(String(reflecting: Locale.self))(\(String(reflecting: self)))\n\(String(reflecting: error))") }
        return script
    }
  
    // MARK: Region
  
    func region() throws -> Region? {
        guard let code = regionCode else { return nil }
        let region: Region
        do { region = try Region(code: code) }
        catch { throw Error("Cannot get \(String(reflecting: Region.self)) for \(String(reflecting: Locale.self))(\(String(reflecting: self)))\n\(String(reflecting: error))") }
        return region
    }
    
    // MARK: Currency
  
    func currency() throws -> Currency? {
        guard let code = currencyCode else { return nil }
        let currency: Currency
        do { currency = try Currency(code: code) }
        catch { throw Error("Cannot get \(String(reflecting: Currency.self)) for \(String(reflecting: Locale.self))(\(String(reflecting: self)))\n\(String(reflecting: error))") }
        return currency
    }
    
    // MARK: PreferredLanguages
    
    static func preferredLanguages() throws -> [PreferredLanguage] {
        var preferredLanguages: [PreferredLanguage] = []
        let preferredLanguagesCodes: [String] = Locale.preferredLanguages
        for preferredLanguageCode in preferredLanguagesCodes {
            let preferredLanguage: PreferredLanguage
            do { preferredLanguage = try PreferredLanguage(code: preferredLanguageCode) }
            catch { throw Error("Cannot get \(String(reflecting: PreferredLanguage.self)) for \(String(reflecting: Locale.self))\n\(String(reflecting: error))") }
            preferredLanguages.append(preferredLanguage)
        }
        return preferredLanguages
    }
    
}
