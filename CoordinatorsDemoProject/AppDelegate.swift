//
//  AppDelegate.swift
//  CoordinatorsDemoProject
//
//  Created by Dmytro Vorobiov on 19/08/2019.
//  Copyright © 2019 Dmytro Vorobiov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var app: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame:UIScreen.main.bounds)

        app = AppCoordinator(window: window)
        app.run()

        return true
    }

}

