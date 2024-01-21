//
//  RegisterAssembler.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 14.11.23.
//

import UIKit

final class RegisterAssembler {
    
    private init() {}
    
    static func make(container: Container,
                     coordinator: RegisterCoordinatorProtocol) -> UIViewController {
        
        let keyboardHelper: KeyboardHelper = container.resolve()
        let authService: AuthService = container.resolve()
        let inputValidator: InputValidator = container.resolve()
        
        let presenter = RegisterPresenter(coordinator: coordinator,
                                          keyboardHelper: keyboardHelper,
                                          authServise: authService,
                                          inputValidator: inputValidator)
        
        
        let vc = RegisterVC(presenter: presenter, keyboardAnimator: KeyboardAnimation())
        presenter.delegate = vc
        return vc
    }
}
