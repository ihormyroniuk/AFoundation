//
//  Bytes.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 9/23/19.
//  Copyright © 2019 Ihor Myroniuk. All rights reserved.
//

import Foundation

public typealias Bytes = [UInt8]

public extension Bytes {
    func byte(_ number: Int) -> Byte? {
        if number >= count {
            return nil
        }
        return self[number]
    }
  
    func bytes(_ range: ClosedRange<Int>) -> Bytes? {
        guard range.upperBound >= 0, range.upperBound < count else {
            return nil
        }
        guard range.lowerBound >= 0, range.lowerBound <= range.upperBound else {
            return nil
        }
        return Array(prefix(through: range.upperBound).suffix(from: range.lowerBound))
    }
  
    func bytes(_ range: Range<Int>) -> Bytes? {
        guard range.upperBound >= 0, range.upperBound <= count else {
            return nil
        }
        guard range.lowerBound >= 0, range.lowerBound < range.upperBound else {
            return nil
        }
        return Array(prefix(through: range.upperBound - 1).suffix(from: range.lowerBound))
    }
  
    func bytes(from number: Int) -> Bytes? {
        return bytes(number..<count)
    }
  
    func bytes(from sequenceNumber: Int, number: Int) -> Bytes? {
        return bytes(sequenceNumber..<(sequenceNumber + number))
    }
}

public func +=(left: inout [Byte], right: [Byte]) {
    left.append(contentsOf: right)
}

public func +=(left: inout [Byte], right: Byte) {
    left.append(right)
}
