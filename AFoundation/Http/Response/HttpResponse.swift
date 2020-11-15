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
public protocol HttpResponse {
    
    var version: String { get }
    var code: Int { get }
    var phrase: String { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    
}
