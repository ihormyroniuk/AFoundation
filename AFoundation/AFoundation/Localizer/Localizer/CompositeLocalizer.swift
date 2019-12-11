//
//  LocalizerComposite.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 11/29/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

open class CompositeLocalizer: Localizer {

    private let textLocalization: TextLocalizer

    public init(textLocalization: TextLocalizer) {
        self.textLocalization = textLocalization
    }

    open func localizeText(_ text: String, arguments: [CVarArg]) -> String? {
        return textLocalization.localizeText(text, arguments: arguments)
    }

}
