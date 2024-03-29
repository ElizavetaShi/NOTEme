//
//  MainTabBarVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 3.12.23.
//
//
import UIKit
import SnapKit


@objc protocol MainTabBarViewModelProtocol: AnyObject {
    @objc func addButtonTapped(_ sender: UIView)
}

final class MainTabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    private lazy var plusButton: UIButton =
        .plusButton(.TabBar.plus)
        .withAction(viewModel, #selector(MainTabBarViewModelProtocol.addButtonTapped))
    
    private var viewModel: MainTabBarViewModelProtocol
    
    init(viewModel: MainTabBarViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        commonInit()
    }
    
    @objc private func openMainMenu() {
        
        viewModel.addButtonTapped(plusButton)
    }
    
    private func commonInit() {
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        
        tabBar.tintColor = .appYellow
        tabBar.backgroundColor = .appBlack
        tabBar.unselectedItemTintColor = .appWhite
        
        view.addSubview(plusButton)
    }
    
    private func setupConstraints() {
        plusButton.snp.makeConstraints { make in
            make.size.equalTo(50.0)
            make.centerY.equalTo(tabBar.snp.top)
            make.centerX.equalToSuperview()
        }
    }
}
