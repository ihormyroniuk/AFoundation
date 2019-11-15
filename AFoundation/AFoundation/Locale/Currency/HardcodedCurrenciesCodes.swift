//
//  AOSHardcodedCurrenciesCodes.swift
//  AOperatingSystem
//
//  Created by Ihor Myroniuk on 2/26/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

class HardcodedCurrenciesCodes: CurrenciesCodes {
  
  private static var unitedStatesDollar: String { return "USD" }
  private static var ukrainianHryvnia: String { return "UAH" }
  private static var russianRuble: String { return "RUB" }
  
  func codeOfCurrency(_ currency: Currency) -> String? {
    switch currency {
    case .unitedStatesDollar: return HardcodedCurrenciesCodes.unitedStatesDollar
    case .ukrainianHryvnia: return HardcodedCurrenciesCodes.ukrainianHryvnia
    case .russianRuble: return HardcodedCurrenciesCodes.russianRuble
    }
  }
  
  func currencyByCode(_ code: String) -> Currency? {
    switch code {
    case HardcodedCurrenciesCodes.unitedStatesDollar: return .unitedStatesDollar
    case HardcodedCurrenciesCodes.ukrainianHryvnia: return .ukrainianHryvnia
    case HardcodedCurrenciesCodes.russianRuble: return .russianRuble
    default: return nil
    }
  }
}
