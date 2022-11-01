import XCTest
@testable import AFoundation

class DecimalRoundUnitTesting: XCTestCase {
    
    func testRound() {
        let decimal = Decimal(string: "5.83776")
        
        let roundedDecimal = decimal?.rounded(3, .bankers)
        
        let expectedRoundedDecimal = Decimal(string: "5.838")
        XCTAssertTrue(roundedDecimal == expectedRoundedDecimal, "Unexpected \(String(describing: roundedDecimal)) is returned, but \(String(describing: expectedRoundedDecimal)) is expected")
    }
    
    func testRounded() {
        var decimal = Decimal(string: "5.83776")
        
        decimal?.round(3, .bankers)
        
        let expectedDecimal = Decimal(string: "5.838")
        XCTAssertTrue(decimal == expectedDecimal, "Unexpected \(String(describing: decimal)) is returned, but \(String(describing: expectedDecimal)) is expected")
    }
    
}
