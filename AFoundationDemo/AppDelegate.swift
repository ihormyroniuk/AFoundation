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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let locale = Locale.current
        print("------------")
        print(locale.language)
        print(locale.languageCode)
        print(locale.region)
        print(locale.regionCode)
        print(locale.currency)
        print(locale.currencyCode)
        print("------------")
        return true
    }

}

