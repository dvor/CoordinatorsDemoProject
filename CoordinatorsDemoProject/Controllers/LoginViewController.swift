//
//  LoginViewController.swift
//  CoordinatorsDemoProject
//
//  Created by Dmytro Vorobiov on 19/08/2019.
//  Copyright © 2019 Dmytro Vorobiov. All rights reserved.
//

import UIKit
import SnapKit

private struct Constants {
    static let formWidth = 200.0
    static let formOffset: CGFloat = 4.0
}

protocol LoginViewControllerDelegate: class {
    func loginVCDidLogin()
}

class LoginViewController: UIViewController {
    private var stackView: UIStackView!
    private var nameField: UITextField!
    private var passwordField: UITextField!
    private var logInButton: UIButton!

    private let authService: AuthenticationService

    weak var delegate: LoginViewControllerDelegate?

    init(authService: AuthenticationService) {
        self.authService = authService

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white

        createSubviews()
        makeConstraints()
    }
}

extension LoginViewController {
    @objc func loginButtonPressed() {
        guard let name = nameField.text, let password = passwordField.text else {
            showWrongCredentialsAlert()
            return
        }

        authService.logIn(name: name, password: password, completion: { [weak self] in
            self?.delegate?.loginVCDidLogin()
        },
        failure: { [weak self] error in
            self?.showWrongCredentialsAlert()
        })
    }
}

private extension LoginViewController {
    func createSubviews() {
        nameField = UITextField()
        nameField.placeholder = "Name"
        nameField.borderStyle = .line

        passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.borderStyle = .line

        logInButton = UIButton(type: .system)
        logInButton.setTitle("Log in", for: .normal)
        logInButton.addTarget(self, action: #selector(LoginViewController.loginButtonPressed), for: .touchUpInside)

        stackView = UIStackView(arrangedSubviews: [nameField, passwordField, logInButton])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = Constants.formOffset
        view.addSubview(stackView)
    }

    func makeConstraints() {
        stackView.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view)
            $0.width.equalTo(Constants.formWidth)
        }
    }

    func showWrongCredentialsAlert() {
        let alert = UIAlertController(title: "Oops", message: "Wrong credentials", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
