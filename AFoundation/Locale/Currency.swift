import Foundation

private let unitedStatesDollarCode = "USD"
private let ukrainianHryvniaCode = "UAH"
private let russianRubleCode = "RUB"

public enum Currency {
    
    case unitedStatesDollar
    case ukrainianHryvnia
    case russianRuble
    
    // MARK: Initializer
    
    init(code: String) throws {
        switch code {
        case unitedStatesDollarCode: self = .unitedStatesDollar
        case ukrainianHryvniaCode: self = .ukrainianHryvnia
        case russianRubleCode: self = .russianRuble
        default: throw Error("Cannot initialize \(String(reflecting: Currency.self)) with code \(String(reflecting: code))")
        }
    }
    
}
