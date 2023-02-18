import Foundation
import AFoundation

extension Api.JsonRpc.Release2.Basic {
class HttpExchange<RequestData, ParsedResponse>: RequestDataHttpExchange<RequestData, ParsedResponse> {
    
    let scheme = Api.JsonRpc.Release2.scheme
    let host = Api.JsonRpc.Release2.host
    let path = Api.JsonRpc.Release2.path
    
    func constructUri() throws -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        let uri = try urlComponents.url()
        return uri
    }
    
    var headers: [String: String] = [HttpHeaderField.contentType: MediaType.json]
    
    func constructRequestObject(method: String, params: JsonObject, id: JsonValue) -> JsonObject {
        var jsonObject = JsonObject()
        jsonObject.setString("2.0", for: "jsonrpc")
        jsonObject.setString(method, for: "method")
        jsonObject.setObject(params, for: "params")
        jsonObject["id"] = id
        return jsonObject
    }
    
}
}
