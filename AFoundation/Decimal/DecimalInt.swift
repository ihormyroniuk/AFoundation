//
//  DecimalInt.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 03.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension Decimal {
  
    var int: Int {
        return (self as NSDecimalNumber).intValue
    }
  
}
