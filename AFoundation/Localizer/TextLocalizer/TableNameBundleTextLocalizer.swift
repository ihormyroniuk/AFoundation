//
//  TextLocalizerUsingStringsFile.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 11/29/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

open class TableNameBundleTextLocalizer: TextLocalizer {

    // MARK: Data

    private let tableName: String?
    private let bundle: Bundle

    // MARK: Initializer

    public init(tableName: String? = nil, bundle: Bundle = Bundle.main) {
        self.tableName = tableName
        self.bundle = bundle
    }

    // MARK: Localizator

    open func localizeText(_ text: String, arguments: [CVarArg]) -> String? {
        let value = "0\(text)"
        let localizedString = NSLocalizedString(text, tableName: tableName, bundle: bundle, value: value, comment: "")
        if localizedString == value { return nil }
        let localizedText = String(format: localizedString, arguments: arguments)
        return localizedText
    }

}
