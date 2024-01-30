//
//  ProfileCoordinator.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 16.12.23.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        let vc = ProfileAssembler.make(container: container, coordinator: self)
        rootVC = vc
        return vc
    }
}

extension ProfileCoordinator: ProfileCoordinatorProtocol {}
