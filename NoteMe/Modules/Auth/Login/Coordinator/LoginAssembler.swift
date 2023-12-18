//
//  LoginAssembler.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 10.11.23.
//

import UIKit

final class LoginAssembler {
    
    private init() {}
    
    static func make(coordinator: LoginCoordinatorProtocol) -> UIViewController {
        let vm = LoginVM(keyboardHelper: KeyboardHelper(),
                         coordinator: coordinator,
                         authService: AuthService(),
                         inputValidator: InputValidator(),
                         alertService: AlertService.current)
        
        return LoginVC(viewModel: vm, keyboardAnimator: KeyboardAnimation())
    }
}



