import Foundation

extension Api.JsonRpc.Release2 {
class Basic {
    
    func generateIntegers(requestData: GenerateIntegersRequestData) -> GenerateIntegersHttpExchange {
        let httpExchange = GenerateIntegersHttpExchange(requestData: requestData)
        return httpExchange
    }
    
    func generateDecimalFractions(requestData: GenerateDecimalFractionsRequestData) -> GenerateDecimalFractionsHttpExchange {
        let httpExchange = GenerateDecimalFractionsHttpExchange(requestData: requestData)
        return httpExchange
    }
    
    func generateGaussians(requestData: GenerateGaussiansRequestData) -> GenerateGaussiansHttpExchange {
        let httpExchange = GenerateGaussiansHttpExchange(requestData: requestData)
        return httpExchange
    }
    
    func generateStrings(requestData: GenerateStringsRequestData) -> GenerateStringsHttpExchange {
        let httpExchange = GenerateStringsHttpExchange(requestData: requestData)
        return httpExchange
    }
    
    func generateUuids(requestData: GenerateUuidsRequestData) -> GenerateUuidsHttpExchange {
        let httpExchange = GenerateUuidsHttpExchange(requestData: requestData)
        return httpExchange
    }
    
    func generateUuids(requestData: GenerateBlobsRequestData) -> GenerateBlobsHttpExchange {
        let httpExchange = GenerateBlobsHttpExchange(requestData: requestData)
        return httpExchange
    }
    
}
}
