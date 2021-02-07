//
//  AppDelegate.swift
//  AFoundationDemo
//
//  Created by Ihor Myroniuk on 09.10.2020.
//  Copyright © 2020 Ihor Myroniuk. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let urlSession = URLSession.shared
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let requestData = Api.Release2.GenerateIntegersRequestData(id: 1, apiKey: "", n: 5, min: -10, max: 10, replacement: true, base: .binary)
        let httpExchange = Api.Release2().generateIntegers(requestData: requestData)
        let dataTask = try! urlSession.httpExchangeDataTask(httpExchange) { (result) in
            
        }
        dataTask.resume()
        
        return true
    }

}

