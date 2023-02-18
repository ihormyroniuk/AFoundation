import XCTest
@testable import AFoundation

class BundleVersionUnitTesing: XCTestCase {
    
    func testNotNil() {
        let bundle = MockBundle()
        bundle.mockInfoDictionary = ["CFBundleVersion" : "1"]
        
        let version = bundle.version
        
        XCTAssertTrue(version == "1", "Unexpected \(String(describing: version))) is returned, but 1 is expected")
    }
    
    func testNil() {
        let bundle = MockBundle()
        bundle.mockInfoDictionary = nil
        
        let version = bundle.version
        
        XCTAssertNil(version, "Unexpected \(String(describing: version))) is returned, but nil is expected")
    }
    
}

private class MockBundle: Bundle {
    
    var mockInfoDictionary: [String : Any]?
    override var infoDictionary: [String : Any]? {
        return mockInfoDictionary
    }
    
}
