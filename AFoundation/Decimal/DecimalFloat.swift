import Foundation

public extension Decimal {
    
    static let floatMax = Decimal(Float.greatestFiniteMagnitude)
    static let floatMin = Decimal(-Float.greatestFiniteMagnitude)
    
    init(_ float: Float) {
        self.init(Double(float))
    }
  
    func float() throws -> Float {
        guard self >= Decimal.floatMin && self <= Decimal.floatMax else {
            throw Error("Cannot get \(String(reflecting: Float.self)) for \(String(reflecting: Decimal.self))(\(String(reflecting: self)))")
        }
        return (self as NSDecimalNumber).floatValue
    }
  
}
