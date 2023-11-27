//
//  ResetVM.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 19.11.23.
//

import UIKit

protocol ResetCoordinatorProtocol: AnyObject {
    
    func finish()
//    func showResetPasswordAlert()
}

protocol ResetAuthServiceUseCase {
    func reset(email: String, completion: @escaping (Bool) -> Void)
}

protocol ResetInputValidatorUseCase {
    func validate(email: String?) -> Bool
}

final class ResetVM: ResetViewModelProtocol {

    
    var catchEmailError: ((String?) -> Void)?
    
    private let authService: ResetAuthServiceUseCase
    private let inputValidator: ResetInputValidatorUseCase
    
    private weak var coordinator: ResetCoordinatorProtocol?
    
    init(coordinator: ResetCoordinatorProtocol,
        authService: ResetAuthServiceUseCase,
         inputValidator: ResetInputValidatorUseCase) {
        self.authService = authService
        self.inputValidator = inputValidator
        self.coordinator = coordinator
    }
    
    
    func resetButtonDidTap(email: String?) {
        
        guard
            checkValidation(email: email), let email
        else { return }
        
        authService.reset(email: email) { [weak coordinator ] isSuccess in
            print(isSuccess)
//            coordinator?.showResetPasswordAlert()
            coordinator?.finish()
        }
    }
    
    func cancelButtonDidTap() {
        print("\(#function)")
        coordinator?.finish()
    }
    
    private func checkValidation(email: String?) -> Bool {
        
        let isEmailValid = inputValidator.validate(email: email)
        
        catchEmailError?(isEmailValid ? nil : "Wrong e-mail")
        
        return isEmailValid
    }
}
