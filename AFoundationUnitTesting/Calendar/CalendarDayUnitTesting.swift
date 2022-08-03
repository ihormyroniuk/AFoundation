//
//  CalendarDayUnitTesting.swift
//  AFoundationUnitTesting
//
//  Created by Ihor Myroniuk on 04.07.2022.
//  Copyright © 2022 Ihor Myroniuk. All rights reserved.
//

import XCTest
@testable import AFoundation

class CalendarDayUnitTesting: XCTestCase {
    
    func testNotNil() {
        let day = Date()
        
        let endOfDay = Calendar.current.endOfDay(for: day)
        print(endOfDay)
    }
    
}
