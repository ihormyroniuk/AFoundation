//
//  MultipleTextLocalizerUnitTestings.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 12/9/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import XCTest
import AFoundation

class StringsTableNameBundleTextLocalizerUnitTesting: XCTestCase {

    private lazy var bundle = Bundle(for: self.classForCoder)
    private let stringsTableName = "TextLocalizerUnitTestingStrings"
    private var textTableNameBundleTextLocalizer: TableNameBundleTextLocalizer {
        let textLocalizer = TableNameBundleTextLocalizer(tableName: stringsTableName, bundle: bundle)
        return textLocalizer
    }

    func testSuccessfulTextLocalizationWithoutArguments() {
        let textLocalizer = textTableNameBundleTextLocalizer
        let text = "We don't have apples."

        let actualLocalizedText = textLocalizer.localizeText(text)

        let expectedLocalizedText = "We don't have apples."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(expectedLocalizedText)]")
    }

    func testSuccessfulTextLocalizationWithOneArgument() {
        let textLocalizer = textTableNameBundleTextLocalizer
        let text = "We have %fruit%."
        let argument1 = "apples"

        let actualLocalizedText = textLocalizer.localizeText(text, argument1)

        let expectedLocalizedText = "We have \(argument1)."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(expectedLocalizedText)]")
    }

    func testSuccessfulTextLocalizationWithTwoArgument() {
        let textLocalizer = textTableNameBundleTextLocalizer
        let text = "We have %fruit% and %fruit%."
        let argument1 = "apples"
        let argument2 = "oranges"

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have \(argument1) and \(argument2)."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(expectedLocalizedText)]")
    }

    func testUnsuccessfulTextLocalizationWithoutArguments() {
        let textLocalizer = textTableNameBundleTextLocalizer
        let text = "bla bla bla"

        let actualLocalizedText = textLocalizer.localizeText(text)

        let expectedLocalizedText: String? = nil
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testUnsuccessfulTextLocalizationWithOneArgument() {
        let textLocalizer = textTableNameBundleTextLocalizer
        let text = "bla %bla% bla"
        let argument1 = "bla"

        let actualLocalizedText = textLocalizer.localizeText(text, argument1)

        let expectedLocalizedText: String? = nil
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }
    
}
