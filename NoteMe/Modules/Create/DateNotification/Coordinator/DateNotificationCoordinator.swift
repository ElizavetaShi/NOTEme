//
//  DateNotificationCoordinator.swift
//  NoteMe
//
//  Created by admin on 9.02.24.
//

import UIKit

final class DateNotificationCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    
    
    override func start() -> UIViewController {
        let vc = DateNotificationAssembler.make()
        rootVC = vc
        return vc
    }
}
