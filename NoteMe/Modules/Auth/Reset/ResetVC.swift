//
//  ResetVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 4.11.23.
//

import UIKit
import SnapKit

final class ResetVC: UIViewController {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .appGrey
        return view
    }()
    
    private lazy var logoImageView: UIImageView =
    UIImageView(image: .General.logo)
    
    private lazy var headLabel: UILabel = .headLabel("reset_password_label".localized)
    
    private lazy var resetButton: UIButton = .yellowRoundedButton("reset_button".localized)
    
    private lazy var cancelButton: UIButton = .cancelButton()
    
    private lazy var containerView: UIView = .mainView(.viewShadow)
    
    private lazy var infoLabel: UILabel = .infoLabel("info_label_text".localized)
    
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.placeholder = "email_placeholder_textfield".localized
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
        contentView.addSubview(headLabel)
        contentView.addSubview(containerView)
        view.addSubview(resetButton)
        view.addSubview(cancelButton)
        containerView.addSubview(infoLabel)
        containerView.addSubview(emailTextField)
    }
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(resetButton.snp.centerY)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72.0)
            make.centerX.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        headLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(122.0)
            make.centerX.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.top.equalTo(headLabel.snp.bottom).inset(-8.0)
        }
        
        resetButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
            make.bottom.equalTo(cancelButton.snp.top).inset(-8)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.height.equalTo(45.0)
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(16.0)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).inset(-8.0)
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().inset(20.0)
        }
    }
}
        
