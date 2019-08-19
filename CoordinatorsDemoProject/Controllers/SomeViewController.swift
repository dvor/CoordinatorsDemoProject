//
//  SomeViewController.swift
//  CoordinatorsDemoProject
//
//  Created by Dmytro Vorobiov on 20/08/2019.
//  Copyright © 2019 Dmytro Vorobiov. All rights reserved.
//

import UIKit

protocol SomeViewControllerDelegate: class {
    func someVCSettingsSelected()
}

class SomeViewController: UIViewController {
    weak var delegate: SomeViewControllerDelegate?

    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .gray
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Some VC"

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Settings",
            style: .plain,
            target: self,
            action: #selector(SomeViewController.settingsButtonPressed))
    }
}

extension SomeViewController {
    @objc func settingsButtonPressed() {
        delegate?.someVCSettingsSelected()
    }
}

