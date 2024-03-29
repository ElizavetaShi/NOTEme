//
//  DateNotificationCoordinator.swift
//  NoteMe
//
//  Created by admin on 9.02.24.
//

import UIKit

final class DateNotificationCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    override func start() -> UIViewController {
        let vc = DateNotificationAssembler.make(coordinator: self, container: container)
        rootVC = vc
        return vc
    }
}

extension DateNotificationCoordinator: DateNotificationCoordinatorProtocol {}
