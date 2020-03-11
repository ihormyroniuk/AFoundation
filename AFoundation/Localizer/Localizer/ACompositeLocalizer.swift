//
//  LocalizerComposite.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 11/29/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

open class ACompositeLocalizer: ALocalizer {

    private let textLocalization: ATextLocalizer

    public init(textLocalization: ATextLocalizer) {
        self.textLocalization = textLocalization
    }

    open func localizeText(_ text: String, arguments: [CVarArg]) -> String? {
        return textLocalization.localizeText(text, arguments: arguments)
    }

}
