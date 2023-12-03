//
//  OnboardFirstStepVM.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 28.11.23.
//

import UIKit

protocol OnboardFirstStepCoordinatorProtocol: AnyObject {
    func openNextStep()
}

final class OnboardFirstStepVM: OnboardFirstStepViewModelProtocol {
    
    private weak var coordinator: OnboardFirstStepCoordinatorProtocol?
    
    init(coordinator: OnboardFirstStepCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
    
    func nextButtonDidTap() {
        coordinator?.openNextStep()
    }
}
