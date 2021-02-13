//
//  JsonArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public final class JsonArray: JsonValue {
    public var array: [JsonValue]
    
    public init(array: [JsonValue]) {
        self.array = array
        super.init()
    }
    
    public static func == (lhs: JsonArray, rhs: JsonArray) -> Bool {
        return lhs.array == rhs.array
    }
    
    public override func hash(into hasher: inout Hasher) {
        hasher.combine(array)
    }
    
    subscript(index: Int) -> JsonValue {
        get {
            return array[index]
        }
        set(newValue) {
            array[index] = newValue
        }
    }
    
    public func strings() {
        
    }
}

