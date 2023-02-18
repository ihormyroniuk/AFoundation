import Foundation
import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateGaussiansParsedResponse {
    
    let id: JsonValue
    let data: [Decimal]
    let completionTime: Date
    let bitsUsed: UInt
    let bitsLeft: UInt
    let requestsLeft: UInt
    let advisoryDelay: UInt
    
}
}
