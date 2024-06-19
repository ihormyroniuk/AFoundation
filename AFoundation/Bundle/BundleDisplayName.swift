import Foundation

public extension Bundle {
    
    static let displayNameInfoDictionaryKey = "CFBundleDisplayName"

    var displayName: String? {
        let version = infoDictionary?[Bundle.displayNameInfoDictionaryKey] as? String
        return version
    }
    
}
