//
//  HttpResponse.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 20.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://tools.ietf.org/html/rfc2616#section-6
 */
public protocol HttpResponse: CustomStringConvertible {
    
    var version: String { get }
    var code: Int { get }
    var phrase: String { get }
    var headers: [String: String]? { get }
    var body: [UInt8]? { get }
    
}

extension HttpResponse {
    
    public var description: String {
        var description = "\(version) \(code) \(phrase)\n"
        headers?.forEach({ description += "\($0):\($1)\n" })
        description += "\n"
        body?.forEach({ description += String(repeating: "0", count: $0.leadingZeroBitCount) + String($0, radix: 2) })
        return description
    }
    
}
