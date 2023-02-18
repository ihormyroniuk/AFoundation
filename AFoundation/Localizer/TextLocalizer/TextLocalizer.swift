import Foundation

public protocol TextLocalizer {
    func localizeText(_ text: String, arguments: [CVarArg]) -> String?
}

public extension TextLocalizer {
    func localizeText(_ text: String, _ arguments: CVarArg...) -> String? {
        return self.localizeText(text, arguments: arguments)
    }
}
