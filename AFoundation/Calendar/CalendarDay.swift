import Foundation

public extension Calendar {

    func endOfDay(for date: Date) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = 1
        dateComponents.second = -1
        let startOfDay = self.startOfDay(for: date)
        return self.date(byAdding: dateComponents, to: startOfDay)!
    }
    
}
