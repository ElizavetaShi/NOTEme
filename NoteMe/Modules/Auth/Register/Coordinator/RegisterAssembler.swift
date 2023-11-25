//
//  RegisterAssembler.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 14.11.23.
//

import UIKit

final class RegisterAssembler {
    
    private init() {}
    
    static func make(coordinator: RegisterCoordinatorProtocol) -> UIViewController {
        let presenter = RegisterPresenter(coordinator: coordinator,
                                          keyboardHelper: KeyboardHelper(),
                                          authServise: TESTAuthService(),
                                          inputValidator: InputValidator())
        let vc = RegisterVC(presenter: presenter)
        presenter.delegate = vc
        return vc
    }
}

private class TESTAuthService: RegisterAuthServiceUseCase {
    func register(email: String, password: String, repeatPassword: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
}
