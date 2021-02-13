//
//  JsonObjectSerrialization.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 05.05.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension JSONSerialization {
    
    class func json(data: Data) throws -> JsonValue {
        let any: Any
        do { any  = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed]) } catch {
            let error = DataIsNotJsonError(data: data)
            throw error
        }
        guard let jsonValue = JsonValueFrom(any) else {
            let error = DataIsNotJsonError(data: data)
            throw error
        }
        return jsonValue
    }
    
    class func data(jsonValue: JsonValue) throws -> Data {
        let data = try JSONSerialization.data(withJSONObject: jsonValue, options: [.fragmentsAllowed])
        return data
    }
    
}

public struct DataIsNotJsonError: LocalizedError {
    
    private let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
}

public enum JsonSerialization {
    
    public static func jsonValue(data: Data) throws -> JsonValue1 {
        let any: Any
        do { any  = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed]) } catch {
            let error = DataIsNotJsonError(data: data)
            throw error
        }
        guard let jsonValue = JsonValue1.from(any) else {
            let error = DataIsNotJsonError(data: data)
            throw error
        }
        return jsonValue
    }
    
    public static func data(jsonValue: JsonValue1) throws -> Data {
        let data = try JSONSerialization.data(withJSONObject: jsonValue, options: [.fragmentsAllowed])
        return data
    }
    
}
