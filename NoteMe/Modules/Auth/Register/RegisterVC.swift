//
//  RegisterVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 4.11.23.
//

import UIKit
import SnapKit

final class RegisterVC: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private lazy var contentView: UIView = .contentView(.appGrey)
    
    private lazy var logoImageView: UIImageView =
    UIImageView(image: .General.logo)
    
    private lazy var welcomeLabel: UILabel = .headLabel("auth_nice_to_meet_you_label".localized)
    
    private lazy var registerButton: UIButton = .yellowRoundedButton("auth_register_button".localized)
    
    private lazy var existingAccountButton: UIButton = .underlineYellowButton("auth_existing_account_button".localized)
    
    private lazy var containerView: UIView = .mainView(.viewShadow)
    
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "auth_email_textfield".localized
        textField.placeholder = "auth_email_placeholder_textfield".localized
        return textField
    }()
    
    private lazy var passwordTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "auth_password_textfield".localized
        textField.placeholder = "auth_enter_password_placeholder".localized
        return textField
    }()
    
    private lazy var repeatPasswordTextField: LineTextField = {
        let textField = LineTextField()
        textField.title = "auth_repeat_password_textfield".localized
        textField.placeholder = "auth_enter_password_placeholder".localized
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
        view.addSubview(registerButton)
        view.addSubview(existingAccountButton)
        contentView.addSubview(containerView)
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
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72.0)
            make.centerX.equalToSuperview()
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
}
