//
//  AppDelegate.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 09.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import UIKit
import AFoundation

typealias Ggg = Api.JsonRpc.Release2

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let urlSession = URLSession.shared
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let requestData = Ggg.Basic.GenerateIntegersRequestData(id: 1, apiKey: "3b887b17-2315-49ae-aa27-ddcddc5ad778", n: 15, min: -1000000, max: 1000000, replacement: true, base: .hexadecimal)
        let httpExchange = Ggg.Basic().generateIntegers(requestData: requestData)
        let dataTask = try! urlSession.httpExchangeDataTask(httpExchange) { (result) in
            print(result)
        }
        dataTask.resume()
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

