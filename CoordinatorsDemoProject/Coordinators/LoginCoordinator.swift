//
//  LoginCoordinator.swift
//  CoordinatorsDemoProject
//
//  Created by Dmytro Vorobiov on 19/08/2019.
//  Copyright © 2019 Dmytro Vorobiov. All rights reserved.
//

import UIKit

class LoginCoordinator {
    private let navigation: UINavigationController
    private let authService: AuthenticationService

    init(navigation: UINavigationController, authService: AuthenticationService) {
        self.navigation = navigation
        self.authService = authService
    }
}

extension LoginCoordinator: Coordinator {
    func run() {
        let loginVC = LoginViewController(authService: authService)
        self.navigation.pushViewController(loginVC, animated: false)
    }
}
