//
//  MultipleTextLocalizerUnitTestings.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 12/9/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class StringsTableNameBundleTextLocalizerUnitTesting: XCTestCase {

    private lazy var bundle = Bundle(for: self.classForCoder)
    private let stringsTableName = "TextLocalizerUnitTestingStrings"
    private var stringsTableNameBundleTextLocalizer: TableNameBundleTextLocalizer {
        let textLocalizer = TableNameBundleTextLocalizer(tableName: stringsTableName, bundle: bundle)
        return textLocalizer
    }
    private let stringsdictTableName = "TextLocalizerUnitTestingStringsdict"
    private var stringsdictTableNameBundleTextLocalizer: TableNameBundleTextLocalizer {
        let textLocalizer = TableNameBundleTextLocalizer(tableName: stringsdictTableName, bundle: bundle)
        return textLocalizer
    }

    func testSuccessfulTextLocalizationWithoutArguments() {
        let textLocalizer = stringsTableNameBundleTextLocalizer
        let text = "We don't have apples."

        let actualLocalizedText = textLocalizer.localizeText(text)

        let expectedLocalizedText = "We don't have apples."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(expectedLocalizedText)]")
    }

    func testSuccessfulTextLocalizationWithOneArgument() {
        let textLocalizer = stringsTableNameBundleTextLocalizer
        let text = "We have %fruit%."
        let argument1 = "apples"

        let actualLocalizedText = textLocalizer.localizeText(text, argument1)

        let expectedLocalizedText = "We have \(argument1)."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(expectedLocalizedText)]")
    }

    func testSuccessfulTextLocalizationWithTwoArgument() {
        let textLocalizer = stringsTableNameBundleTextLocalizer
        let text = "We have %fruit% and %fruit%."
        let argument1 = "apples"
        let argument2 = "oranges"

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have \(argument1) and \(argument2)."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(expectedLocalizedText)]")
    }

    func testUnsuccessfulTextLocalizationWithoutArguments() {
        let textLocalizer = stringsTableNameBundleTextLocalizer
        let text = "bla bla bla"

        let actualLocalizedText = textLocalizer.localizeText(text)

        let expectedLocalizedText: String? = nil
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testUnsuccessfulTextLocalizationWithOneArgument() {
        let textLocalizer = stringsTableNameBundleTextLocalizer
        let text = "bla %bla% bla"
        let argument1 = "bla"

        let actualLocalizedText = textLocalizer.localizeText(text, argument1)

        let expectedLocalizedText: String? = nil
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithOneArgumentOne() {
        let textLocalizer = stringsdictTableNameBundleTextLocalizer
        let text = "We have %number% apple(s)."
        let argument1 = 1

        let actualLocalizedText = textLocalizer.localizeText(text, argument1)

        let expectedLocalizedText = "We have 1 apple."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithOneArgumentOther() {
        let textLocalizer = stringsdictTableNameBundleTextLocalizer
        let text = "We have %number% apple(s)."
        let argument1 = 11

        let actualLocalizedText = textLocalizer.localizeText(text, argument1)

        let expectedLocalizedText = "We have 11 apples."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOneOne() {
        let textLocalizer = stringsdictTableNameBundleTextLocalizer
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 1
        let argument2 = 1

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 1 apple and 1 orange."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOtherOne() {
        let textLocalizer = stringsdictTableNameBundleTextLocalizer
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 11
        let argument2 = 1

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 11 apples and 1 orange."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOneOther() {
        let textLocalizer = stringsdictTableNameBundleTextLocalizer
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 1
        let argument2 = 11

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 1 apple and 11 oranges."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOtherOther() {
        let textLocalizer = stringsdictTableNameBundleTextLocalizer
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 11
        let argument2 = 11

        let actualLocalizedText = textLocalizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 11 apples and 11 oranges."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }
    
}
