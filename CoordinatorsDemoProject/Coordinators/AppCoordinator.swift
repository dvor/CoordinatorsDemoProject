//
//  AppCoordinator.swift
//  CoordinatorsDemoProject
//
//  Created by Dmytro Vorobiov on 19/08/2019.
//  Copyright © 2019 Dmytro Vorobiov. All rights reserved.
//

import UIKit

class AppCoordinator {
    private let window = UIWindow(frame:UIScreen.main.bounds)
    private let authService: AuthenticationService = DummyAuthenticationService()
    private var coordinator: Coordinator!
}

extension AppCoordinator: Coordinator {
    func run() {
        updateCurrentCoordinator()
        window.makeKeyAndVisible()
    }
}

private extension AppCoordinator {
    func updateCurrentCoordinator() {
        let navigation = UINavigationController()
        window.rootViewController = navigation

        if authService.isLoggedIn() {
            coordinator = RunningCoordinator(navigation: navigation)
        }
        else {
            coordinator = LoginCoordinator(navigation: navigation, authService: authService)
        }

        coordinator.run()
    }
}
