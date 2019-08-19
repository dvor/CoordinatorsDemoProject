//
//  RunningCoordinator.swift
//  CoordinatorsDemoProject
//
//  Created by Dmytro Vorobiov on 19/08/2019.
//  Copyright © 2019 Dmytro Vorobiov. All rights reserved.
//

import UIKit

protocol RunningCoordinatorDelegate: class {
    func runningCoordinatorDidLogOut()
}

class RunningCoordinator {
    private let navigation: UINavigationController
    private let authService: AuthenticationService

    weak var delegate: RunningCoordinatorDelegate?

    init(navigation: UINavigationController, authService: AuthenticationService) {
        self.navigation = navigation
        self.authService = authService
    }
}

extension RunningCoordinator: Coordinator {
    func run() {
        let vc = SomeViewController()
        vc.delegate = self
        navigation.pushViewController(vc, animated: false)
    }
}

extension RunningCoordinator: SomeViewControllerDelegate {
    func someVCSettingsSelected() {
        let settingsVC = SettingsViewController()
        settingsVC.delegate = self
        navigation.pushViewController(settingsVC, animated: true)
    }
}

extension RunningCoordinator: SettingsViewControllerDelegate {
    func settingsVCLogOut() {
        authService.logOut()
        delegate?.runningCoordinatorDidLogOut()
    }
}
