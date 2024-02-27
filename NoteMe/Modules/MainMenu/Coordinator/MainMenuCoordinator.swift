//
//  MainMenuCoordinator.swift
//  NoteMe
//
//  Created by admin on 11.02.24.
//

import UIKit

final class MainMenuCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        let vc = MainMenuAssembler.make(coordinator: self)
        rootVC = vc
        return rootVC ?? UIViewController()
    }
}

extension MainMenuCoordinator: MainMenuCoordinatorProtocol {
    
    func openCreateDateNotificationVC() {
        let coordinator = DateNotificationCoordinator(container: container)
        children.append(coordinator)
        let vc = coordinator.start()
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            self?.rootVC?.dismiss(animated: true)
            self?.finish()
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
