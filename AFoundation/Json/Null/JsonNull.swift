//
//  JsonNull.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public class JsonNull: Equatable, Hashable {
    public let null: NSNull = NSNull()
    
    public static func == (lhs: JsonNull, rhs: JsonNull) -> Bool {
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(null)
    }
}
