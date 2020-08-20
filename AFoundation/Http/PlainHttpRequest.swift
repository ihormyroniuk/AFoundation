//
//  PlainHttpRequest.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 20.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public struct PlainHttpRequest: HttpRequest {
    public let method: String
    public let requestUri: URL
    public let httpVersion: String
    public let headerFields: [String : String]?
    public let messageBody: Data?
}
