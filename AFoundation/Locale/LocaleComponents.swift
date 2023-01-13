//import Foundation
//
//@available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
//public extension Locale.Components {
//    
//    // MARK: - Initialization
//    
//    init(language: AFoundation.Language, script: AFoundation.Script?, region: AFoundation.Region?) {
//        let localeLanguageCode = Locale.LanguageCode(language.code)
//        let localeScript: Locale.Script?
//        if let scriptCode = script?.code {
//            localeScript = Locale.Script(scriptCode)
//        } else {
//            localeScript = nil
//        }
//        let localeRegion: Locale.Region?
//        if let regionCode = region?.code {
//            localeRegion = Locale.Region(regionCode)
//        } else {
//            localeRegion = nil
//        }
//        self.init(languageCode: localeLanguageCode, script: localeScript, languageRegion: localeRegion)
//    }
//    
//}
