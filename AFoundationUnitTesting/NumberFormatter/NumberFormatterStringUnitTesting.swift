import XCTest
@testable import AFoundation

class NumberFormatterStringUnitTesting: XCTestCase {
    
    func testNumber() {
        let number = NSNumber()
        let numberFormatter = NumberFormatter()
        
        _ = numberFormatter.string(number)
    }
    
    func testDecimal() {
        let decimal = Decimal()
        let numberFormatter = NumberFormatter()
        
        _ = numberFormatter.string(decimal)
    }
    
    func testInt() {
        let int = Int()
        let numberFormatter = NumberFormatter()
        
        _ = numberFormatter.string(int)
    }
    
    func testDouble() {
        let double = Double()
        let numberFormatter = NumberFormatter()
        
        _ = numberFormatter.string(double)
    }
    
}
