//
//  ProfileVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 3.12.23.
//

import UIKit

final class ProfileVC: UIViewController {
    
    private enum L10n {
        static let profile: String = "profile_button".localized
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .appGrey
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: L10n.profile, image: UIImage(named: "profile"), tag: .zero)
    }
}
