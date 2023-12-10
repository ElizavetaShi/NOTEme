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
                                          authServise: AuthService(),
                                          inputValidator: InputValidator())
        let vc = RegisterVC(presenter: presenter)
        presenter.delegate = vc
        return vc
    }
}
