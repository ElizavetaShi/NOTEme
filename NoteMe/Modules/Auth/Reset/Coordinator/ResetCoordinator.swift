//
//  ResetCoordinator.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 26.11.23.
//

import UIKit

final class ResetCoordinator: Coordinator {
    
//    private var vc: UIViewController?
  
    override func start() -> UIViewController {
        return ResetAssembler.make(coordinator: self)
    }
}

extension ResetCoordinator: ResetCoordinatorProtocol {
 
//    func showResetPasswordAlert() {
//        let alertController = UIAlertController(
//            title: "Password Reset",
//            message: "Do you want to reset your password?",
//            preferredStyle: .alert)
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//        alertController.addAction(cancelAction)
//
//        let resetAction = UIAlertAction(title: "Reset", style: .default) { [weak self] _ in
//          
//            self?.showSuccessAlert()
//        }
//        alertController.addAction(resetAction)
//
//        guard let vc else { return }
//        vc.present(alertController, animated: true)
//    }
//// Helper
//    
//    func showSuccessAlert() {
//        let successAlertController = UIAlertController(
//            title: "Success",
//            message: "Message was sent to your email.",
//            preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "OK", style: .default)
//        successAlertController.addAction(okAction)
//
//        guard let vc else { return }
//        vc.present(successAlertController, animated: true)
//    }
}
