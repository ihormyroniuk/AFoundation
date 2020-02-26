//
//  StringsdictTableNameBundleTextLocalizerUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 1/20/20.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import AFoundation

class StringsdictTableNameBundleTextLocalizerUnitTesting: XCTestCase {

    private lazy var bundle = Bundle(for: self.classForCoder)
    private let stringsdictTableName = "TextLocalizerUnitTestingStringsdict"
    private var textTableNameBundleTextLocalizer: TableNameBundleTextLocalizer {
        let textLocalizer = TableNameBundleTextLocalizer(tableName: stringsdictTableName, bundle: bundle)
        return textLocalizer
    }

    func testSuccessfulTextLocalizationWithOneArgumentOne() {
        let textLocalizer = textTableNameBundleTextLocalizer
        let text = "We have %number% apple(s)."
        let argument1 = 1

        let actualLocalizedText = textLocalizer.localizeText(text, argument1)

        let expectedLocalizedText = "We have 1 apple."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithOneArgumentOther() {
        let textLocalizer = textTableNameBundleTextLocalizer
        let text = "We have %number% apple(s)."
        let argument1 = 11

        let actualLocalizedText = textLocalizer.localizeText(text, argument1)

        let expectedLocalizedText = "We have 11 apples."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOneOne() {
        let textLocalizer = textTableNameBundleTextLocalizer
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 1
        let argument2 = 1

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 1 apple and 1 orange."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOtherOne() {
        let textLocalizer = textTableNameBundleTextLocalizer
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 11
        let argument2 = 1

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 11 apples and 1 orange."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOneOther() {
        let textLocalizer = textTableNameBundleTextLocalizer
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 1
        let argument2 = 11

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 1 apple and 11 oranges."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOtherOther() {
        let textLocalizer = textTableNameBundleTextLocalizer
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 11
        let argument2 = 11

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 11 apples and 11 oranges."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

}
