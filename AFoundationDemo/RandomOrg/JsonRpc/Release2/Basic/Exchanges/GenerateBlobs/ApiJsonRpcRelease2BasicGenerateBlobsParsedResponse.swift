import Foundation
import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateBlobsParsedResponse {
    
    let id: JsonValue
    let data: [String]
    let completionTime: Date
    let bitsUsed: UInt
    let bitsLeft: UInt
    let requestsLeft: UInt
    let advisoryDelay: UInt
    
}
}
