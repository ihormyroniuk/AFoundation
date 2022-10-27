import XCTest
@testable import AFoundation

class RegionUnitTesting: XCTestCase {
    
    // MARK: - Armenia
    
    private let armeniaCode = "AM"

    func testInitArmeniaCode() {
        let code = armeniaCode
        
        let region: Region
        do { region = try Region(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(region == .armenia, "Unexpected region \"\(region))\" is found while region \"(\(Region.armenia))\" is expected")
    }
    
    func testArmeniaCode() {
        let region = Region.armenia
        
        let code = region.code
        
        XCTAssertTrue(code == armeniaCode, "Unexpected code \"\(code))\" is found while code \"(\(armeniaCode))\" is expected")
    }
    
    // MARK: - Ukraine
    
    private let ukraineCode = "UA"

    func testInitUkraineCode() {
        let code = ukraineCode
        
        let region: Region
        do { region = try Region(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(region == .ukraine, "Unexpected region \"\(region))\" is found while region \"(\(Region.armenia))\" is expected")
    }
    
    func testUkraineCode() {
        let region = Region.ukraine
        
        let code = region.code
        
        XCTAssertTrue(code == ukraineCode, "Unexpected code \"\(code))\" is found while code \"(\(ukraineCode))\" is expected")
    }
    
    // MARK: - Russian
    
    private let russiaCode = "RU"

    func testInitRussiaCode() {
        let code = russiaCode
        
        let region: Region
        do { region = try Region(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(region == .russia, "Unexpected region \"\(region))\" is found while region \"(\(Region.russia))\" is expected")
    }
    
    func testRussiaCode() {
        let region = Region.russia
        
        let code = region.code
        
        XCTAssertTrue(code == russiaCode, "Unexpected code \"\(code))\" is found while code \"(\(russiaCode))\" is expected")
    }
    
    // MARK: - Singapore
    
    private let singaporeCode = "SG"

    func testInitSingaporeCode() {
        let code = singaporeCode
        
        let region: Region
        do { region = try Region(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(region == .singapore, "Unexpected region \"\(region))\" is found while region \"(\(Region.singapore))\" is expected")
    }
    
    func testSingaporeCode() {
        let region = Region.singapore
        
        let code = region.code
        
        XCTAssertTrue(code == singaporeCode, "Unexpected code \"\(code))\" is found while code \"(\(singaporeCode))\" is expected")
    }
    
    // MARK: - Thailand
    
    private let thailandCode = "TH"

    func testInitThailandCode() {
        let code = thailandCode
        
        let region: Region
        do { region = try Region(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(region == .thailand, "Unexpected region \"\(region))\" is found while region \"(\(Region.thailand))\" is expected")
    }
    
    func testThailandCode() {
        let region = Region.thailand
        
        let code = region.code
        
        XCTAssertTrue(code == thailandCode, "Unexpected code \"\(code))\" is found while code \"(\(thailandCode))\" is expected")
    }
    
    // MARK: - Unknown Code
    
    func testInitUnknownCode() {
        let code = "UNKNOWNCODE"
        
        let region: Region
        do { region = try Region(code: code) } catch {
            return
        }
        
        XCTFail("Unexpected region \"\(region))\" is found while error has to be thrown")
    }
    
}
