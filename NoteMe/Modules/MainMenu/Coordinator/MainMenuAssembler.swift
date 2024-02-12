//
//  MainMenuAssembler.swift
//  NoteMe
//
//  Created by admin on 11.02.24.
//

import UIKit

final class MainMenuAssembler {
    
    private init() {}
    
    static func make(coordinator: MainMenuCoordinatorProtocol) -> UIViewController {
        
        let adapter = MainMenuAdapter()
        let vm = MainMenuVM(adapter: adapter, coordinator: coordinator)
        let vc = MainMenuVC(viewModel: vm)
        return vc
    }
}
