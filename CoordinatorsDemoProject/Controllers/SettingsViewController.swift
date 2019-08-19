//
//  SettingsViewController.swift
//  CoordinatorsDemoProject
//
//  Created by Dmytro Vorobiov on 20/08/2019.
//  Copyright © 2019 Dmytro Vorobiov. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func settingsVCLogOut()
}

class SettingsViewController: UIViewController {
    private var logOutButton: UIButton!

    weak var delegate: SettingsViewControllerDelegate?

    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .gray

        createSubviews()
        makeConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
    }
}

extension SettingsViewController {
    @objc func logOutButtonPressed() {
        delegate?.settingsVCLogOut()
    }
}

private extension SettingsViewController {
    func createSubviews() {
        logOutButton = UIButton(type: .system)
        logOutButton.setTitle("Log out", for: .normal)
        logOutButton.setTitleColor(.white, for: .normal)
        logOutButton.addTarget(self, action: #selector(SettingsViewController.logOutButtonPressed), for: .touchUpInside)
        view.addSubview(logOutButton)
    }

    func makeConstraints() {
        logOutButton.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view)
        }
    }
}
