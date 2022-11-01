import XCTest
@testable import AFoundation

class DecimalRoundUnitTesting: XCTestCase {
    
    func testDouble() {
        let double = Double(15678907) + Double(66886)
        let decimal = Decimal(double)
        
        let decimalDouble: Double
        do { decimalDouble = try decimal.double() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(decimalDouble == double, "Unexpected \(decimalDouble)) is returned, but \(double) is expected")
    }
    
}
