//
//  ResetCoordinator.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 26.11.23.
//

import UIKit

final class ResetCoordinator: Coordinator {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }

    override func start() -> UIViewController {
        return ResetAssembler.make(container: container, coordinator: self)
    }
}

extension ResetCoordinator: ResetCoordinatorProtocol {
//    func showAlert(_ alert: UIAlertController) {
//        rootVC?.present(alert, animated: true)
//    }
}
