//
//  MainTabBarVM.swift
//  NoteMe
//
//  Created by admin on 12.02.24.
//

import Foundation

protocol MainTabBarCoordinatorProtocol: AnyObject {
    func openMainMenu()
}

final class MainTabBarVM: MainTabBarViewModelProtocol {
    
    private weak var coordinator: MainTabBarCoordinatorProtocol?
    
    init(coordinator: MainTabBarCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func addButtonTapped() {
        
        coordinator?.openMainMenu()
    }
}
