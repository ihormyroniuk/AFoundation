import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateDecimalFractionsRequestData {
    
    let id: JsonValue
    let apiKey: String
    let n: UInt
    let decimalPlaces: UInt
    let replacement: Bool?
    
    init(id: JsonValue, apiKey: String, n: UInt, decimalPlaces: UInt, replacement: Bool?) {
        self.id = id
        self.apiKey = apiKey
        self.n = n
        self.decimalPlaces = decimalPlaces
        self.replacement = replacement
    }
    
}
}
