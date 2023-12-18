//
//  ResetVM.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 19.11.23.
//

import UIKit
import FirebaseAuth

protocol ResetCoordinatorProtocol: AnyObject {
    func finish()

}

protocol ResetAuthServiceUseCase {
    func reset(email: String, completion: @escaping (Bool) -> Void)
}

protocol ResetInputValidatorUseCase {
    func validate(email: String?) -> Bool
}

protocol ResetAlertServiceUseCase {
    func showResetAlert(title: String, message: String, okTitle: String)
}

final class ResetVM: ResetViewModelProtocol {
    
    var catchEmailError: ((String?) -> Void)?
    
    private let authService: ResetAuthServiceUseCase
    private let inputValidator: ResetInputValidatorUseCase
    private let alertService: ResetAlertServiceUseCase
    
    private weak var coordinator: ResetCoordinatorProtocol?
    
    init(coordinator: ResetCoordinatorProtocol,
         authService: ResetAuthServiceUseCase,
         inputValidator: ResetInputValidatorUseCase,
         alertService: ResetAlertServiceUseCase) {
        self.authService = authService
        self.inputValidator = inputValidator
        self.coordinator = coordinator
        self.alertService = alertService
    }
    
    func resetButtonDidTap(email: String?) {
        
        guard
            checkValidation(email: email), let email
        else { return }
        
        authService.reset(email: email) { [weak self] isSuccess in
            print(isSuccess)
            if isSuccess {
                self?.coordinator?.finish()
            } else {
                self?.alertService.showResetAlert(title: "Error",
                                            message: "E-mail is invalid.",
                                            okTitle: "Ok")
            }
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
