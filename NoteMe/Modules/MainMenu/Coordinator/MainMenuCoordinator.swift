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
        let vc = MainMenuAssembler.make(coordinator: self)
        rootVC = vc
        return vc
    }
}

extension MainMenuCoordinator: MainMenuCoordinatorProtocol {
    
    func openCreateDateNotificationVC() {
        let coordinator = DateNotificationCoordinator()
        children.append(coordinator)
        let vc = coordinator.start()
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            vc.dismiss(animated: true)
        }
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        rootVC?.present(vc, animated: true)
    }
    
    func openCreateTimerNotificationVC() {
        
    }
    
    func openCreateLocationNotificationVC() {
        
    }
}
