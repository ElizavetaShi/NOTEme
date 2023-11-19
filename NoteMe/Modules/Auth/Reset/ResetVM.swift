//
//  ResetVM.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 19.11.23.
//

import UIKit

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
    
    init(authService: ResetAuthServiceUseCase,
         inputValidator: ResetInputValidatorUseCase) {
        self.authService = authService
        self.inputValidator = inputValidator
    }
    
    
    func resetButtonDidTap(email: String?) {
        
        guard
            checkValidation(email: email), let email
        else { return }
        
        authService.reset(email: email) { isSuccess in
            print(isSuccess)
        }
    }
    
    func cancelButtonDidTap() {
        print("\(#function)")
    }
    
    private func checkValidation(email: String?) -> Bool {
        
        let isEmailValid = inputValidator.validate(email: email)
        
        catchEmailError?(isEmailValid ? nil : "Wrong e-mail")
        
        return isEmailValid
    }
}
