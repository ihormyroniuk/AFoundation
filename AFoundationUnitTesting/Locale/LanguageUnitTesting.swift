import XCTest
@testable import AFoundation

class LanguageUnitTesting: XCTestCase {
    
    // MARK: English
    
    private let englishCode = "en"

    func testInitEnglishCode() {
        let code = englishCode
        
        let language: Language
        do { language = try Language(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .english, "Unexpected language \"\(language))\" is found while language \"(\(Language.english))\" is expected")
    }
    
    func testEnglishCode() {
        let language = Language.english
        
        let code = language.code
        
        XCTAssertTrue(code == englishCode, "Unexpected code \"\(code))\" is found while code \"(\(englishCode))\" is expected")
    }
    
    // MARK: Russian
    
    private let russianCode = "ru"

    func testInitRussianCode() {
        let code = russianCode
        
        let language: Language
        do { language = try Language(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .russian, "Unexpected language \"\(language))\" is found while language \"(\(Language.russian))\" is expected")
    }
    
    func testRussianCode() {
        let language = Language.russian
        
        let code = language.code
        
        XCTAssertTrue(code == russianCode, "Unexpected code \"\(code))\" is found while code \"(\(russianCode))\" is expected")
    }
    
    // MARK: Ukrainian
    
    private let ukrainianCode = "uk"

    func testInitUkrainianCode() {
        let code = ukrainianCode
        
        let language: Language
        do { language = try Language(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .ukrainian, "Unexpected language \"\(language))\" is found while language \"(\(Language.ukrainian))\" is expected")
    }
    
    func testUkrainianCode() {
        let language = Language.ukrainian
        
        let code = language.code
        
        XCTAssertTrue(code == ukrainianCode, "Unexpected code \"\(code))\" is found while code \"(\(ukrainianCode))\" is expected")
    }
    
    // MARK: Azerbaijani
    
    private let azerbaijaniCode = "az"

    func testInitAzerbaijaniCode() {
        let code = azerbaijaniCode
        
        let language: Language
        do { language = try Language(code: code) } catch {
            XCTFail("Unexpected error \(error.self) is thrown")
            return
        }
        
        XCTAssertTrue(language == .azerbaijani, "Unexpected language \"\(language))\" is found while language \"(\(Language.azerbaijani))\" is expected")
    }
    
    func testAzerbaijaniCode() {
        let language = Language.azerbaijani
        
        let code = language.code
        
        XCTAssertTrue(code == azerbaijaniCode, "Unexpected code \"\(code))\" is found while code \"(\(azerbaijaniCode))\" is expected")
    }
    
    // MARK: Unknown Code
    
    func testInitUnknownCode() {
        let code = "UNKNOWNCODE"
        
        let language: Language
        do { language = try Language(code: code) } catch {
            return
        }
        
        XCTFail("Unexpected language \"\(language))\" is found while error has to be thrown")
    }
    
}
