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
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back!"
        label.font = .appBoldFont.withSize(25.0)
        return label
        
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.yellowButtonStyle()
        return button
    }()
    
    private lazy var newAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("New Account", for: .normal)
        button.setTitleColor(.appYellow, for: .normal)
        button.setTitleColor(.appYellow, for: .normal)
        button.titleLabel?.font = .appBoldFont.withSize(17.0)
        button.underlineButtonStyle()
        return button
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.mainViewStyle()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 20.0
        return stackView
    }()
        
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password", for: .normal)
        button.setTitleColor(.buttonGrey, for: .normal)
        button.titleLabel?.font = .appBoldFont.withSize(15.0)
        button.titleLabel?.textAlignment = .left
        button.underlineButtonStyle()
        return button
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
        contentView.addSubview(loginButton)
        contentView.addSubview(newAccountButton)
        contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        stackView.addSubview(forgotPasswordButton)
        stackView.addArrangedSubview(forgotPasswordButton)
        
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
        
        loginButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(8.0)
            make.height.equalTo(45.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(28.0)
        }
        
        newAccountButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(8.0)
            make.horizontalEdges.equalToSuperview().inset(8.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        containerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(8.0)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        
        
        
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(16.0)
            make.width.equalTo(123.0)
            make.height.equalTo(17.0)
        }
        
    }
}
