import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateIntegersRequestData {
    
    let id: JsonValue
    let apiKey: String
    let n: UInt
    let min: Int
    let max: Int
    let replacement: Bool?
    enum Base {
        case binary
        case octal
        case decimal
        case hexadecimal
    }
    let base: Base?
    
    init(id: JsonValue, apiKey: String, n: UInt, min: Int, max: Int, replacement: Bool?, base: Base?) {
        self.id = id
        self.apiKey = apiKey
        self.n = n
        self.min = min
        self.max = max
        self.replacement = replacement
        self.base = base
    }
    
}
}
