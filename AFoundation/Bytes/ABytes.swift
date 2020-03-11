//
//  Bytes.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 9/23/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias ABytes = [UInt8]

public extension ABytes {
    func byte(_ number: Int) -> AByte? {
        if number >= count {
            return nil
        }
        return self[number]
    }
  
    func bytes(_ range: ClosedRange<Int>) -> ABytes? {
        guard range.upperBound >= 0, range.upperBound < count else {
            return nil
        }
        guard range.lowerBound >= 0, range.lowerBound <= range.upperBound else {
            return nil
        }
        return Array(prefix(through: range.upperBound).suffix(from: range.lowerBound))
    }
  
    func bytes(_ range: Range<Int>) -> ABytes? {
        guard range.upperBound >= 0, range.upperBound <= count else {
            return nil
        }
        guard range.lowerBound >= 0, range.lowerBound < range.upperBound else {
            return nil
        }
        return Array(prefix(through: range.upperBound - 1).suffix(from: range.lowerBound))
    }
  
    func bytes(from number: Int) -> ABytes? {
        return bytes(number..<count)
    }
  
    func bytes(from sequenceNumber: Int, number: Int) -> ABytes? {
        return bytes(sequenceNumber..<(sequenceNumber + number))
    }
}

public func +=(left: inout [AByte], right: [AByte]) {
    left.append(contentsOf: right)
}

public func +=(left: inout [AByte], right: AByte) {
    left.append(right)
}
