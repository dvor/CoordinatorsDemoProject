//
//  LoginCoordinator.swift
//  CoordinatorsDemoProject
//
//  Created by Dmytro Vorobiov on 19/08/2019.
//  Copyright © 2019 Dmytro Vorobiov. All rights reserved.
//

import UIKit

protocol LoginCoordinatorDelegate: class {
    func loginCoordinatorDidLogIn()
}

class LoginCoordinator {
    private let navigation: UINavigationController
    private let authService: AuthenticationService

    weak var delegate: LoginCoordinatorDelegate?

    init(navigation: UINavigationController, authService: AuthenticationService) {
        self.navigation = navigation
        self.authService = authService
    }
}

extension LoginCoordinator: Coordinator {
    func run() {
        let loginVC = LoginViewController(authService: authService)
        loginVC.delegate = self
        self.navigation.pushViewController(loginVC, animated: false)
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func loginVCDidLogin() {
        delegate?.loginCoordinatorDidLogIn()
    }
}
