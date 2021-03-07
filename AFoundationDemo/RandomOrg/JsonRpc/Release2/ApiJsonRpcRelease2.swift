//
//  ApiRelease2.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 05.02.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import AFoundation

extension Api.JsonRpc {
class Release2 {
    
    static let scheme = "https"
    static let host = "api.random.org"
    static let path = "/json-rpc/2/invoke"
    
    lazy var basic = Basic()
}
}
