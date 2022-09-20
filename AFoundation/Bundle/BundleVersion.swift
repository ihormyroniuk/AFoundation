import Foundation

public extension Bundle {
    
    static let versionInfoDictionaryKey = "CFBundleVersion"

    var version: String? {
        let version = infoDictionary?[Bundle.versionInfoDictionaryKey] as? String
        return version
    }
    
}
