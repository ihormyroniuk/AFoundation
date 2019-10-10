//
//  AOSHardcodedCurrenciesCodes.swift
//  AOperatingSystem
//
//  Created by Ihor Myroniuk on 2/26/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

class AHardcodedCurrenciesCodes: ACurrenciesCodes {
  
  private static var unitedStatesDollar: String { return "USD" }
  private static var ukrainianHryvnia: String { return "UAH" }
  private static var russianRuble: String { return "RUB" }
  
  func codeOfCurrency(_ currency: ACurrency) -> String? {
    switch currency {
    case .unitedStatesDollar: return AHardcodedCurrenciesCodes.unitedStatesDollar
    case .ukrainianHryvnia: return AHardcodedCurrenciesCodes.ukrainianHryvnia
    case .russianRuble: return AHardcodedCurrenciesCodes.russianRuble
    }
  }
  
  func currencyByCode(_ code: String) -> ACurrency? {
    switch code {
    case AHardcodedCurrenciesCodes.unitedStatesDollar: return .unitedStatesDollar
    case AHardcodedCurrenciesCodes.ukrainianHryvnia: return .ukrainianHryvnia
    case AHardcodedCurrenciesCodes.russianRuble: return .russianRuble
    default: return nil
    }
  }
}
