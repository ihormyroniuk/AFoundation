//
//  MediaTypeUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 05.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class MediaTypeUnitTesting: XCTestCase {

    func testJson() {
        let mediaType = MediaType.json()
        
        let expectedMediaType = "application/json"
        XCTAssertTrue(mediaType == expectedMediaType, "Unexpected media type \"\(String(describing: mediaType))\" is found while media type \"(\(String(describing: expectedMediaType))\" is expected)")
    }
    
}
