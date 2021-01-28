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
    
    init(code: String) throws {
        switch code {
        case unitedStatesDollarCode:
            self = .unitedStatesDollar
        case ukrainianHryvniaCode:
            self = .ukrainianHryvnia
        case russianRubleCode:
            self = .russianRuble
        default:
            let error = CurrencyUnknownCodeError(code: code)
            throw error
        }
    }
    
    // MARK: Code
    
    var code: String {
        switch self {
        case .unitedStatesDollar:
            return unitedStatesDollarCode
        case .ukrainianHryvnia:
            return ukrainianHryvniaCode
        case .russianRuble:
            return russianRubleCode
        }
    }
    
}

public struct CurrencyUnknownCodeError: Error, CustomStringConvertible {
    
    private let code: String
    
    public init(code: String) {
        self.code = code
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        return "Code \"\(code)\" is unknown to \(Currency.self)"
    }
    
}
