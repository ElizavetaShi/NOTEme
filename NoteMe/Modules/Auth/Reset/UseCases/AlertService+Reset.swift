//
//  AlertService+Reset.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 16.12.23.
//

import UIKit

extension AlertService: ResetAlertServiceUseCase {
    func showResetAlert(title: String, message: String, okTitle: String) {
        showAlert(title: title, message: message, okTitle: okTitle, okHandler: nil)
    }
    
    
    
}
