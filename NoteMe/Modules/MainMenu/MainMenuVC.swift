//
//  PlusMenuVC.swift
//  NoteMe
//
//  Created by admin on 11.02.24.
//

import UIKit

protocol MainMenuViewModelProtocol: AnyObject {
    
    func makeTabLeView() -> UITableView
}

final class MainMenuVC: UIViewController {
    
    private lazy var containerView: UIView = .mainView(.viewShadow)
    
    private lazy var tableView: UITableView = viewModel.makeTabLeView()
    
    var viewModel: MainMenuViewModelProtocol
    
    init(viewModel: MainMenuViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
    }
    
    private func commonInit() {
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        
        view.addSubview(containerView)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MainMenuVC: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
