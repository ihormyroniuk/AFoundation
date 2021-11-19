//
//  UUIDInitString.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 18.11.2021.
//  Copyright © 2021 Ihor Myroniuk. All rights reserved.
//

import Foundation

public extension UUID {
    
    init(_ string: String) throws {
        guard let uuid = UUID(uuidString: string) else {
            throw Error("Cannot initialize \(String(reflecting: UUID.self)) with \(String(reflecting: string))")
        }
        self = uuid
    }
    
}
