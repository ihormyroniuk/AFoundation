//
//  HttpRequest.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 20.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://tools.ietf.org/html/rfc2616#section-5
 */
public protocol HttpRequest: CustomStringConvertible {
    
    var method: String { get }
    var uri: String { get }
    var version: String { get }
    var headers: [String: String]? { get }
    var body: [UInt8]? { get }
    
}

extension HttpRequest {
    
    public var description: String {
        var description = "\(method) \(uri) \(version)\n"
        headers?.forEach({ description += "\($0):\($1)\n" })
        description += "\n"
        body?.forEach({ description += String(repeating: "0", count: $0.leadingZeroBitCount) + String($0, radix: 2) })
        return description
    }
    
}
