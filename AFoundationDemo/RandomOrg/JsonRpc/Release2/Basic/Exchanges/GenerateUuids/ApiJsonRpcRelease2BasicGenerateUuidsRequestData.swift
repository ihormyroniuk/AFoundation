import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateUuidsRequestData {
    
    let id: JsonValue
    let apiKey: String
    let n: UInt
    
    init(id: JsonValue, apiKey: String, n: UInt) {
        self.id = id
        self.apiKey = apiKey
        self.n = n
    }
    
}
}
