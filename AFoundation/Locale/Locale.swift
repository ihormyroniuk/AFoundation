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
        do {
            guard let code = languageCode else { return nil }
            let language = try Language(code: code)
            return language
        } catch {
            throw MessageError("Cannot get \(String(reflecting: Language.self)) for \(String(reflecting: Locale.self))(\(String(reflecting: self)))\n\(String(reflecting: error))")
        }
    }
    
    // MARK: Script
  
    func script() throws -> Script? {
        do {
            guard let code = scriptCode else { return nil }
            let script = try Script(code: code)
            return script
        } catch {
            throw MessageError("Cannot get \(String(reflecting: Script.self)) for \(String(reflecting: Locale.self))(\(String(reflecting: self)))\n\(String(reflecting: error))")
        }
    }
  
    // MARK: Region
  
    func region() throws -> Region? {
        do {
            guard let code = regionCode else { return nil }
            let region = try Region(code: code)
            return region
        } catch {
            throw MessageError("Cannot get \(String(reflecting: Region.self)) for \(String(reflecting: Locale.self))(\(String(reflecting: self)))\n\(String(reflecting: error))")
        }
    }
    
    // MARK: Currency
  
    func currency() throws -> Currency? {
        do {
            guard let code = currencyCode else { return nil }
            let currency = try Currency(code: code)
            return currency
        } catch {
            throw MessageError("Cannot get \(String(reflecting: Currency.self)) for \(String(reflecting: Locale.self))(\(String(reflecting: self)))\n\(String(reflecting: error))")
        }
    }
    
    // MARK: PreferredLanguages
    
    static func preferredLanguages() throws -> [PreferredLanguage] {
        do {
            var preferredLanguages: [PreferredLanguage] = []
            let preferredLanguagesCodes: [String] = Locale.preferredLanguages
            for preferredLanguageCode in preferredLanguagesCodes {
                let preferredLanguage = try PreferredLanguage(code: preferredLanguageCode)
                preferredLanguages.append(preferredLanguage)
            }
            return preferredLanguages
        } catch {
            throw MessageError("Cannot get \(String(reflecting: PreferredLanguage.self)) for \(String(reflecting: Locale.self))\n\(String(reflecting: error))")
        }
    }
    
}
