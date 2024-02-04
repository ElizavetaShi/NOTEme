//
//  LoginVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 24.10.23.
//

import UIKit
import SnapKit
import Storage

@objc protocol LoginViewModelProtocol: AnyObject {
    
    var catchEmailError: ((String?) -> Void)? { get set }
    var catchPasswordError: ((String?) -> Void)? { get set }
    
    func loginDidTap(email: String?, password: String?)
    @objc func newAccountDidTap()
    func forgotPasswordDidTap(email: String?)
 
    var keyboardFrameChanged: ((CGRect) -> Void)? { get set }
}

protocol LoginKeyboardAnimationUseCase {
    func frameChanged(for view: UIView, frame: CGRect)
}

final class LoginVC: UIViewController {
    
    private enum L10n {
        static let welcome: String = "auth_welcome_label".localized
        static let login: String = "auth_login_button".localized
        static let newAccount: String = "auth_new_account_button".localized
        static let forgotPassword: String = "auth_forgot_password_button".localized
        static let email: String = "auth_email_textfield".localized
        static let emailPlaceholder: String = "auth_email_placeholder_textfield".localized
        static let password: String = "auth_password_textfield".localized
        static let passwordPlaceholder: String = "auth_enter_password_placeholder".localized
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private lazy var contentView: UIView = .contentView(.appGrey)
    
    private lazy var logoContainer: UIView = UIView()
   
    private lazy var logoImageView: UIImageView =
    UIImageView(image: .General.logo)
    
    private lazy var welcomeLabel: UILabel = .headLabel(L10n.welcome)
        
    private lazy var loginButton: UIButton =
        .yellowRoundedButton(L10n.login)
        .withAction(self, #selector(loginDidTap))
    
    
    private lazy var newAccountButton: UIButton = .underlineYellowButton(L10n.newAccount)
        .withAction(viewModel, #selector(LoginViewModelProtocol.newAccountDidTap))
    
    private lazy var forgotPasswordButton: UIButton = .underlineGreyButton(L10n.forgotPassword)
        .withAction(self, #selector(forgotPasswordDidTap))
    
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
    
    
    
    private var viewModel: LoginViewModelProtocol
    
    private var keyboardAnimator: LoginKeyboardAnimationUseCase
    
    init(viewModel: LoginViewModelProtocol,
         keyboardAnimator: LoginKeyboardAnimationUseCase) {
        self.viewModel = viewModel
        self.keyboardAnimator = keyboardAnimator
        super.init(nibName: nil, bundle: nil)
        
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func bind() {
        viewModel.catchEmailError = { errorText in
            self.emailTextField.errorText = errorText
        }
        
        viewModel.catchPasswordError = {
            self.passwordTextField.errorText = $0
        }
        
        viewModel.keyboardFrameChanged = { frame in
            self.keyboardAnimator.frameChanged(for: self.containerView, frame: frame)
        }
    }
    
    private func setupUI() {
        
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        view.addSubview(loginButton)
        view.addSubview(newAccountButton)
        
        contentView.addSubview(containerView)
        contentView.addSubview(logoContainer)
        contentView.addSubview(welcomeLabel)
        
        logoContainer.addSubview(logoImageView)
        
        containerView.addSubview(forgotPasswordButton)
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
    }
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(loginButton.snp.centerY)
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
        
        newAccountButton.snp.makeConstraints { make in
            make.height.equalTo(20.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        loginButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
            make.bottom.equalTo(newAccountButton.snp.top).inset(-8)
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
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).inset(-16.0)
            make.bottom.left.equalToSuperview().inset(16.0)
            make.height.equalTo(17.0)
        }
    }
    
    @objc private func loginDidTap() {
        viewModel.loginDidTap(email: emailTextField.text,
                              password: passwordTextField.text)
    }
    
    @objc private func newAccountDidTap() {
        print("\(#function)")
        viewModel.newAccountDidTap()
    }
    
    @objc private func forgotPasswordDidTap() {
        viewModel.forgotPasswordDidTap(email: emailTextField.text)
    }
}
