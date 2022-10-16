import Foundation

public extension NumberFormatter {
    
    func string(_ number: NSNumber) -> String {
        let string  = self.string(from: number)
        return string ?? ""
    }
    
    func string(_ decimal: Decimal) -> String {
        let string  = self.string(decimal as NSNumber)
        return string
    }
    
    func string(_ int: Int) -> String {
        let string  = self.string(NSNumber(integerLiteral: int))
        return string
    }
    
}
