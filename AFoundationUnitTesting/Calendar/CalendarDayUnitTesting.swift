import XCTest
@testable import AFoundation

class CalendarDayUnitTesting: XCTestCase {
    
    func testNotNil() {
        let day = Date()
        
        let endOfDay = Calendar.current.endOfDay(for: day)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy mm:SS.sss"
        print(dateFormatter.string(from: day))
        print(dateFormatter.string(from: endOfDay))
    }
    
}
