import XCTest
@testable import AFoundation

class DecimalDoubleUnitTesting: XCTestCase {

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
    
    func testDoubleGreaterThanMax() {
        let double = Double.greatestFiniteMagnitude
        let decimal = Decimal(double) + Decimal(double)
        
        let decimalDouble: Double
        do { decimalDouble = try decimal.double() } catch {
            return
        }
        
        XCTFail("Unexpected \(decimalDouble) is returned, but error has to be thrown")
    }
    
    func testDoubleLessThanMin() {
        let double = -Double.greatestFiniteMagnitude
        let decimal = Decimal(double) + Decimal(double)
        
        let decimalDouble: Double
        do { decimalDouble = try decimal.double() } catch {
            return
        }
        
        XCTFail("Unexpected \(decimalDouble) is returned, but error has to be thrown")
    }
    
}
