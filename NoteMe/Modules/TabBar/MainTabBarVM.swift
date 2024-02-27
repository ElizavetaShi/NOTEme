//
//  MainTabBarVM.swift
//  NoteMe
//
//  Created by admin on 12.02.24.
//

import UIKit

protocol MainTabBarCoordinatorProtocol: AnyObject {
    func openMainMenu(sourceView: UIView)
}

final class MainTabBarVM: MainTabBarViewModelProtocol {
    
    private weak var coordinator: MainTabBarCoordinatorProtocol?
    
    init(coordinator: MainTabBarCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func addButtonTapped(_ button: UIButton) {
        
        coordinator?.openMainMenu(sourceView: button)
    }
}
