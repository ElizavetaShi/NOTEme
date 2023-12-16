//
//  RegisterVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 4.11.23.
//

import UIKit
import SnapKit

@objc protocol RegisterPresenterProtocol: AnyObject {
    
    func registerDidTap(email: String?, password: String?, repeatPassword: String?)
    @objc func haveAccountDidTap()
}

protocol RegisterKeyboardAnimationUseCase {
    func frameChanged(for view: UIView, frame: CGRect)
}

final class RegisterVC: UIViewController {
    
    private enum L10n {
        static let welcome: String = "auth_nice_to_meet_you_label".localized
        static let register: String = "auth_register_button".localized
        static let existingAccount: String = "auth_existing_account_button".localized
        static let email: String = "auth_email_textfield".localized
        static let emailPlaceholder: String = "auth_email_placeholder_textfield".localized
        static let password: String = "auth_password_textfield".localized
        static let passwordPlaceholder: String = "auth_enter_password_placeholder".localized
        static let repeatPassword: String = "auth_repeat_password_textfield".localized
        static let repeatPasswordPlaceholder: String = "auth_enter_password_placeholder".localized
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private lazy var contentView: UIView = .contentView(.appGrey)
    
    private lazy var logoContainer: UIView = UIView()
    
    private lazy var logoImageView: UIImageView =
    UIImageView(image: .General.logo)
    
    private lazy var welcomeLabel: UILabel = .headLabel(L10n.welcome)
    
    private lazy var registerButton: UIButton = .yellowRoundedButton(L10n.register)
        .withAction(self, #selector(registerDidTap))
    
    private lazy var existingAccountButton: UIButton = .underlineYellowButton(L10n.existingAccount)
        .withAction(presenter, #selector(RegisterPresenterProtocol.haveAccountDidTap))
    
    private lazy var containerView: UIView = .mainView(.viewShadow)
    
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = L10n.email
        textField.placeholder = L10n.emailPlaceholder
        return textField
    }()
    
    private lazy var passwordTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = L10n.password
        textField.placeholder = L10n.passwordPlaceholder
        return textField
    }()
    
    private lazy var repeatPasswordTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = L10n.repeatPassword
        textField.placeholder = L10n.repeatPasswordPlaceholder
        return textField
    }()
    
    private var presenter: RegisterPresenterProtocol
    
    private var keyboardAnimator: RegisterKeyboardAnimationUseCase
    
    init(
        presenter: RegisterPresenterProtocol,
        keyboardAnimator: RegisterKeyboardAnimationUseCase) {
        self.presenter = presenter
        self.keyboardAnimator = keyboardAnimator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        setupConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func setupUI() {
        
        view.backgroundColor = .appBlack
        view.addSubview(contentView)
        view.addSubview(registerButton)
        view.addSubview(existingAccountButton)
        
        contentView.addSubview(containerView)
        contentView.addSubview(logoContainer)
        contentView.addSubview(welcomeLabel)
        
        logoContainer.addSubview(logoImageView)
        
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(repeatPasswordTextField)
    }
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(registerButton.snp.centerY)
        }
        
        logoContainer.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(welcomeLabel.snp.top)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.top).inset(-8.0)
            make.centerX.equalToSuperview()
        }
        
        existingAccountButton.snp.makeConstraints { make in
            make.height.equalTo(20.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        registerButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
            make.bottom.equalTo(existingAccountButton.snp.top).inset(-8)
        }
        
        containerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.centerY.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16.0)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).inset(-16.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).inset(-16.0)
            make.bottom.horizontalEdges.equalToSuperview().inset(16.0)
        }
    }
    
    @objc private func registerDidTap() {
        presenter.registerDidTap(email: emailTextField.text,
                                 password: passwordTextField.text,
                                 repeatPassword: repeatPasswordTextField.text)
    }
}

extension RegisterVC: RegisterPresenterDelegate {
    
    func setEmailError(error: String?) {
        emailTextField.errorText = error
    }
    
    func setPasswordError(error: String?) {
        passwordTextField.errorText = error
    }
    
    func setRepeatPasswordError(error: String?) {
        repeatPasswordTextField.errorText = error
    }
   
    func keyboardFrameChanged(_ frame: CGRect) {
        keyboardAnimator.frameChanged(for: containerView, frame: frame)
    }
}


   
    
   
    
    




