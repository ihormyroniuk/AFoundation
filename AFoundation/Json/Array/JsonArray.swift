//
//  JsonArray.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.09.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public final class JsonArray: Equatable, Hashable {
    public var array: [JsonValueContainer]
    
    public init(array: [JsonValueContainer]) {
        self.array = array
    }
    
    public static func == (lhs: JsonArray, rhs: JsonArray) -> Bool {
        return lhs.array == rhs.array
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(array)
    }
    
    subscript(index: Int) -> JsonValueContainer {
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

