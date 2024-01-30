//
//  AlertService+Profile.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 28.01.24.
//

import Foundation

extension AlertService: ProfileAlertServiceUseCase {
    func showAlert(title: String?, message: String?, cancelTitle: String?, okTitle: String?, okHandler: (() -> Void)?) {
        showAlert(title: title, message: message, cancelTitle: cancelTitle, cancelHandler: nil, okTitle: okTitle, okHandler: okHandler)
    }
}
