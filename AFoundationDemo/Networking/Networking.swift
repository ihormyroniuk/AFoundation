import Foundation
import AFoundation

class Networking {
    
    private let urlSession = URLSession.shared
    
    init(randomOrgApiKey: String) {
        self.randomOrgApiKey = randomOrgApiKey
    }
    
    // MARK: RandomOrg
    
    private let randomOrgApiKey: String
    private let randomOrgApiRelease2 = Api.JsonRpc.Release2()
    private var randomOrgApiRelease2Basic: Api.JsonRpc.Release2.Basic {
        return randomOrgApiRelease2.basic
    }
    
    func generateStrings(completionHandler: @escaping (Result<URLSession.HttpExchangeDataTaskResponse<Api.JsonRpc.Release2.Basic.GenerateStringsParsedResponse>, Swift.Error>) -> Void) {
        let requestData = Api.JsonRpc.Release2.Basic.GenerateStringsRequestData(id: .number(Decimal(1)), apiKey: randomOrgApiKey, n: 20, lenght: 3, characters: "abcde", replacement: false)
        let httpExchange = randomOrgApiRelease2Basic.generateStrings(requestData: requestData)
        let dataTask = try! urlSession.httpExchangeDataTask(httpExchange) { (result) in
            print(result)
        }

        dataTask.resume()
    }
    
}
