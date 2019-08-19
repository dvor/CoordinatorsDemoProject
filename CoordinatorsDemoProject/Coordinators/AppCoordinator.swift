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

extension AppCoordinator: LoginCoordinatorDelegate {
    func loginCoordinatorDidLogIn() {
        updateCurrentCoordinator()
    }
}

extension AppCoordinator: RunningCoordinatorDelegate {
    func runningCoordinatorDidLogOut() {
        updateCurrentCoordinator()
    }
}

private extension AppCoordinator {
    func updateCurrentCoordinator() {
        let navigation = UINavigationController()
        window.rootViewController = navigation

        if authService.isLoggedIn() {
            let running = RunningCoordinator(navigation: navigation, authService: authService)
            running.delegate = self

            coordinator = running
        }
        else {
            let login = LoginCoordinator(navigation: navigation, authService: authService)
            login.delegate = self

            coordinator = login
        }

        coordinator.run()
    }
}
