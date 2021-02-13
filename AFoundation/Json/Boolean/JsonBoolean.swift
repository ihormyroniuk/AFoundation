//
//  JsonBoolean.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 06.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public class JsonBoolean: JsonValue {
    public let bool: Bool
    
    public init(bool: Bool) {
        self.bool = bool
        super.init()
    }
    
    public static func == (lhs: JsonBoolean, rhs: JsonBoolean) -> Bool {
        return lhs.bool == rhs.bool
    }
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(bool)
    }
}
