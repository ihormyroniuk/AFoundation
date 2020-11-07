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
    
    var httpVersion: String { get }
    var statusCode: Int { get }
    var reasonPhrase: String { get }
    var headerFields: [String: String]? { get }
    var entityBody: Data? { get }
    
}
