//
//  LocaleLocaleUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 03.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class LocaleLocaleUnitTesting: XCTestCase {

    func testRussianUkraine() {
        let foundationLocale = Foundation.Locale(identifier: "ru_UA")
        
        let locale = LocaleLocale(locale: foundationLocale)
        let language = locale.language
        let region = locale.region
        let currency = locale.currency
        
        let expectedLanguage = Language.russian
        let expectedRegion = Region.ukraine
        let expectedCurrency = Currency.ukrainianHryvnia
        XCTAssert(language == expectedLanguage, "Locale returned unexpected language \"\(String(describing: language))\" while language \"(\(String(describing: expectedLanguage))\" is expected)")
        XCTAssert(region == expectedRegion, "Locale returned unexpected region \"\(String(describing: region))\" while region \"(\(String(describing: expectedRegion))\" is expected)")
        XCTAssert(currency == expectedCurrency, "Locale returned unexpected currency \"\(String(describing: currency))\" while currency \"(\(String(describing: expectedCurrency))\" is expected)")
    }

}
