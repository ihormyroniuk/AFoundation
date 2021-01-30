//
//  HTTP.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 02.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

public enum Http {
    
    public enum Version {
        public static let http1dot1 = "HTTP/1.1"
    }
    
    public enum HeaderField {
        public static let authorization = "Authorization"
        public static let contentType = "Content-Type"
    }
    
}
