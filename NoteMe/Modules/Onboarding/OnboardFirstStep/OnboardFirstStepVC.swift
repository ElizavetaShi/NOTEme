//
//  OnboardFirstStepVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 28.11.23.
//

import UIKit
import SnapKit

@objc protocol OnboardFirstStepViewModelProtocol {
    @objc func nextButtonDidTap()
}

final class OnboardFirstStepVC: UIViewController {
    
    private enum L10n {
        static let welcome: String = "onboard1_welcome_label".localized
        static let infoText: String = "onboard1_info_label_text".localized
        static let next: String = "onboard1_next_button".localized
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private lazy var contentView: UIView = .contentView(.appGrey)
    
    private lazy var logoContainer: UIView = UIView()
    
    private lazy var logoImageView: UIImageView =
    UIImageView(image: .General.logo)
    
    private lazy var welcomeLabel: UILabel = .headLabel(L10n.welcome)
    
    private lazy var containerView: UIView = .mainView(.viewShadow)
    
    private lazy var infoLabel: UILabel = .infoLabel(L10n.infoText)
    
    private lazy var nextButton: UIButton =
        .yellowRoundedButton(L10n.next)
        .withAction(viewModel, #selector(OnboardFirstStepViewModelProtocol.nextButtonDidTap))
    
    private var viewModel: OnboardFirstStepViewModelProtocol
    
    init(viewModel: OnboardFirstStepViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupUI() {
        
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        view.addSubview(nextButton)
        
        contentView.addSubview(logoContainer)
        contentView.addSubview(welcomeLabel)
        contentView.addSubview(containerView)
        
        containerView.addSubview(infoLabel)
        
        logoContainer.addSubview(logoImageView)
    }
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(nextButton.snp.centerY)
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
        
        containerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16.0)
            make.centerY.equalToSuperview()
        }
        
        infoLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16.0)
        }
        
        nextButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16.0)
        }
    }
}
