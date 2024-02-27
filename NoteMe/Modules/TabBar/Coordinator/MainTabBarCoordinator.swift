//
//  MainTabBarCoordinator.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 12.12.23.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {
    
    private let container: Container
    
    private var rootVC: UIViewController?
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        
        let tabBar = MainTabBarAssembler.make(coordinator: self)
        tabBar.viewControllers = [makeHomeModule(), makeProfileModule()]
        rootVC = tabBar
        return tabBar
    }
    
    private func makeHomeModule() -> UIViewController {
        let coordinator = HomeCoordinator()
        children.append(coordinator)
        
        return coordinator.start()
    }
    
    private func makeProfileModule() -> UIViewController {
        let coordinator = ProfileCoordinator(container: container)
        children.append(coordinator)
        let vc = coordinator.start()
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll()
            self?.rootVC?.dismiss(animated: true)
            self?.finish()
        }
        return vc
    }
}

extension MainTabBarCoordinator: MainTabBarCoordinatorProtocol {
    func openMainMenu(sourceView: UIView) {
        let coordinator = MainMenuCoordinator(container: container)
        children.append(coordinator)
        let vc = coordinator.start()
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            vc.dismiss(animated: true)
            self?.rootVC?.dismiss(animated: true)
        }
        
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = CGSize(width: 180.0, height: 130)
        
        if let popoverVC = vc.popoverPresentationController {
            popoverVC.sourceView = sourceView
            popoverVC.sourceRect = CGRect(x: sourceView.bounds.width / 2, y: sourceView.bounds.height / 2, width: 0, height: 0)
            rootVC?.present(vc, animated: true)
        }
    }
}
