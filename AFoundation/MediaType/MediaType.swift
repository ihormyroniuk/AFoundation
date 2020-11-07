//
//  MediaType.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 04.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://www.iana.org/assignments/media-types/media-types.xhtml
 */
public enum MediaType {
    
    public static func json() -> String {
        return "application/json"
    }
    
}
