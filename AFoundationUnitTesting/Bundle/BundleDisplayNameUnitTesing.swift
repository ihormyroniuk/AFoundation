import XCTest
@testable import AFoundation

class BundleDisplayNameUnitTesing: XCTestCase {
    
    func testNotNil() {
        let bundle = MockBundle()
        bundle.mockInfoDictionary = ["CFBundleDisplayName" : "someDisplayName"]
        
        let displayName = bundle.displayName
        
        XCTAssertTrue(displayName == "someDisplayName", "Unexpected \(String(describing: displayName))) is returned, but someDisplayName is expected")
    }
    
    func testNil() {
        let bundle = MockBundle()
        bundle.mockInfoDictionary = nil
        
        let displayName = bundle.version
        
        XCTAssertNil(displayName, "Unexpected \(String(describing: displayName))) is returned, but nil is expected")
    }
    
}

private class MockBundle: Bundle {
    
    var mockInfoDictionary: [String : Any]?
    override var infoDictionary: [String : Any]? {
        return mockInfoDictionary
    }
    
}
