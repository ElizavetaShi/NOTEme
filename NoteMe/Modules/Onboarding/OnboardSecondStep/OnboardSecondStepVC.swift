//
//  OnboardSecondStepVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 28.11.23.
//

import UIKit
import SnapKit

@objc protocol OnboardSecondStepViewModelProtocol {
    @objc func doneDidTap()
    func dismissedByUser()
}

final class OnboardSecondStepVC: UIViewController {
    
    private enum L10n {
        static let welcome: String = "onboard2_welcome_label".localized
        static let infoText = "onboard2_info_label_text".localized
        static let calendar: String = "onboard2_calendar_label".localized
        static let location: String = "onboard2_location_label".localized
        static let timer: String = "onboard2_timer_label".localized
        static let done: String = "done_button".localized
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
    
    private lazy var infoLabel: UILabel =
        .infoLabel(L10n.infoText)
    
    private lazy var menuContainerView: UIView = UIView()
    
    private lazy var onboardImageView: UIImageView = UIImageView(image: .General.onboardStep2)
    
    private lazy var calendarLabel: UILabel = .menuLabel(L10n.calendar)
    
    private lazy var locationLabel: UILabel = .menuLabel(L10n.location)
    
    private lazy var timerLabel: UILabel = .menuLabel(L10n.timer)
    
    private lazy var doneButton: UIButton =
        .yellowRoundedButton(L10n.done)
        .withAction(viewModel, #selector(OnboardSecondStepViewModelProtocol.doneDidTap))
    
    private var viewModel: OnboardSecondStepViewModelProtocol
    
    init(viewModel: OnboardSecondStepViewModelProtocol) {
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
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.dismissedByUser()
    }
    
    private func setupUI() {
        
        view.backgroundColor = .appBlack
        
        view.addSubview(contentView)
        view.addSubview(doneButton)
       
        
        contentView.addSubview(logoContainer)
        contentView.addSubview(welcomeLabel)
        contentView.addSubview(containerView)
        contentView.addSubview(menuContainerView)
        
        logoContainer.addSubview(logoImageView)
        
        containerView.addSubview(infoLabel)
        
        menuContainerView.addSubview(onboardImageView)
        
        onboardImageView.addSubview(calendarLabel)
        onboardImageView.addSubview(locationLabel)
        onboardImageView.addSubview(timerLabel)
    }
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(doneButton.snp.centerY)
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
        
        menuContainerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(containerView.snp.bottom)
            make.bottom.equalTo(doneButton.snp.top)
        }
        
        onboardImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(180.0)
            make.height.equalTo(157.0)
        }
        
        calendarLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24.0)
            make.top.equalToSuperview().inset(19.0)
            make.width.equalTo(116.0)
            make.height.equalTo(24.0)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24.0)
            make.top.equalTo(calendarLabel.snp.bottom).offset(12.0)
            make.width.equalTo(116.0)
            make.height.equalTo(24.0)
        }
        
        timerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24.0)
            make.top.equalTo(locationLabel.snp.bottom).offset(12.0)
            make.width.equalTo(116.0)
            make.height.equalTo(24.0)
        }
        
        doneButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20.0)
            make.height.equalTo(45.0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16.0)
        }
    }
}
