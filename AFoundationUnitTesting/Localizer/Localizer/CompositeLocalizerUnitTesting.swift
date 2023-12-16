import Foundation
import XCTest
@testable import AFoundation

class CompositeLocalizerUnitTesting: XCTestCase {

    #if SWIFT_PACKAGE
    private lazy var bundle = Bundle.module
    #else
    private lazy var bundle = Bundle(for: Self.self)
    #endif
    private let stringsTableName = "TextLocalizerUnitTestingStrings"
    private let stringsdictTableName = "TextLocalizerUnitTestingStringsdict"
    private var multipleTextLocalizer: MultipleTextLocalizer {
        let stringsTextLocalizer = TableNameBundleTextLocalizer(tableName: stringsTableName, bundle: bundle)
        let stringsdictTextLocalizer = TableNameBundleTextLocalizer(tableName: stringsdictTableName, bundle: bundle)
        let textLocalizer = MultipleTextLocalizer(textLocalizers: [stringsTextLocalizer, stringsdictTextLocalizer])
        return textLocalizer
    }
    private var compositeLocalizer: CompositeLocalizer {
        let compositeLocalizer = CompositeLocalizer(textLocalization: multipleTextLocalizer)
        return compositeLocalizer
    }

    func testSuccessfulTextLocalizationWithoutArguments() {
        let localizer = compositeLocalizer
        let text = "We don't have apples."

        let actualLocalizedText = localizer.localizeText(text)

        let expectedLocalizedText = "We don't have apples."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(expectedLocalizedText)]")
    }

    func testSuccessfulTextLocalizationWithOneArgument() {
        let localizer = compositeLocalizer
        let text = "We have %fruit%."
        let argument1 = "apples"

        let actualLocalizedText = localizer.localizeText(text, argument1)

        let expectedLocalizedText = "We have \(argument1)."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(expectedLocalizedText)]")
    }

    func testSuccessfulTextLocalizationWithTwoArgument() {
        let localizer = compositeLocalizer
        let text = "We have %fruit% and %fruit%."
        let argument1 = "apples"
        let argument2 = "oranges"

        let actualLocalizedText = localizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have \(argument1) and \(argument2)."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(expectedLocalizedText)]")
    }

    func testUnsuccessfulTextLocalizationWithoutArguments() {
        let localizer = compositeLocalizer
        let text = "bla bla bla"

        let actualLocalizedText = localizer.localizeText(text)

        let expectedLocalizedText: String? = nil
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testUnsuccessfulTextLocalizationWithOneArgument() {
        let localizer = compositeLocalizer
        let text = "bla %bla% bla"
        let argument1 = "bla"

        let actualLocalizedText = localizer.localizeText(text, argument1)

        let expectedLocalizedText: String? = nil
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithOneArgumentOne() {
        let localizer = compositeLocalizer
        let text = "We have %number% apple(s)."
        let argument1 = 1

        let actualLocalizedText = localizer.localizeText(text, argument1)

        let expectedLocalizedText = "We have 1 apple."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithOneArgumentOther() {
        let localizer = compositeLocalizer
        let text = "We have %number% apple(s)."
        let argument1 = 11

        let actualLocalizedText = localizer.localizeText(text, argument1)

        let expectedLocalizedText = "We have 11 apples."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOneOne() {
        let localizer = compositeLocalizer
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 1
        let argument2 = 1

        let actualLocalizedText = localizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 1 apple and 1 orange."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOtherOne() {
        let localizer = compositeLocalizer
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 11
        let argument2 = 1

        let actualLocalizedText = localizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 11 apples and 1 orange."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOneOther() {
        let localizer = compositeLocalizer
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 1
        let argument2 = 11

        let actualLocalizedText = localizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 1 apple and 11 oranges."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

    func testSuccessfulTextLocalizationWithTwoArgumentsOtherOther() {
        let localizer = compositeLocalizer
        let text = "We have %number% apple(s) and %number% orange(s)."
        let argument1 = 11
        let argument2 = 11

        let actualLocalizedText = localizer.localizeText(text, argument1, argument2)

        let expectedLocalizedText = "We have 11 apples and 11 oranges."
        XCTAssert(actualLocalizedText == expectedLocalizedText, "Actual localized text [\(String(describing: actualLocalizedText))] is not equal to [\(String(describing: expectedLocalizedText))]")
    }

}
