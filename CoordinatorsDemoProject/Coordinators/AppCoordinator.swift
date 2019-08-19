//
//  AppCoordinator.swift
//  CoordinatorsDemoProject
//
//  Created by Dmytro Vorobiov on 19/08/2019.
//  Copyright © 2019 Dmytro Vorobiov. All rights reserved.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    private let authService: AuthenticationService = DummyAuthenticationService()
    private var coordinator: Coordinator!

    init(window: UIWindow) {
        self.window = window
    }
}

extension AppCoordinator: Coordinator {
    func run() {
        if authService.isLoggedIn() {
            coordinator = RunningCoordinator()
        }
        else {
            coordinator = LoginCoordinator()
        }

        coordinator.run()
    }
}

