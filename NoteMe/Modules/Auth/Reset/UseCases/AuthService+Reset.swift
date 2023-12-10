//
//  AuthService+Reset.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 9.12.23.
//

import UIKit

extension AuthService: ResetAuthServiceUseCase {
    func reset(email: String, completion: @escaping (Bool) -> Void) {
        self.sendResetEmail(email: email, completion: completion)
    }
}
