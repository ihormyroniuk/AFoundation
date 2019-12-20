//
//  AOSCurrenciesCodes.swift
//  AOperatingSystem
//
//  Created by Ihor Myroniuk on 2/26/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

protocol CurrenciesCodes {
  func codeOfCurrency(_ currency: Currency) -> String?
  func currencyByCode(_ code: String) -> Currency?
}
