//
//  MainMenuAdapter.swift
//  NoteMe
//
//  Created by admin on 11.02.24.
//

import UIKit

final class MainMenuAdapter: NSObject {
    
    var rows: [MainMenuRows] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var tableView: UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    var didSelectRow: ((MainMenuRows) -> Void)?
    
    override init() {
        super.init()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
        tableView.register(MenuTableViewCell.self)
        //        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
    }
}


extension MainMenuAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuTableViewCell = tableView.dequeue(at: indexPath)
        cell.setupCell(type: MainMenuRows.allCases[indexPath.row])
        return cell
    }
}

extension MainMenuAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedRow = rows[indexPath.row]
        didSelectRow?(selectedRow)
    }
}

extension MainMenuAdapter: MainMenuAdapterProtocol {
    
    func reloadData(with rows: [MainMenuRows]) {
        self.rows = rows
    }
    
    func makeTableView() -> UITableView {
        return tableView
    }
}
