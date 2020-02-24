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

    func testSuccessfulTextLocalizationWithOneArgumentOne() {
        let textLocalizer = TableNameBundleTextLocalizer(tableName: stringsdictTableName, bundle: bundle)
        let text = "We have %number% apple(s)."
        let argument1 = 1

        let actualLocalizedText = textLocalizer.localizeText(text, argument1)

        let expectedLocalizedText = "We have 1 apple."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithOneArgumentOther() {
        let textLocalizer = TableNameBundleTextLocalizer(tableName: stringsdictTableName, bundle: bundle)
        let text = "We have %number% apple(s)."
        let argument1 = 11

        let actualLocalizedText = textLocalizer.localizeText(text, argument1)

        let expectedLocalizedText = "We have 11 apples."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOneOne() {
        let textLocalizer = TableNameBundleTextLocalizer(tableName: stringsdictTableName, bundle: bundle)
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 1
        let argument2 = 1

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 1 apple and 1 orange."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOtherOne() {
        let textLocalizer = TableNameBundleTextLocalizer(tableName: stringsdictTableName, bundle: bundle)
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 11
        let argument2 = 1

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 11 apples and 1 orange."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOneOther() {
        let textLocalizer = TableNameBundleTextLocalizer(tableName: stringsdictTableName, bundle: bundle)
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 1
        let argument2 = 11

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 1 apple and 11 oranges."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOtherOther() {
        let textLocalizer = TableNameBundleTextLocalizer(tableName: stringsdictTableName, bundle: bundle)
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 11
        let argument2 = 11

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 11 apples and 11 oranges."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testUnsuccessfulTextLocalizationWithOneArgument() {
        let textLocalizer = TableNameBundleTextLocalizer(tableName: stringsTableName, bundle: bundle)
        let text = "%number% bla(s)"

        let actualLocalizedText = textLocalizer.localizeText(text)

        let expectedLocalizedText: String? = nil
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testUnsuccessfulTextLocalizationWithOneArgument() {
        let textLocalizer = TableNameBundleTextLocalizer(tableName: stringsTableName, bundle: bundle)
        let text = "bla %bla% bla"
        let argument1 = "bla"

        let actualLocalizedText = textLocalizer.localizeText(text, argument1)

        let expectedLocalizedText: String? = nil
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

}
