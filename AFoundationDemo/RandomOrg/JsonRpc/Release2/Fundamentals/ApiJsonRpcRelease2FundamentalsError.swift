//
//  Error.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 18.11.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import AFoundation

extension Api.JsonRpc.Release2.Fundamentals {
struct Error {
    let code: Int
    let message: String
    let data: JsonArray?
}
}
