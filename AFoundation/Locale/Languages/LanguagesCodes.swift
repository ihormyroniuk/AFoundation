//
//  AOSLanguagesCodes.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 12/20/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

protocol LanguagesCodes {
  func codeOfLanguage(_ language: Language) -> String?
  func languageByCode(_ code: String) -> Language?
}
