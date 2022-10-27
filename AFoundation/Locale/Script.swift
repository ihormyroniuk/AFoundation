import Foundation

private let arabicCode = "Arab"

public enum Script {
    
    case arabic
    
    // MARK: Initializer
    
    init(code: String) throws {
        switch code {
        case arabicCode: self = .arabic
        default: throw Error("Cannot initialize \(String(reflecting: Script.self)) with code \(String(reflecting: code))")
        }
    }
    
    // MARK: Code
    
    var code: String {
        switch self {
        case .arabic: return arabicCode
        }
    }
    
}
