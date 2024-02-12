//
//  MainTabBarVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 3.12.23.
//
//
import UIKit
import SnapKit


final class MainTabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    private lazy var plusButton: UIButton = .plusButton(.TabBar.plus).withAction(self, #selector(openMainMenu))
    
    override func viewDidLoad() {
        
        commonInit()
    }
    
    @objc private func openMainMenu() {
        let vc = MainMenuAssembler.make(coordinator: MainMenuCoordinator())
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = CGSize(width: 180.0, height: 130)
       #warning("СПРОСИТЬ ПРО  ARROW")
////        vc.popoverPresentationController?.arrowDirection = .down
        vc.popoverPresentationController?.delegate = (vc as! UIPopoverPresentationControllerDelegate)
        vc.popoverPresentationController?.sourceView = plusButton
        vc.popoverPresentationController?.sourceRect = CGRect(x: plusButton.bounds.midX, y: plusButton.bounds.midY, width: .zero, height: .zero)
        present(vc, animated: true)
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
