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
    func showMenu(sender: UIView, delegate: any MenuPopoverDelegate) {
        let menu = MenuPopoverBuilder.buildAddMenu(delegate: delegate, sourceView: sender)
        rootVC?.present(menu, animated: true)
    }
    
    func openNewDateNotification() {
       let coordinator = DateNotificationCoordinator(container: container)
        children.append(coordinator)
        let vc = coordinator.start()
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            vc.dismiss(animated: true)
        }
        
        vc.modalPresentationStyle = .fullScreen
        rootVC?.present(vc, animated: true)
    }
    
    func openNewTimerNotification() {
        print("open new timer")
    }
    
    func openNewLocationNotification() {
        print("open new location")
    }
    
    
    
    
}
