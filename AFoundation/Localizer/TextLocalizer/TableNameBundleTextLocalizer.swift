import Foundation

open class TableNameBundleTextLocalizer: TextLocalizer {

    // MARK: Data

    private let tableName: String
    private let bundle: Bundle

    // MARK: Initializer

    public init(tableName: String, bundle: Bundle) {
        self.tableName = tableName
        self.bundle = bundle
    }

    // MARK: Localizator

    open func localizeText(_ text: String, arguments: [CVarArg]) -> String? {
        let value = "______00&&%%{{\(text)}}%%&&00______"
        let localizedString = NSLocalizedString(text, tableName: tableName, bundle: bundle, value: value, comment: "")
        if localizedString == value { return nil }
        let localizedText = String(format: localizedString, arguments: arguments)
        return localizedText
    }

}
