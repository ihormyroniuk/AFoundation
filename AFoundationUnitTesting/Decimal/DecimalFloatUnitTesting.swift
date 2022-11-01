import XCTest
@testable import AFoundation

class DecimalFloatUnitTesting: XCTestCase {

    func testFloat() {
        let float = Float(1234567890.87) + Float(66886.96)
        let decimal = Decimal(float)
        
        let decimalFloat: Float
        do { decimalFloat = try decimal.float() } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(decimalFloat == float, "Unexpected \(decimalFloat)) is returned, but \(float) is expected")
    }
    
    func testFloatGreaterThanMax() {
        let float = Float.greatestFiniteMagnitude
        let decimal = Decimal(float) + Decimal(float)
        
        let decimalFloat: Float
        do { decimalFloat = try decimal.float() } catch {
            return
        }
        
        XCTFail("Unexpected \(decimalFloat) is returned, but error has to be thrown")
    }
    
    func testFloatLessThanMin() {
        let float = -Float.greatestFiniteMagnitude
        let decimal = Decimal(float) + Decimal(float)
        
        let decimalFloat: Float
        do { decimalFloat = try decimal.float() } catch {
            return
        }
        
        XCTFail("Unexpected \(decimalFloat) is returned, but error has to be thrown")
    }
    
}
