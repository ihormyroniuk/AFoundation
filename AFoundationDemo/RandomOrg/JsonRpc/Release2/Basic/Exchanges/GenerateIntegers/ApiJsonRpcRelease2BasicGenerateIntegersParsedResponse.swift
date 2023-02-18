import Foundation
import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateIntegersParsedResponse {
    
    let id: JsonValue
    enum Data {
        case binary([String])
        case octal([String])
        case decimal([Int])
        case hexadecimal([String])
    }
    let data: Data
    let completionTime: Date
    let bitsUsed: UInt
    let bitsLeft: UInt
    let requestsLeft: UInt
    let advisoryDelay: UInt
    
}
}
