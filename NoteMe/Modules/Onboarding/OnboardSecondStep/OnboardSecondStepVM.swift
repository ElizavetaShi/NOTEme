//
//  OnboardSecondStepVM.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 28.11.23.
//

import UIKit


protocol OnboardSecondStepCoordinatorProtocol: AnyObject {
    func finish()
    func dismissedByUser()
}

final class OnboardSecondStepVM: OnboardSecondStepViewModelProtocol {
    
    private weak var coordinator: OnboardSecondStepCoordinatorProtocol?
    
    init(coordinator: OnboardSecondStepCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
    
    func doneDidTap() {
        coordinator?.finish()
    }
    
    func dismissedByUser() {
        coordinator?.dismissedByUser()
    }
}