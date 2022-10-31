import Foundation

public extension Calendar {

    func startOfMonth(for date: Date) -> Date {
        let startOfDay = self.startOfDay(for: date)
        let components = self.dateComponents([.year, .month], from: startOfDay)
        return self.date(from: components)!
    }

    func endOfMonth(for date: Date) -> Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        let startOfMonth = startOfMonth(for: date)
        return self.date(byAdding: components, to: startOfMonth)!
    }

    
}
