//
//  NumberFormatter+Optionals.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 10/4/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension NumberFormatter {
  
  func number(from string: String?) -> NSNumber? {
    guard let string = string else { return nil }
    return number(from: string)
  }
  
}
