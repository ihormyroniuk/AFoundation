import XCTest
@testable import AFoundation

class CollectionEmptyUnitTesting: XCTestCase {
    
    func testArrayNil() {
        let array = ["string1", "string2"]
        
        let value = array[safe: 9]
        
        XCTAssertNil(value, "Unexpected value \(String(describing: value))) is found, but nil is expected")
    }
    
    func testArrayNotNil() {
        let array = ["string1", "string2"]
        
        let value = array[safe: 1]
                
        let expectedValue = "string2"
        XCTAssertTrue(value == expectedValue, "Unexpected value \(String(describing: value))) is found, but value \(expectedValue) is expected")
    }
    
}
