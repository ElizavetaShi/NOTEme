//
//  RegisterPresenter.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 14.11.23.
//

import UIKit
import FirebaseAuth

protocol RegisterCoordinatorProtocol: AnyObject {
    
    func finish()
}

protocol RegisterPresenterDelegate: AnyObject {
    
    func setEmailError(error: String?)
    func setPasswordError(error: String?)
    func setRepeatPasswordError(error: String?)
    
    func keyboardFrameChanged(_ frame: CGRect)
    
}

protocol RegisterAuthServiceUseCase {
    func register(email: String,
                  password: String,
                  repeatPassword: String,
                  completion: @escaping (Bool) -> Void)
}

protocol RegisterInputValidatorUseCase {
    
    func validate(email: String?) -> Bool
    func validate(password: String?) -> Bool
}

protocol RegisterKeyboardHelperUseCase {
    @discardableResult
    func onWillShow(_ handler: @escaping (CGRect) -> Void) -> Self
    
    @discardableResult
    func onWillHide(_ handler: @escaping (CGRect) -> Void) -> Self
}

final class RegisterPresenter: RegisterPresenterProtocol {
    
    private enum L10n {
        static let errorEmail: String = "errorEmail_register_label".localized
        static let errorPassword: String = "errorPassword_register_label".localized
        static let errPasswordEqual: String = "errPasswordEqual_register_label".localized
    }
    
    weak var delegate: RegisterPresenterDelegate?
    
    private weak var coordinator: RegisterCoordinatorProtocol?
    
    private let keyboardHelper: RegisterKeyboardHelperUseCase
    private let authServise: RegisterAuthServiceUseCase
    private let inputValidator: RegisterInputValidatorUseCase
    
    init(coordinator: RegisterCoordinatorProtocol,
         keyboardHelper: RegisterKeyboardHelperUseCase,
         authServise: RegisterAuthServiceUseCase,
         inputValidator: RegisterInputValidatorUseCase) {
        self.keyboardHelper = keyboardHelper
        self.authServise = authServise
        self.inputValidator = inputValidator
        self.coordinator = coordinator
        
        bind()
    }
    
    private func bind() {
        
        keyboardHelper.onWillShow { [weak self] frame in
            self?.delegate?.keyboardFrameChanged(frame)
        }.onWillHide { [weak self] frame in
            self?.delegate?.keyboardFrameChanged(frame)
        }
    }
    
    func registerDidTap(email: String?, password: String?, repeatPassword: String?) {
        
        guard
            checkValidation(email: email, password: password, repeatPassword: repeatPassword),
            let email, let password, let repeatPassword
        else { return }
        
        authServise.register(email: email,
                             password: password,
                             repeatPassword: repeatPassword) { [weak coordinator] isSuccess in
            print(isSuccess)
            coordinator?.finish()
        }
    }
    
    func haveAccountDidTap() {
        coordinator?.finish()
    }
    
    private func checkValidation(email: String?, password: String?, repeatPassword: String?) -> Bool {
        
        let isEmailValid = inputValidator.validate(email: email)
        let isPasswordValid = inputValidator.validate(password: password)
        
        delegate?.setEmailError(error: isEmailValid ? nil : L10n.errorEmail)
        delegate?.setPasswordError(error: isPasswordValid ? nil : L10n.errorPassword)
        delegate?.setRepeatPasswordError(error: password == repeatPassword ? nil : L10n.errPasswordEqual)
        
        return isEmailValid && isPasswordValid && password == repeatPassword
    }
}
