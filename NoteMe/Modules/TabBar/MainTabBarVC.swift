//
//  MainTabBarVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 3.12.23.
//
//
import UIKit
import SnapKit
//
final class MainTabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    private lazy var plusButton: UIButton = .plusButton(UIImage(named: "plus"))
    
    override func viewDidLoad() {
        tabBar.tintColor = .appYellow
        tabBar.backgroundColor = .appBlack
        tabBar.unselectedItemTintColor = .appWhite
        
        self.tabBar.addSubview(plusButton)
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        plusButton.snp.makeConstraints { make in
            make.size.equalTo(50.0)
            make.centerY.equalTo(tabBar.snp.top)
            make.centerX.equalToSuperview()
        }
    }
}
