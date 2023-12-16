//
//  ResetAssembler.swift
//  NoteMe
//
//  Created by Elizaveta Shidlovskaya on 19.11.23.
//

import UIKit

final class ResetAssembler {
    
    private init() {}
    
    static func make(coordinator: ResetCoordinatorProtocol) -> UIViewController {
        
        let vm = ResetVM(coordinator: coordinator,
                         authService: AuthService(),
                         inputValidator: InputValidator(),
                         alertService: AlertService.current)
        return ResetVC(viewModel: vm)
    }
}
