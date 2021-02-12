//
//  Json.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.08.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public protocol JsonValue { }

func JsonValueFrom(_ any: Any) -> JsonValue? {
    if let string = any as? String {
        return string
    }
    if let nsString = any as? NSString {
        return nsString as String
    }
    if let decimal = any as? Decimal {
        return decimal
    }
    if let nsNumber = any as? NSNumber, nsNumber !== kCFBooleanTrue, nsNumber !== kCFBooleanFalse {
        return nsNumber.decimalValue
    }
    if let dictionary = any as? [String: Any] {
        var jsonObject = JsonObject()
        for (key, value) in dictionary {
            guard let jsonValue = JsonValueFrom(value) else {
                return nil
            }
            jsonObject[key] = jsonValue
        }
        return jsonObject
    }
    if let array = any as? [Any] {
        var jsonArray = JsonArray()
        for value in array {
            guard let jsonValue = JsonValueFrom(value) else {
                return nil
            }
            jsonArray.append(jsonValue)
        }
        return jsonArray
    }
    if let bool = any as? Bool {
        return bool
    }
    if let nsNull = any as? NSNull {
        return nsNull
    }
    return nil
}
