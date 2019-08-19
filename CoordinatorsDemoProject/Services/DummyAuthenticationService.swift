//
//  DummyAuthenticationService.swift
//  CoordinatorsDemoProject
//
//  Created by Dmytro Vorobiov on 19/08/2019.
//  Copyright © 2019 Dmytro Vorobiov. All rights reserved.
//

import Foundation

class DummyAuthenticationService {
    private struct Keys {
        static let dummyLoggedInKey = "dummyLoggedInKey"
    }
}

extension DummyAuthenticationService: AuthenticationService {
    func isLoggedIn() -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: Keys.dummyLoggedInKey)
    }

    func logIn(userName: String,
               password: String,
               completion: @escaping (() -> Void),
               failure: @escaping ((AuthenticationError) -> Void)) {

        if userName == "test" && password == "123" {
            let defaults = UserDefaults.standard
            defaults.set(true, forKey: Keys.dummyLoggedInKey)
            completion()

            return
        }

        failure(AuthenticationError.wrongCredentials)
    }

    func logOut() {
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: Keys.dummyLoggedInKey)
    }
}
