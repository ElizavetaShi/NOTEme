//
//  PlusMenuVC.swift
//  NoteMe
//
//  Created by admin on 11.02.24.
//

import UIKit

protocol MainMenuViewModelProtocol: AnyObject {
    
    func openCreateDateNotification()
    func openCreateTimerNotification()
    func openCreateLocationNotification()
}

final class MainMenuVC: UIViewController {
    
    private lazy var containerView: UIView = .mainView(.viewShadow)
    
    private lazy var tableView: UITableView = {
       let tableview = UITableView()
        tableview.backgroundColor = .clear
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .singleLine
        tableview.separatorInset = .zero
//        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
        tableview.register(MenuTableViewCell.self)
        return tableview
    }()
    
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

extension MainMenuVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
}

extension MainMenuVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainMenuRows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuTableViewCell = tableView.dequeue(at: indexPath)
        cell.setupCell(type: MainMenuRows.allCases[indexPath.row])
        return cell
    }
}

extension MainMenuVC: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
