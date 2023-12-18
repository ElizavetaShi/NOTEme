//
//  LoginVM.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 10.11.23.
//

import UIKit
import FirebaseAuth

protocol LoginCoordinatorProtocol: AnyObject {
    func finish()
    func openRegisterModule()
    func openResetModule()
}

protocol LoginInputValidatorUseCase {
    
    func validate(email: String?) -> Bool
    func validate(password: String?) -> Bool
}

protocol LoginAuthServiceUseCase {
    
    func login(email: String,
               password: String,
               completion: @escaping (Bool) -> Void)
}

protocol LoginAlertServiceUseCase {
    func showAlert(title: String, message: String, okTitle: String)
}

protocol LoginKeyboardHelperUseCase {
    @discardableResult
    func onWillShow(_ handler: @escaping (CGRect) -> Void) -> Self
    
    @discardableResult
    func onWillHide(_ handler: @escaping (CGRect) -> Void) -> Self
}

final class LoginVM: LoginViewModelProtocol {
    
    var keyboardFrameChanged: ((CGRect) -> Void)?
    
    var catchEmailError: ((String?) -> Void)?
    var catchPasswordError: ((String?) -> Void)?
    
    private weak var coordinator: LoginCoordinatorProtocol?
    
    private let authService: LoginAuthServiceUseCase
    private let inputValidator: LoginInputValidatorUseCase
    private let alertService: LoginAlertServiceUseCase
    private var keyboardHelper: LoginKeyboardHelperUseCase
    
    init(
        keyboardHelper: LoginKeyboardHelperUseCase,
        coordinator: LoginCoordinatorProtocol,
        authService: LoginAuthServiceUseCase,
        inputValidator: LoginInputValidatorUseCase,
        alertService: LoginAlertServiceUseCase) {
            self.authService = authService
            self.inputValidator = inputValidator
            self.coordinator = coordinator
            self.alertService = alertService
            self.keyboardHelper = keyboardHelper
            bind()
        }
    
    private func bind() {
        keyboardHelper.onWillShow { frame in
            self.keyboardFrameChanged?(frame)
        }
        
        keyboardHelper.onWillHide { frame in
            self.keyboardFrameChanged?(frame)
        }
    }
    
    func loginDidTap(email: String?, password: String?) {
        
        guard
            checkValidation(email: email, password: password),
            let email, let password
        else { return }
        
        
        
        authService.login(email: email,
                          password: password) { [weak self] isSuccess in
            print(isSuccess)
            if isSuccess {
                //                FIXME: - uncomment
                ParametersHelper.set(.authenticated, value: true)
                self?.coordinator?.finish()
            } else {
                self?.alertService.showAlert(
                    title: "Error.",
                    message: "Invalid e-mail or password. Please enter correct one.",
                    okTitle: "Ok.")
            }
        }
    }
    
    func newAccountDidTap() {
        print("\(#function)")
        coordinator?.openRegisterModule()
    }
    
    func forgotPasswordDidTap(email: String?) {
        print("\(#function)")
        coordinator?.openResetModule()
    }
    
    private func checkValidation(email: String?, password: String?) -> Bool {
        
        let isEmailValid = inputValidator.validate(email: email)
        let isPasswordValid = inputValidator.validate(password: password)
        
        catchEmailError?(isEmailValid ? nil : "Wrong e-mail")
        catchPasswordError?(isPasswordValid ? nil : "Non-valid password")
        
        return isEmailValid && isPasswordValid
    }
}
