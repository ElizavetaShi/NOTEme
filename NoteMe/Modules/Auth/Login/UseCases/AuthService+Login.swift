//
//  AuthService+Login.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 5.12.23.
//

import UIKit

extension AuthService: LoginAuthServiceUseCase {
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        self.signIn(email: email, password: password, completion: completion)
    }
}
