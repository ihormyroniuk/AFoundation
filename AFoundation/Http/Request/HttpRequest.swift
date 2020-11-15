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
public protocol HttpRequest {
    
    var method: String { get }
    var uri: URL { get }
    var version: String { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    
}
