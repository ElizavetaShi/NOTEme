//
//  TabBarController.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 3.12.23.
//

import UIKit
import SnapKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private lazy var plusButton: UIButton = .plusButton(UIImage(named: "plus"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
        
        self.tabBar.barTintColor = .black
        self.tabBar.tintColor = .appYellow
        self.tabBar.unselectedItemTintColor = .appWhite
        self.tabBar.isTranslucent = false
        
       self.tabBar.addSubview(plusButton)
        setupConstraints()
//        self.delegate = self
    }
 
    private func setupTabs() {
        
        let homeNC = self.createNC(with: "Home", image: UIImage(named: "home"), vc: HomeVC())
        let profileNC = self.createNC(with: "Profile", image: UIImage(named: "profile"), vc: ProfileVC())
        
        self.setViewControllers([homeNC, profileNC], animated: true)
    }
    
    private func createNC(with title: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nc = UINavigationController(rootViewController: vc)
        nc.tabBarItem.title = title
        nc.tabBarItem.image = image
        return nc
    }
    
   
    private func setupConstraints() {
        plusButton.snp.makeConstraints { make in
            make.size.equalTo(50.0)
            make.centerY.equalTo(tabBar.snp.top)
            make.centerX.equalToSuperview()
        }
    }
}


