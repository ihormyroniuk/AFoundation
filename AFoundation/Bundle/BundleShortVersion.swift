import Foundation

public extension Bundle {
    
    static let shortVersionInfoDictionaryKey = "CFBundleShortVersionString"

    var shortVersion: String? {
        let shortVersion = infoDictionary?[Bundle.shortVersionInfoDictionaryKey] as? String
        return shortVersion
    }
    
}
