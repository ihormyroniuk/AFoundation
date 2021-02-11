//
//  AppDelegate.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 09.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import UIKit

typealias Ggg = Api.JsonRpc.Release2

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let urlSession = URLSession.shared
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let requestData = Ggg.Basic.GenerateIntegersRequestData(id: 1, apiKey: "3b887b17-2315-49ae-aa27-ddcddc5ad778", n: 5, min: -10, max: 10, replacement: true, base: .binary)
//        let httpExchange = Ggg.Basic().generateIntegers(requestData: requestData)
//        let dataTask = try! urlSession.httpExchangeDataTask(httpExchange) { (result) in
//
//        }
        
        let requestData = Ggg.Basic.GenerateStringsRequestData(id: "bbb", apiKey: "3b887b17-2315-49ae-aa27-ddcddc5ad778", n: 20, lenght: 3, characters: "abcde", replacement: false)
        let httpExchange = Ggg.Basic().generateStrings(requestData: requestData)
        let dataTask = try! urlSession.httpExchangeDataTask(httpExchange) { (result) in
            
        }
        
        dataTask.resume()
        
        return true
    }

}

