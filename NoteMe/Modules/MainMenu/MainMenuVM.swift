//
//  MainMenuVM.swift
//  NoteMe
//
//  Created by admin on 11.02.24.
//

import Foundation
import UIKit

protocol MainMenuCoordinatorProtocol: AnyObject {
    
    func openCreateDateNotificationVC()
    func openCreateTimerNotificationVC()
    func openCreateLocationNotificationVC()
}

protocol MainMenuAdapterProtocol {
    var didSelectRow: ((MainMenuRows) -> Void)? { get set }
    func reloadData(with rows: [MainMenuRows])
    func makeTableView() -> UITableView
}

final class MainMenuVM: MainMenuViewModelProtocol {
    
    var rows: [MainMenuRows] {
        return MainMenuRows.allCases
    }
    
    private var adapter: MainMenuAdapterProtocol
    private weak var coordinator: MainMenuCoordinatorProtocol?
    
    init(adapter: MainMenuAdapterProtocol, coordinator: MainMenuCoordinatorProtocol) {
        self.adapter = adapter
        self.coordinator = coordinator
        
        commonInit()
    }
    
    private func bind() {
        adapter.didSelectRow = { [weak self] row in
            switch row {
            case .calendar: self?.coordinator?.openCreateDateNotificationVC()
            case .location: self?.coordinator?.openCreateLocationNotificationVC()
            case .timer: self?.coordinator?.openCreateTimerNotificationVC()
            }
        }
    }
    
    private func commonInit() {
        adapter.reloadData(with: rows)
    }
    
    func makeTabLeView() -> UITableView {
        return adapter.makeTableView()
    }
}
