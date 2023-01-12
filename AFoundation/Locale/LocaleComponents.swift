import Foundation

@available(macCatalyst 16, *)
@available(macOS 13, *)
@available(iOS 16, *)
@available(watchOS 9, *)
extension Locale.Components {
    
    // MARK: - Initialization
    
    init(language: AFoundation.Language, script: AFoundation.Script?, region: AFoundation.Region?) {
        let localeLanguageCode = Locale.LanguageCode(language.code)
        let localeScript: Locale.Script?
        if let scriptCode = script?.code {
            localeScript = Locale.Script(scriptCode)
        } else {
            localeScript = nil
        }
        let localeRegion: Locale.Region?
        if let regionCode = region?.code {
            localeRegion = Locale.Region(regionCode)
        } else {
            localeRegion = nil
        }
        self.init(languageCode: localeLanguageCode, script: localeScript, languageRegion: localeRegion)
    }
    
}
