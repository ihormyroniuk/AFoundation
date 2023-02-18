import Foundation

public extension UUID {
    
    init(_ string: String) throws {
        guard let uuid = UUID(uuidString: string) else {
            throw Error("Cannot initialize \(String(reflecting: UUID.self)) with \(String(reflecting: string))")
        }
        self = uuid
    }
    
}
