//
//  AOSLanguagesCodes.swift
//  agroportex-ios-stage
//
//  Created by Ihor Myroniuk on 12/20/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

protocol ALanguagesCodes {
  func codeOfLanguage(_ language: ALanguage) -> String?
  func languageByCode(_ code: String) -> ALanguage?
}
