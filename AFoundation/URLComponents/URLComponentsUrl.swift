import Foundation

public extension URLComponents {
    
    func url() throws -> URL {
        guard let url = self.url else {
            throw Error("Cannot get \(String(reflecting: URL.self)) from \(String(reflecting: self))")
        }
        return url
    }
    
}
