//
//  CompositeTextLocalizer.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 12/5/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

open class AMultipleTextLocalizer: ATextLocalizer {

    // MARK: Data

    private let textLocalizers: [ATextLocalizer]

    // MARK: Initializer

    public init(textLocalizers: [ATextLocalizer]) {
        self.textLocalizers = textLocalizers
    }

    // MARK: Localizator

    open func localizeText(_ text: String, arguments: [CVarArg]) -> String? {
        for textLocalizer in textLocalizers {
            if let localizedText = textLocalizer.localizeText(text, arguments: arguments) {
                return localizedText
            }
        }
        return nil
    }

}
