//
//  URLComponentsConstructUrlUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 13.11.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import XCTest
import Foundation
@testable import AFoundation

class URLComponentsConstructUrlUnitTesting: XCTestCase {

    func testError() {
        var urlComponents = URLComponents()
        urlComponents.host = "localhost"
        urlComponents.path = "path"
        
        do {
            let url = try urlComponents.constructUrl()
            
            
            XCTFail("Unexpected URL \"\(String(describing: url))\" is found while error \(URLComponentsConstructUrlError.self) has to be thrown")
        } catch _ as URLComponentsConstructUrlError {
            
        } catch {
            XCTFail("Unexpected error \(error) is thrown")
        }
    }
    
}
