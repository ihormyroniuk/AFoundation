import XCTest
@testable import AFoundation

class CollectionSubscriptUnitTesting: XCTestCase {
    
    func testEmptySetStrings() {
        let set = Set<String>(["string1", "string2"])
        
        let isNotEmpty = set.isNotEmpty
        
        let expectedIsNotEmpty = true
        XCTAssertTrue(isNotEmpty == expectedIsNotEmpty, "Unexpected isNotEmpty \(isNotEmpty)) is found, but isNotEmpty \(expectedIsNotEmpty) is expected")
    }
    
    func testNotEmptySetStrings() {
        let set = Set<String>([])
        
        let isNotEmpty = set.isNotEmpty
        
        let expectedIsNotEmpty = false
        XCTAssertTrue(isNotEmpty == expectedIsNotEmpty, "Unexpected isNotEmpty \(isNotEmpty)) is found, but isNotEmpty \(expectedIsNotEmpty) is expected")
    }
    
}
