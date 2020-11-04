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
        public static let http1dot0 = "HTTP/1.0"
        public static let http1dot1 = "HTTP/1.1"
    }
    
    public enum Method {
        public static let options = "OPTIONS"
        public static let get = "GET"
        public static let head = "HEAD"
        public static let post = "POST"
        public static let put = "PUT"
        public static let delete = "DELETE"
        public static let trace = "TRACE"
        public static let connect = "CONNECT"
    }
    
    public enum StatusCode {
        public static let ok = 200
        public static let noContent = 204
    }
    
    public enum HeaderField {
        public static let contentType = "Content-Type"
    }
    
}
