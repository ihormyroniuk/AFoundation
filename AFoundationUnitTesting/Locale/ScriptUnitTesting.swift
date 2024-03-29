import XCTest
@testable import AFoundation

class ScriptUnitTesting: XCTestCase {
    
    // MARK: English
    
    private let arabicCode = "Arab"

    func testInitArabicCode() {
        let code = arabicCode
        
        let script: Script
        do { script = try Script(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(script == .arabic, "Unexpected script \"\(script))\" is found while script \"(\(Script.arabic))\" is expected")
    }
    
    func testArabicCode() {
        let script = Script.arabic
        
        let code = script.code
        
        XCTAssertTrue(code == arabicCode, "Unexpected code \"\(code))\" is found while code \"(\(arabicCode))\" is expected")
    }

    // MARK: Unknown Code
    
    func testInitUnknownCode() {
        let code = "UNKNOWNCODE"
        
        let script: Script
        do { script = try Script(code: code) } catch {
            return
        }
        
        XCTFail("Unexpected script \"\(script))\" is found while error has to be thrown")
    }
    
}
