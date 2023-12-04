//
//  AppCoordinator.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 21.11.23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private var window: UIWindow
    
    init(scene: UIWindowScene) {
        self.window = UIWindow(windowScene: scene)
    }
    
    func startApp() {
        
        //    FIXME: - TESTCODE
//                ParametersHelper.set(.authenticated, value: false)
//                ParametersHelper.set(.onboarded, value: false)
        
        if ParametersHelper.get(.onboarded) {
            openMainModule()
        } else if ParametersHelper.get(.authenticated) {
            openOnboardingModule()
        } else {
            openAuthModule()
        }
    }
    
    private func openAuthModule() {
        let coordinator = LoginCoordinator()
        children.append(coordinator)
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { $0 == coordinator }
            self?.startApp()
        }
        
        let vc = coordinator.start()
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    private func openOnboardingModule() {
        let coordinator = OnboardFirstStepCoordinator()
        children.append(coordinator)
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            self?.startApp()
        }
        let vc = coordinator.start()
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    private func openMainModule() {
        let tabBar = TabBarController()
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
    }
}


