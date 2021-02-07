//
//  Uri.swift
//  AFoundation
//
//  Created by Ihor Myroniuk on 03.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

extension URL {
    
    /**
        Implemented based on https://www.iana.org/assignments/uri-schemes/uri-schemes.xhtml
     */
    public enum Scheme {
        
        public static let http = "http"
        public static let https = "https"
        
    }
    
}
