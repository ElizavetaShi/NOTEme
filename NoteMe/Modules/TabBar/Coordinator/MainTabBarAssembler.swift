//
//  MainTabBarAssembler.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 16.12.23.
//

import UIKit

final class MainTabBarAssembler {
    private init() {}
    
    static func make(coordinator: MainTabBarCoordinatorProtocol) -> UITabBarController {
        
        let vm = MainTabBarVM(coordinator: coordinator)
        return MainTabBarVC(viewModel: vm)
    }
}
