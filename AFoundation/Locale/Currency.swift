//
//  AOSCurrency.swift
//  AOperatingSystem
//
//  Created by Ihor Myroniuk on 2/26/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

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
        default: throw UnknownCodeError(code: code)
        }
    }
    struct UnknownCodeError: Error, CustomStringConvertible {
        let code: String
        public var description: String {
            return "Could not initialize \(Currency.self) with code \(String.self) \"\(code)\""
        }
    }
    
    // MARK: Code
    
    var code: String {
        switch self {
        case .unitedStatesDollar: return unitedStatesDollarCode
        case .ukrainianHryvnia: return ukrainianHryvniaCode
        case .russianRuble: return russianRubleCode
        }
    }
}
