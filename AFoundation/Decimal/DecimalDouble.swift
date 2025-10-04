import Foundation

public extension Decimal {
    
    static let doubleMax = Decimal(Double.greatestFiniteMagnitude)
    static let doubleMin = Decimal(-Double.greatestFiniteMagnitude)
  
    func double() throws -> Double {
        let doubleValue = (self as NSDecimalNumber).doubleValue
        guard doubleValue.isFinite else {
            throw Error("Cannot get \(String(reflecting: Double.self)) for \(String(reflecting: Decimal.self))(\(String(reflecting: self)))")
        }
        return doubleValue
    }
    
}
