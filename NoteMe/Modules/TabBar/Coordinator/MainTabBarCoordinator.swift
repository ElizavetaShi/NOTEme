//
//  MainTabBarCoordinator.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 12.12.23.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {
    
    private let container: Container
    
    private var tabBar: UITabBarController?
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        
        tabBar = MainTabBarAssembler.make(coordinator: self)
        tabBar?.viewControllers = [makeHomeModule(), makeProfileModule()]
        return tabBar ?? UITabBarController()
    }
    
    private func makeHomeModule() -> UIViewController {
        let coordinator = HomeCoordinator()
        children.append(coordinator)
        
        return coordinator.start()
    }
    
    private func makeProfileModule() -> UIViewController {
        let coordinator = ProfileCoordinator(container: container)
        children.append(coordinator)
        
        return coordinator.start()
    }
}

extension MainTabBarCoordinator: MainTabBarCoordinatorProtocol {
    func openMainMenu() {
        let coordinator = MainMenuCoordinator(container: container)
        children.append(coordinator)
        let vc = coordinator.start()
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            vc.dismiss(animated: true)
        }
        
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = CGSize(width: 180.0, height: 130)
#warning("CHECK")
        //        vc.popoverPresentationController?.arrowDirection = .down
        
        if let popoverVC = vc.popoverPresentationController {
            let sourceView = tabBar?.view
#warning("CHECK")
            popoverVC.delegate = (vc as? UIPopoverPresentationControllerDelegate)
            popoverVC.sourceView = sourceView
            popoverVC.sourceRect = CGRect(x: sourceView!.bounds.width / 2, y: sourceView!.bounds.height - 85.0, width: 0, height: 0)
            tabBar?.present(vc, animated: true)
        }
    }
}
