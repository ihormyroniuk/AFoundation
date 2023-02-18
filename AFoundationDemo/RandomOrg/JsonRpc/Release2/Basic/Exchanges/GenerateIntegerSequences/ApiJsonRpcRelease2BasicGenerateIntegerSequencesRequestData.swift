import AFoundation

extension Api.JsonRpc.Release2.Basic {
struct GenerateIntegerSequencesRequestData {
    
    let id: JsonValue
    let apiKey: String
    let n: UInt
    enum Length {
        case integer(UInt)
        case integers([UInt])
    }
    let length: Length
    let min: Int
    let max: Int
    enum Replacement {
        case boolean(Bool)
        case booleans([Bool])
    }
    let replacement: Replacement?
    enum Base {
        case binary
        case octal
        case decimal
        case hexadecimal
    }
    let base: Base?
    
    init(id: JsonValue, apiKey: String, n: UInt, length: Length, min: Int, max: Int, replacement: Replacement?, base: Base?) {
        self.id = id
        self.apiKey = apiKey
        self.n = n
        self.length = length
        self.min = min
        self.max = max
        self.replacement = replacement
        self.base = base
    }
    
}
}
