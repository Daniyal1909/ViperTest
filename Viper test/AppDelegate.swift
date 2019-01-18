//
//  AppDelegate.swift
//  Viper test
//
//  Created by Деветов Даниял on 14/01/2019.
//  Copyright © 2019 Деветов Даниял. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        openUserList()
        return true
    }
    
    private func openUserList() {
        window?.rootViewController = UserListAssembly.assembleModule()
        window?.makeKeyAndVisible()
    }
}

