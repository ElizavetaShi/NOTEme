//
//  AuthService+Register.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 9.12.23.
//

import UIKit

extension AuthService: RegisterAuthServiceUseCase {
    func register(email: String, password: String, repeatPassword: String, completion: @escaping (Bool) -> Void) {
        self.createUser(email: email, password: password, completion: completion)
    }
}
