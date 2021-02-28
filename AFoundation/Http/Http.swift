//
//  Httpswift
//  AFoundation
//
//  Created by Ihor Myroniuk on 02.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import Foundation

/**
    Implemented based on https://tools.ietf.org/html/rfc2616
 */

/**
    Implemented based on https://tools.ietf.org/html/rfc2616#section-3.1
 */
public enum HttpVersion {
    public static let http1dot1 = "HTTP/1.1"
}

public enum HttpHeaderField {
    public static let authorization = "Authorization"
    public static let contentType = "Content-Type"
}
