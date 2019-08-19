//
//  AuthenticationService.swift
//  CoordinatorsDemoProject
//
//  Created by Dmytro Vorobiov on 19/08/2019.
//  Copyright © 2019 Dmytro Vorobiov. All rights reserved.
//

import Foundation

enum AuthenticationError: Error {
    case wrongCredentials
}

protocol AuthenticationService: class {
    func isLoggedIn() -> Bool

    func logIn(name: String,
               password: String,
               completion: @escaping (() -> Void),
               failure: @escaping ((AuthenticationError) -> Void))

    func logOut()
}
