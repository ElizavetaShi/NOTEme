//
//  LoginVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 24.10.23.
//

import UIKit
import SnapKit

final class LoginVC: UIViewController {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .appGrey
        return view
    }()
    
    private lazy var logoImageView: UIImageView =
    UIImageView(image: .General.logo)
    
    private lazy var welcomeLabel: UILabel = .headLabel("welcome_label".localized)
        
    
    private lazy var loginButton: UIButton = .yellowRoundedButton("login_button".localized)
    
    
    private lazy var newAccountButton: UIButton = .underlineYellowButton("new_account_button".localized)
    
    private lazy var forgotPasswordButton: UIButton = .underlineGreyButton("forgot_password_button".localized)
    
    private lazy var containerView: UIView = .mainView(.viewShadow)
    
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "email_textfield".localized
        textField.placeholder = "email_placeholder_textfield".localized
        return textField
    }()
    
    private lazy var passwordTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "password_textfield".localized
        textField.placeholder = "enter_password_placeholder".localized
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(welcomeLabel)
        view.addSubview(loginButton)
        view.addSubview(newAccountButton)
        contentView.addSubview(containerView)
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
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72.0)
            make.centerX.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(72.0)
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
            make.top.equalTo(welcomeLabel.snp.bottom).inset(-8.0)
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
}
