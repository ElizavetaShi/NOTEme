//
//  ResetVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 4.11.23.
//

import UIKit
import SnapKit

@objc protocol ResetViewModelProtocol: AnyObject {
    
    var catchEmailError: ((String?) -> Void)? { get set }

    
    func resetButtonDidTap(email: String?)
    @objc func cancelButtonDidTap()
}

final class ResetVC: UIViewController {
    
    private enum L10n {
        static let headLabel: String = "auth_reset_password_label".localized
        static let reset: String = "auth_reset_button".localized
        static let infoText: String = "auth_info_label_text".localized
        static let email: String = "auth_email_placeholder_textfield".localized
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private lazy var contentView: UIView = .contentView(.appGrey)
    
    private lazy var logoContainer: UIView = UIView()
    
    private lazy var logoImageView: UIImageView =
    UIImageView(image: .General.logo)
    
    private lazy var headLabel: UILabel = .headLabel(L10n.headLabel)
    
    private lazy var resetButton: UIButton = .yellowRoundedButton(L10n.reset)
        .withAction(self, #selector(resetButtonDidTap))
    
    private lazy var cancelButton: UIButton =
        .cancelButton()
        .withAction(viewModel, #selector(ResetViewModelProtocol.cancelButtonDidTap))
    
    private lazy var containerView: UIView = .mainView(.viewShadow)
    
    private lazy var infoLabel: UILabel = .infoLabel(L10n.infoText)
    
    private lazy var emailTextField: LineTextField = {
        let textField = LineTextField()
        textField.placeholder = L10n.email
        return textField
    }()
    
    private var viewModel: ResetViewModelProtocol
    
    init(viewModel: ResetViewModelProtocol) {
        self.viewModel = viewModel
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
    }
    
    private func setupUI() {
        
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        view.addSubview(resetButton)
        view.addSubview(cancelButton)
        
        contentView.addSubview(logoContainer)
        contentView.addSubview(headLabel)
        contentView.addSubview(containerView)
        
        logoContainer.addSubview(logoImageView)
        
        containerView.addSubview(infoLabel)
        containerView.addSubview(emailTextField)
    }
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(resetButton.snp.centerY)
        }
        
        logoContainer.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(headLabel.snp.top)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(96.0)
        }
        
        headLabel.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.top).inset(-8.0)
            make.centerX.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.centerY.equalToSuperview()
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
    
    @objc private func resetButtonDidTap() {
        
        viewModel.resetButtonDidTap(email: emailTextField.text)
    }
    
    @objc private func cancelButtonDidTap() {
        print("\(#function)")
    }
}

