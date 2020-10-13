//
//  Array+SplitIntoGroups.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 9/27/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension Array {
    
    func chunks(size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
    
}
