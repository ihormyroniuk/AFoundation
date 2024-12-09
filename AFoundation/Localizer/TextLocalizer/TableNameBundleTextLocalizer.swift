import Foundation

open class TableNameBundleLocaleTextLocalizer: TextLocalizer {

    // MARK: Data

    private let tableName: String
    private let bundle: Bundle
    private let locale: Locale

    // MARK: Initializer

    public init(tableName: String, bundle: Bundle, locale: Locale) {
        self.tableName = tableName
        self.bundle = bundle
        self.locale = locale
    }

    // MARK: Localizator

    open func localizeText(_ text: String, arguments: [CVarArg]) -> String? {
        let value = "______00&&%%{{\(text)}}%%&&00______"
        let localizedString = NSLocalizedString(text, tableName: tableName, bundle: bundle, value: value, comment: "")
        if localizedString == value { return nil }
        let localizedText = String(format: localizedString, locale: locale, arguments: arguments)
        return localizedText
    }

}
