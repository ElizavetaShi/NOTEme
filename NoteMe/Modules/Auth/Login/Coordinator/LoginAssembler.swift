//
//  LoginAssembler.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 10.11.23.
//

import UIKit

final class LoginAssembler {
    
    private init() {}
    
    static func make(container: Container, coordinator: LoginCoordinatorProtocol) -> UIViewController {
        
        let authService: AuthService = container.resolve()
        let inputValidator: InputValidator = container.resolve()
        let alertService: AlertService = container.resolve()
        let keyboardHelper: KeyboardHelper = container.resolve()
        
        let vm = LoginVM(keyboardHelper: keyboardHelper,
                         coordinator: coordinator,
                         authService: authService,
                         inputValidator: inputValidator,
                         alertService: alertService)
        
        return LoginVC(viewModel: vm, keyboardAnimator: KeyboardAnimation())
    }
}



