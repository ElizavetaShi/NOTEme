//
//  HomeVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 3.12.23.
//

import UIKit
import SnapKit

protocol HomeVMProtocol: AnyObject {}

final class HomeVC: UIViewController {
    
    private enum L10n {
        static let home: String = "home_button".localized
    }
    
    private lazy var contentView: UIView = .contentView(.appGrey)
    
    private var viewModel: HomeVMProtocol

    
    init(viewModel: HomeVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupTabBarItem()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        
        view.backgroundColor = .appGrey
        view.addSubview(contentView)
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: L10n.home, image: .Profile.home , tag: .zero)
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}
