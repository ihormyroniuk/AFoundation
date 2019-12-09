//
//  TextInternationalization.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 11/27/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol TextLocalizer {
    func localizeText(_ text: String, arguments: [CVarArg]) -> String?
}

public extension TextLocalizer {
    func localizeText(_ text: String, _ arguments: CVarArg...) -> String? {
        return self.localizeText(text, arguments: arguments)
    }
}
