import Foundation

/**
    Implemented based on https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPInternational/LanguageandLocaleIDs/LanguageandLocaleIDs.html
 */
public extension Locale {
    
    // MARK: - Initialization
    
    init(language: AFoundation.Language, script: AFoundation.Script?, region: AFoundation.Region?) {
        let languageCode = language.code
        var identifier = languageCode
        if let scriptCode = script?.code { identifier += "-\(scriptCode)" }
        if let regionCode = region?.code { identifier += "_\(regionCode)" }
        self.init(identifier: identifier)
    }
    
    // MARK: - Language
  
    func language() throws -> AFoundation.Language? {
        guard let code = languageCode else { return nil }
        let language: AFoundation.Language
        do { language = try AFoundation.Language(code: code) }
        catch { throw Error("Cannot get \(String(reflecting: AFoundation.Language.self)) for \(String(reflecting: Locale.self))(\(String(reflecting: self)))\n\(String(reflecting: error))") }
        return language
    }
    
    // MARK: - Script
  
    func script() throws -> AFoundation.Script? {
        guard let code = scriptCode else { return nil }
        let script: AFoundation.Script
        do { script = try AFoundation.Script(code: code) }
        catch { throw Error("Cannot get \(String(reflecting: AFoundation.Script.self)) for \(String(reflecting: Locale.self))(\(String(reflecting: self)))\n\(String(reflecting: error))") }
        return script
    }
  
    // MARK: - Region
  
    func region() throws -> AFoundation.Region? {
        guard let code = regionCode else { return nil }
        let region: AFoundation.Region
        do { region = try AFoundation.Region(code: code) }
        catch { throw Error("Cannot get \(String(reflecting: AFoundation.Region.self)) for \(String(reflecting: Locale.self))(\(String(reflecting: self)))\n\(String(reflecting: error))") }
        return region
    }
    
    // MARK: - Currency
  
    func currency() throws -> AFoundation.Currency? {
        guard let code = currencyCode else { return nil }
        let currency: AFoundation.Currency
        do { currency = try AFoundation.Currency(code: code) }
        catch { throw Error("Cannot get \(String(reflecting: AFoundation.Currency.self)) for \(String(reflecting: Locale.self))(\(String(reflecting: self)))\n\(String(reflecting: error))") }
        return currency
    }
    
    // MARK: - PreferredLanguages
    
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
