//
//  TextLocalizerUsingStringsFile.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 11/29/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

open class StringsFileTextLocalizer: TextLocalizer {

    // MARK: Data

    private let stringsFileName: String

    // MARK: Initializer

    public init(stringsFileName: String) {
        self.stringsFileName = stringsFileName
    }

    // MARK: Localizator

    open func localizeText(_ text: String, arguments: [CVarArg]) -> String? {
        let value = "0\(text)"
        let localizedString = NSLocalizedString(text, tableName: stringsFileName, bundle: Bundle.main, value: value, comment: "")
        if localizedString == value { return nil }
        let localizedText = String(format: localizedString, arguments: arguments)
        return localizedText
    }

}
