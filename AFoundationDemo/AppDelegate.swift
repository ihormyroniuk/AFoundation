import UIKit
import AFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //let urlSession = URLSession.shared
    
    private let networking = Networking(randomOrgApiKey: "3b887b17-2315-49ae-aa27-ddcddc5ad778")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        do {
            let region = try Locale.current.region()
            print(region!)
            print(Locale.preferredLanguages)
            let preferredLanguages = try Locale.preferredLanguages()
            print(preferredLanguages)
        } catch {
            print(error)
        }
        
//        networking.generateStrings { result in
//
//        }
        
//        var jsonObject = JsonObject()
//        jsonObject.setString("string", for: "key1")
//        jsonObject.setNumber(Decimal(10), for: "key2")
//        let jsonValue = JsonValue(jsonObject)
//        do {
//            let string = try jsonValue.string()
//        } catch {
//            print(String(reflecting: error))
//        }
//
        
        
//        let requestData = Ggg.Basic.GenerateIntegersRequestData(id: .number(1), apiKey: "3b887b17-2315-49ae-aa27-ddcddc5ad778", n: 15, min: -1000000, max: 1000000, replacement: true, base: .hexadecimal)
//        let httpExchange = Ggg.Basic().generateIntegers(requestData: requestData)
//        let dataTask = try! urlSession.httpExchangeDataTask(httpExchange) { (result) in
//            switch result {
//            case .success(let httpExchangeDataTaskResponse):
//                switch httpExchangeDataTaskResponse {
//                case .parsedResponse(let generateIntegersParsedResponse):
//                    print(generateIntegersParsedResponse)
//                case .networkConnectionLost(let error):
//                    print(error)
//                case .notConnectedToInternet(let error):
//                    print(error)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//        dataTask.resume()
        
        
//        let requestData = Ggg.Basic.GenerateDecimalFractionsRequestData(id: .number(1), apiKey: "3b887b17-2315-49ae-aa27-ddcddc5ad778", n: 10, decimalPlaces: 2, replacement: true)
//        let httpExchange = Ggg.Basic().generateDecimalFractions(requestData: requestData)
//        let dataTask = try! urlSession.httpExchangeDataTask(httpExchange) { (result) in
//            switch result {
//            case .success(let httpExchangeDataTaskResponse):
//                switch httpExchangeDataTaskResponse {
//                case .parsedResponse(let generateDecimalFractionsParsedResponse):
//                    print(generateDecimalFractionsParsedResponse)
//                case .networkConnectionLost(let error):
//                    print(error)
//                case .notConnectedToInternet(let error):
//                    print(error)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//        dataTask.resume()
        
//        let requestData = Ggg.Basic.GenerateGaussiansRequestData(id: .number(1), apiKey: "3b887b17-2315-49ae-aa27-ddcddc5ad778", n: 4, mean: Decimal(0), standardDeviation: Decimal(0.5), significantDigits: 8)
//        let httpExchange = Ggg.Basic().generateGaussians(requestData: requestData)
//        let dataTask = try! urlSession.httpExchangeDataTask(httpExchange) { (result) in
//            switch result {
//            case .success(let httpExchangeDataTaskResponse):
//                switch httpExchangeDataTaskResponse {
//                case .parsedResponse(let generateGaussiansParsedResponse):
//                    print(generateGaussiansParsedResponse)
//                case .networkConnectionLost(let error):
//                    print(error)
//                case .notConnectedToInternet(let error):
//                    print(error)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//        dataTask.resume()
        
        
//        let requestData = Ggg.Basic.GenerateStringsRequestData(id: .number(Decimal(1)), apiKey: "3b887b17-2315-49ae-aa27-ddcddc5ad778", n: 20, lenght: 3, characters: "abcde", replacement: false)
//        let httpExchange = Ggg.Basic().generateStrings(requestData: requestData)
//        let dataTask = try! urlSession.httpExchangeDataTask(httpExchange) { (result) in
//            print(result)
//        }
//
//        dataTask.resume()
        
//        let jsonValue1 = String(string: "string1")
//        let jsonValue2 = String(string: "string2")
//        if jsonValue1 == jsonValue2 {
//            print("sfdsf")
//        } else {
//            print("dsfdsf")
//        }
        return true
    }

}

