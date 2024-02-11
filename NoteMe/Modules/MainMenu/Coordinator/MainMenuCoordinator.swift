//
//  MainMenuCoordinator.swift
//  NoteMe
//
//  Created by admin on 11.02.24.
//

import UIKit

final class MainMenuCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    
    override func start() -> UIViewController {
        let vc = MainMenuAssembler.make()
        rootVC = vc
        return vc
    }
    
}
