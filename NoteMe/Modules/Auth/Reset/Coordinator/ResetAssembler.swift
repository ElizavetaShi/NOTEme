//
//  ResetAssembler.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 19.11.23.
//

import UIKit

final class ResetAssembler {
    
    private init() {}
    
    static func make(container: Container, coordinator: ResetCoordinatorProtocol) -> UIViewController {
        
        let authService: AuthService = container.resolve()
        let inputValidator: InputValidator = container.resolve()
        let alertService: AlertService = container.resolve()
        
        let vm = ResetVM(coordinator: coordinator,
                         authService: authService,
                         inputValidator: inputValidator,
                         alertService: alertService)
        return ResetVC(viewModel: vm)
    }
}
