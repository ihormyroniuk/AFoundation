import Foundation
import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateUuidsParsedResponse {
    
    let id: JsonValue
    let data: [UUID]
    let completionTime: Date
    let bitsUsed: UInt
    let bitsLeft: UInt
    let requestsLeft: UInt
    let advisoryDelay: UInt
    
}
}
