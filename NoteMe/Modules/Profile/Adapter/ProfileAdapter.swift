//
//  ProfileAdapter.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 23.01.24.
//

import UIKit

final class ProfileAdapter: NSObject {
    
    var sections: [ProfileSections] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        return tableView
    }()
    
    override init() {
        super.init()
        setupTableView()
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderIdentifier")
        tableView.register(AccountTableViewCell.self, forCellReuseIdentifier: AccountTableViewCell.identifier)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
    }
}

extension ProfileAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = sections[section]
        return sectionType.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = sections[indexPath.section]
        switch section {
        case .account(let email):
            let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.identifier) as! AccountTableViewCell
            cell.setup(email)
            return cell
        case .settings(let rows):
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier) as! SettingsTableViewCell
            cell.setup(rows[indexPath.row])
            return cell
        }
    }
}

extension ProfileAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let section = sections[section]
        let header = HeaderView()
        header.text = section.headerText
        return header
    }
}

extension ProfileAdapter: ProfileAdapterProtocol {
    
    
    
    func reloadData(with sections: [ProfileSections]) {
        self.sections = sections
    }
    
    func makeTableView() -> UITableView {
        return tableView
    }
}
