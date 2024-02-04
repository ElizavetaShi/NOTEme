//
//  ProfileVC.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 3.12.23.
//

import UIKit

protocol ProfileViewModelProtocol {
    var username: String { get set }
   func makeTableView() -> UITableView
}

final class ProfileVC: UIViewController {
    
    private enum L10n {
        static let profile: String = "profile_button".localized
        static let account: String = "account_title_label".localized
        static let settings: String = "settings_title_label".localized
    }
    
    private lazy var contentView: UIView = .contentView(.appGrey)
    
    private lazy var tableView: UITableView = viewModel.makeTableView()
    
    private var viewModel: ProfileViewModelProtocol
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    init(viewModel: ProfileViewModelProtocol) {
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
        contentView.addSubview(tableView)
    }
    
    private func setupTabBarItem() {
        self.tabBarItem = UITabBarItem(title: L10n.profile, image: .Profile.profile, tag: .zero)
    }
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
