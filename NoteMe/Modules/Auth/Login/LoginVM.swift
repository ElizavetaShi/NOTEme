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
    func showAlert(_ alert: UIAlertController)
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

//protocol LoginKeyboardHelperUseCase {
//    @discardableResult
//    func onWillShow(_ handler: @escaping (CGRect) -> Void) -> Self
//    
//    @discardableResult
//    func onWillHide(_ handler: @escaping (CGRect) -> Void) -> Self
//}

final class LoginVM: LoginViewModelProtocol {
    
    var catchEmailError: ((String?) -> Void)?
    var catchPasswordError: ((String?) -> Void)?
    
    private weak var coordinator: LoginCoordinatorProtocol?
    
    private let authService: LoginAuthServiceUseCase
    private let inputValidator: LoginInputValidatorUseCase
    //    private var keyboardHelper: LoginKeyboardHelperUseCase
    
    init(
        //        keyboardHelper: LoginKeyboardHelperUseCase,
        coordinator: LoginCoordinatorProtocol,
        authService: LoginAuthServiceUseCase,
        inputValidator: LoginInputValidatorUseCase) {
            self.authService = authService
            self.inputValidator = inputValidator
            self.coordinator = coordinator
            //        self.keyboardHelper = keyboardHelper
        }
    
    func loginDidTap(email: String?, password: String?) {
        
        guard
            checkValidation(email: email, password: password),
            let email, let password
        else { return }
        
        
        
        authService.login(email: email,
                          password: password) { [weak coordinator] isSuccess in
            print(isSuccess)
            if isSuccess {
                //                FIXME: - uncomment
                //                                ParametersHelper.set(.authenticated, value: true)
                //                                coordinator?.finish()
            } else {
                let alertVC = AlertBuilder.build(title: "Error", message: "Invalid email or password. Please enter correct one", okTitle: "Ok")
                coordinator?.showAlert(alertVC)
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
