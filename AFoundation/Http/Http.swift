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
    
    /**
        Implemented based on https://tools.ietf.org/html/rfc2616#section-9
     */
    public enum Method {
        public static let get = "GET"
        public static let post = "POST"
        public static let put = "PUT"
        public static let delete = "DELETE"
    }
    
    public enum Code {
        public static let ok = 200
        public static let noContent = 204
        public static let badRequest = 400
    }
    
    public enum HeaderField {
        public static let contentType = "Content-Type"
    }
    
}
