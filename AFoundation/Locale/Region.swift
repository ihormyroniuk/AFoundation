import Foundation

private let armeniaCode = "AM"
private let russiaCode = "RU"
private let ukraineCode = "UA"
private let singaporeCode = "SG"
private let thailandCode = "TH"

public enum Region {
    
    case ukraine
    case armenia
    case russia
    case singapore
    case thailand
    
    // MARK: Initializer
  
    init(code: String) throws {
        switch code {
        case armeniaCode: self = .armenia
        case russiaCode: self = .russia
        case ukraineCode: self = .ukraine
        case singaporeCode: self = .singapore
        case thailandCode: self = .thailand
        default: throw Error("Cannot initialize \(String(reflecting: Region.self)) with code \(String(reflecting: code))")
        }
    }
    
    // MARK: Code
    
    var code: String {
        switch self {
        case .armenia: return armeniaCode
        case .russia: return russiaCode
        case .ukraine: return ukraineCode
        case .singapore: return singaporeCode
        case .thailand: return thailandCode
        }
    }
    
}
